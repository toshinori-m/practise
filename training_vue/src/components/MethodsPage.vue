<template>
  <p>{{ value }}</p>
  <button v-on:click="addValue(d)">減らす!!</button>
</template>

<script>
export default({
  data() {
    return {
      value: 100,
      d: -10,
    }
  },
  methods: {
    addValue(d) {
      this.value += d;
      this.adjustment();
    },
    adjustment() {
      if (this.value < 0) {
          this.value = 0;
      }
    }
  }
});
</script>

<style scoped>
</style>
