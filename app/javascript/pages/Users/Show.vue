<template>
  <Layout>
    <Head :title="user.name" />
    <ul>
      <li>Name - {{ user.name }}</li>
      <li>Email - {{ user.email }}</li>
      <li>Age - {{ user.age }}</li>
      <li>Gender - {{ user.gender }}</li>
    </ul>
  </Layout>
</template>

<script>
  import Layout from '../Layout'
  import { Head } from '@inertiajs/inertia-vue'

  export default {
    components: {
      Head,
      Layout,
    },
    props: {
      user: Object,
    },
  }
</script>
