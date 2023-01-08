<template>
  <h1>My ToDo App</h1>
  <HelloWorld :test="name"></HelloWorld>
  <input type="text" v-model="newTodoText" />
  <button @click="addTodo">追加</button>
  <!-- 完了済みを削除するボタンを押すとチェックボックスがオンになっているToDoが削除される -->
  <button @click="clearDoneTodos">完了済みを削除する</button>
  <p v-if="todos.length === 0">ToDoがまだありません</p>
  <ul v-else>
    <li v-for="todo in todos" :key="todo">
      <input type="checkbox" v-model="todo.isDone" /><span
        :class="{ 'todo-done': todo.isDone }"
        >{{ todo.text }}</span
      >
    </li>
  </ul>
  <div>現在{{hoge}}です</div>
</template>
<script>
import HelloWorld from '../components/HelloWorld.vue'
export default {
  components: { HelloWorld },
  data() {
    return {
      newTodoText: '',
      todos: [],
      name: 'ABC',
      hoge:"a"
    }
  },
  methods: {
    addTodo() {
      // フォームに文字が未入力時に追加ボタンを押しても、アラートが表示されリストに追加されない
      if (!this.newTodoText) return alert('文字を入力してください')
      this.todos.push({
        isDone: false,
        text: this.newTodoText,
      })
      // ToDoに追加したタイミングでフォームの文字列はクリアされる
      this.newTodoText = ''
    },
    // 完了済みを削除するボタンを押すとチェックボックスがオンになっているToDoが削除される
    clearDoneTodos() {
      this.todos = this.todos.filter((todo) => !todo.isDone)
    },
  },
  created() {
    console.log('hoge is: ' + this.hoge)
  },
  mounted() {
    this.hoge = "mounted"
  }
}
</script>

<style>
body {
  background-color: #eee;
}

.todo-done {
  text-decoration: line-through;
}
</style>
