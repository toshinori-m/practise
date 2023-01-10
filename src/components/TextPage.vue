<template>
  <div>
    <text-and-text-area ref="texts" /> 
    <!-- ref="texts"で子コンポーネントを参照できるようにref属性を付与 -->
    <button @click="testAction">test</button>
  </div>
</template>

<script>
import TextAndTextArea from './TextAndTextArea.vue'
import { onMounted, ref } from 'vue'
// import { ref } from 'vue'

export default {
  components: {
    TextAndTextArea
  },
  setup () {
    const texts = ref(null) //setup関数の中でref(null)を代入した変数を作成。また、ref="texts"としているのでconst textsとする。
    const testAction = () => {
      console.log(texts.value.text); //ref関数のため、アクセスするにはtexts.valueのようにvalueを使います。
      console.log(texts.value.textArea);
    }
    onMounted(() => {
      console.log(texts.value);
    })
    return {
      texts,
      testAction
    }
  }
}
</script>