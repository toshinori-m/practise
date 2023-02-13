<template>
  <div>
    <input type="test" v-model="content2" />
    <textarea v-model="content3"></textarea>
  </div>
</template>
<script>
export default({
  data(){
    return {
      content2: '',
      content3: ''
    }
  }
})
</script>