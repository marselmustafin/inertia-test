<template>
  <Layout>
    <Head title="Users" />
    <Link href="/users/new">New user</Link>
    <ul id="user-list">
      <li v-for="user in users" :key="user.id">
        <Link :href="`/users/${user.id}`">
          {{ user.name }}
        </Link>
      </li>
    </ul>
  </Layout>
</template>

<script>
  import Layout from '../Layout'
  import { Head, Link } from '@inertiajs/inertia-vue'

  export default {
    components: {
      Head,
      Layout,
      Link,
    },
    props: {
      users: Array,
    },
  }
</script>
