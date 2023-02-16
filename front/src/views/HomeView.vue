<template>
  <div>
    <h1>My user App</h1>
    <HelloWorld :test="name"></HelloWorld>
    <input type="text" v-model="content1" />
    <button @click="addUsers">追加</button>
    <button @click="clearDoneUsers()">完了済みを削除する</button>
    <p v-if="users.length === 0">userがまだありません</p>
    <ul v-else>
      <li v-for="user in users" :key="user">
        <input type="checkbox" v-model="user.isDone" />
          <span :class="{ 'user-done': user.isDone }"
          >id = {{ user.id }}</span
        >
        <p>content1 = {{ user.content1 }}</p>
        <p>content2 = {{ user.content2 }}</p>
        <p>content3 = {{ user.content3 }}</p>
        <p>content4 = {{ user.content4 }}</p>
      </li>
    </ul>
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
      users: [],
      content1: '',
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
      this.users.push({
        isDone: false,
        text: this.content1,
      })
      this.content1 = ''
    },
    clearDoneUsers (){
      if (!this.content1 == null) return
      // this.users = this.users.filter((user) => !user.isDone)
      const user = this.users.filter((user) => user.isDone)
        console.log(user)
      if (user.id === this.users.id){
        console.log(user.id)
        this.deleteUsers(user)
        return
      }
    },
    deleteUsers () {
      axios.delete('http://localhost:3000/api/v1/users/${userId}'
        )
      .then (res => {
        this.getUsers()
        this.users = res.data}
      )
      .catch (error => console.log({ error })
      )
    },
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
