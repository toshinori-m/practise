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
           .then(res => this.users = res.data)
           .catch(error => console.log({ error }))
    },
    addUsers() {
      if(!this.content1) return alert('文字を入力してください')
      
      axios.post('http://localhost:3000/api/v1/users', {
        content1: this.content1
      }).then(() => this.getUsers())
        .catch(error => console.log({ error }))
      this.content1 = ''
    },
    clearDoneUsers() {
      const isDone_users = this.users_filter()
      for(let i = 0; i < isDone_users.length; i++) {
        const userIsDone = isDone_users[i]
        this.deleteUsers(userIsDone.id)
      }
    },
    users_filter() {
      return this.users.filter(users => users.isDone)
    },
    deleteUsers(userIsDoneId) {
      axios.delete('http://localhost:3000/api/v1/users/' + userIsDoneId)
           .then(() => this.getUsers())
           .catch(error => console.log({ error }))
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
