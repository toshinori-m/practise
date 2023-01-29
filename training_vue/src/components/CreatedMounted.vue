<template>
    <div>現在{{hoge}}です</div>
</template>

<script>
import { onMounted } from 'vue';

export default {
  data() {
    return {
      hoge:"a"
    }
  },
  created() {
    console.log('hoge is: ' + this.hoge)
  },
  mounted() {
    this.hoge = "mounted"
  },
  setup() {
    onMounted(() => {
      console.log('マウントされた時に実行されます')
    })
  }
} 
</script>

<style scoped>
</style>
