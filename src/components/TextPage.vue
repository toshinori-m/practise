<template>
  <div>
    <text-and-text-area ref="texts" />
    <button @click="testAction">test</button>
  </div>
</template>

<script>
import TextAndTextArea from './TextAndTextArea.vue'
import { onMounted, ref } from 'vue'

export default {
  components: {
    TextAndTextArea
  },
  setup () {
    const texts = ref(null)
    const testAction = () => {
      console.log(texts.value.text);
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