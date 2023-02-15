<template>
  <div>
    <h1>My ToDo App</h1>
    <HelloWorld :test="name"></HelloWorld>
    <input type="text" v-model="content1" />
    <button @click="addUsers">追加</button>
    <button @click="clearDoneUsers">完了済みを削除する</button>
    <p v-if="todos.length === 0">ToDoがまだありません</p>
    <ul v-else>
      <li v-for="todo in todos" :key="todo">
        <input type="checkbox" v-model="todo.isDone" /><span
          :class="{ 'todo-done': todo.isDone }"
          >{{ todo.text }}</span
        >
      </li>
    </ul>
    <div v-for="user in users" :key="user.id">
      <p>id = {{ user.id }}</p>
      <p>content1 = {{ user.content1 }}</p>
      <p>content2 = {{ user.content2 }}</p>
      <p>content3 = {{ user.content3 }}</p>
      <p>content4 = {{ user.content4 }}</p>
    </div>
    <CreatedMounted />
    <MethodsPage />
    <ComputedPage />
    <WatchPage />
    <TextPage />
    <EmitPage />
  </div>
</template>
<script>
import axios from 'axios'
import HelloWorld from '../components/HelloWorld.vue'
import MethodsPage from '../components/MethodsPage.vue'
import ComputedPage from '../components/ComputedPage.vue'
import WatchPage from '../components/WatchPage.vue'
import TextPage from '../components/TextPage.vue'
import CreatedMounted from '../components/CreatedMounted.vue'
import EmitPage from '../components/EmitPage.vue'

export default {
  components: { HelloWorld,MethodsPage,ComputedPage,WatchPage,TextPage,CreatedMounted,EmitPage },
  data() {
    return {
      users:[],
      content1: '',
      todos: [],
      name: 'ABC'
    }
  },
  methods: {
    async getUsers () {
      try {
        const res = await axios.get('http://localhost:3000/api/v1/users')
        if (!res) {
          new Error('contents一覧を取得できませんでした')
        }
        console.log({ res })
        this.users = res.data
      } catch (error) {
        console.log({ error })
      }
    },
    addUsers () {
      axios.post('http://localhost:3000/api/v1/users', {
        content1: this.content1
      })
      .then (res => {
        this.getUsers()
        this.users = res.data}
      )
      .catch (error => console.log({ error })
      )
      
      if (!this.content1) return alert('文字を入力してください')
      this.todos.push({
        isDone: false,
        text: this.content1,
      })
      this.content1 = ''
    },
    clearDoneUsers (content){
      if (this.todos.filter((todo) => !todo.isDone)){
        this.deleteTodo(content)
        return
      }
    },
    // async deleteTodo () {
    //   if (!this.content1 == null) return
    // // 完了済みを削除するボタンを押すとチェックボックスがオンになっているToDoが削除される
    //   this.todos = this.todos.filter((todo) => !todo.isDone)
    //   try {
    //     const res = await axios.delete('http://localhost:3000/api/v1/users/${usersId}'
    //     )
    //     console.log({ res })
    //     return res
    //   } catch (error) {
    //     console.log({ error })
    //   }
    // },
  },
  mounted() {
    this.getUsers()
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
