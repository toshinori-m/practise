<template>
  <div id="app">
    <text-and-text-area ref="texts" />
    <button @click="testAction">test</button>
  </div>
</template>

<script>
import TextAndTextArea from './TextAndTextArea.vue'

export default {
  name: 'App',
  components: {
    TextAndTextArea
  },
  mounted(){
    console.log(this.$refs.texts);
  },// このmountedは説明だけで書いているので、実際必要ない。
  methods: {
    testAction() {
      console.log(this.$refs.texts.text); 
      // テキストボックスの入力値が参照できる
      console.log(this.$refs.texts.textArea); 
      // テキストエリアの入力値が参照できる
    }
  }
}
</script>