<template>
  <div>
    <input type="test" v-model="text" />
    <textarea v-model="textArea"></textarea>
    <!-- templateにinputタグなどでv-modelで紐付けるときも、text.valueではなくtextとします。 -->
  </div>
</template>
<script>
import { ref } from 'vue'
export default({
  setup () {
    const text = ref('') //リアクティブにするためref()を使用
    const textArea = ref('')

    return {
      text,
      textArea
    }
  }
})
</script>