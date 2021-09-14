<template>
  <Layout>
    <form @submit.prevent="submit">
      <label for="name">Name:</label>
      <input id="name" v-model="form.name" />
      <!-- <div v-if="errors.first_name">{{ errors.first_name }}</div> -->
      <label for="email">Email:</label>
      <input id="email" v-model="form.email" />
      <label for="age">Age:</label>
      <input id="age" v-model="form.age" />
      <label for="gender">Gender:</label>
      <input id="gender" v-model="form.gender" />
      <button type="submit">Submit</button>
    </form>
  </Layout>
</template>

<script>
import Layout from '../Layout'

export default {
  components: {
    Layout,
  },
  data() {
    return {
      form: {
        name: null,
        email: null,
        age: null,
        gender: null
      },
    }
  },
  methods: {
    submit() {
      this.$inertia.post('/users', this.form)
    },
  },
}
</script>
