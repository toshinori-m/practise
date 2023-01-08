<template>
  <div>
    <p>{{ shareId }}</p>
    <p>{{ shareUrl }}</p>
    <button @click="changeShareId">IDを更新</button>
  </div>
</template>

<script>
export default({
  data() {
    return {
      shareId: "abcde",
    }
  },
  computed: {
    shareUrl() {
      return "https://example.com/?id=" + this.shareId;
    }
  },
  methods: {
    changeShareId() {
      // ランダム文字列を生成
      this.shareId = Math.random().toString(32).substring(2);
    },
  }
});
</script>

<style scoped>
</style>
