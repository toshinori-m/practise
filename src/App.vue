<script>
export default {
  data() {
    return {}
  },
  methods: {},
}
</script>

<template>
  <h1>My ToDo App</h1>
  <input type="text" /><button>追加</button><button>完了済みを削除する</button>
  <ul>
    <li>
      <input type="checkbox" checked /><span class="todo-done"
        >Vueをマスターする</span
      >
    </li>
    <li><input type="checkbox" /><span>牛乳を買う</span></li>
    <li><input type="checkbox" /><span>家賃を払う</span></li>
  </ul>
</template>

<style>
body {
  background-color: #eee;
}

.todo-done {
  text-decoration: line-through;
}
</style>