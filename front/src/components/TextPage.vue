<template>
  <div id="app">
    <text-and-text-area ref="texts" />
    <button @click="testAction">test</button>
  </div>
</template>

<script>
import axios from 'axios'
import TextAndTextArea from './TextAndTextArea.vue'

export default {
  name: 'App',
  components: {
    TextAndTextArea
  },
  methods: {
    async testAction () {
      axios.post('http://localhost:3000/api/v1/users', {
        content2: this.$refs.texts.content2,
        // テキストボックスの入力値が参照できる
        content3: this.$refs.texts.content3
        // テキストエリアの入力値が参照できる
          }
        )
      .then (res => {
        console.log(this.$refs.texts.content2); 
        // テキストボックスの入力値が参照できる
        console.log(this.$refs.texts.content3); 
        // テキストエリアの入力値が参照できる
        this.users = res.data}
      )
      .catch (error => console.log({ error })
      )
    }
  }
}
</script>