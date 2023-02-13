<template>
  <div>
    <input type="text" v-model="content4">
    <button @click="onClickButton">ボタン</button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data() {
    return {
      content4: "Hello!!",
    };
  },
  methods: {
    async onClickButton () {
      try {
        const res = await axios.post('http://localhost:3000/api/v1/users', {
          content4: this.content4
          }
        )
        this.$emit("onClick", this.content4);
        console.log({ res })
        return res
      } catch (error) {
        console.log({ error })
      }
    }
    // onClickButton() {
    //   this.$emit("onClick", this.message);
    // }
  }
}
</script>