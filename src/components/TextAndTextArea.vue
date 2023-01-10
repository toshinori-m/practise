<template>
    <div>
      <input type="test" v-model="text" />
      <textarea v-model="textArea"></textarea>
    </div>
</template>
<script>
import { ref } from 'vue'
export default({
  setup () {
    const text = ref('')
    const textArea = ref('')

    return {
      text,
      textArea
    }
  }
})
</script>