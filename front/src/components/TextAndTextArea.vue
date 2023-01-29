<template>
  <div>
    <input type="test" v-model="text" />
    <textarea v-model="textArea"></textarea>
  </div>
</template>
<script>
export default({
  data(){
    return {
      text: '',
      textArea: '',
    }
  }
})
</script>