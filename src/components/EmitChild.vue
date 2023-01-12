<template>
  <button @click="onClickButton">ボタン</button>
</template>

<script>
export default {
  data() {
    return {
      message: "Hello!!",
    };
  },
  methods: {
    onClickButton() {
      this.$emit("onClick", this.message);
    }
  }
}
</script>