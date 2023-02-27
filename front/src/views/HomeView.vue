<template>
  <div>
    <h1>My user App</h1>
    <input type = "text" v-model = "content1"/>
    <button @click = "addUsers">追加</button>
    <button @click = "clearDoneUsers">完了済みを削除する</button>
    <TextPage />
    <EmitPage />
    <p v-if = "users.length === 0">userがまだありません</p>
    <ul v-else>
      <li v-for = "user in users" :key = "user">
        <input type = "checkbox" v-model = "user.isDone"/>
        <span :class = "{ 'user-done': user.isDone }">
          id = {{ user.id }}
        </span>
        <p>content1 = {{ user.content1 }}</p>
        <p>content2 = {{ user.content2 }}</p>
        <p>content3 = {{ user.content3 }}</p>
        <p>content4 = {{ user.content4 }}</p>
      </li>
    </ul>
  </div>
</template>
<script>
import axios from 'axios'
import TextPage from '../components/TextPage.vue'
import EmitPage from '../components/EmitPage.vue'

export default{
  components: { TextPage,EmitPage },
  data() {
    return {
      users: [],
      content1: ''
    }
  },
  methods:{
    getUsers() {
      axios.get('http://localhost:3000/api/v1/users')
      .then(res => {
        console.log({ res })
        this.users = res.data}
      )
      .catch (error => console.log({ error })
      )
    },
    addUsers() {
      axios.post('http://localhost:3000/api/v1/users', {
        content1: this.content1
      })
      .then (() => {
        this.getUsers()
      })
      .catch (error => console.log({ error })
      )
      this.alert()
    },
    alert() {
      if(!this.content1) return alert('文字を入力してください')
      this.users.push({
        isDone: false,
        text: this.content1,
      })
      this.content1 = ''
    },
    clearDoneUsers() {
      if (this.content1.length !== 0) return
      this.done_filter()
    },
    done_filter() {
      const user = this.users.filter((user) => user.isDone)
      this.is_done(user)
    },
    is_done(user) {
      for(let i = 0; i < user.length; i++) {
        const userIsDone = user[i]
        if(user.id === this.users.id) {
          this.deleteUsers(userIsDone.id)
        }
      }
    },
    deleteUsers(userIsDoneId) {
      axios.delete('http://localhost:3000/api/v1/users/' + userIsDoneId)
      .then (() => {
        this.getUsers()
      })
      .catch (error => console.log({ error })
      )
    }
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

.user-done {
  text-decoration: line-through;
}
</style>
