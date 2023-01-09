<template>
  <div>
    <p>{{ shareId }}</p>
    <p>{{ shareUrl }}</p>
    <button @click="changeShareId">IDを更新</button>
    <p>{{ message }}</p>
  </div>
</template>

<script>
export default({
  data() {
    return {
      shareId: "abcde",
      message: "",
    }
  },
  computed: {
    shareUrl() {
      return "https://example.com/?id=" + this.shareId;
    }
  },
  methods: {
    changeShareId() {
      this.shareId = Math.random().toString(32).substring(2);
    }
  },
  watch: {
    shareId() {
      this.message = "";
      setTimeout(() => {
        this.message = "更新完了!";
      }, 1000);
    },
  }
});
</script>

<style scoped>
</style>