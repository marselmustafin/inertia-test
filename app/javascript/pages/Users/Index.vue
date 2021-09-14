<template>
  <Layout>
    <Head title="Users" />
    <div class="bg-white rounded-md shadow overflow-x-auto">
      <table class="w-full whitespace-nowrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Name</th>
          <th class="px-6 pt-6 pb-4">Email</th>
          <th class="px-6 pt-6 pb-4" colspan="2"></th>
        </tr>
        <tr v-for="user in users" :key="user.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
          <td class="border-t">
            <Link class="px-6 py-4 flex items-center focus:text-indigo-500" :href="`/users/${user.id}`">
              <img v-if="user.photo" class="block w-5 h-5 rounded-full mr-2 -my-2" :src="user.photo" />
              {{ user.name }}
              <icon v-if="user.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
            </Link>
          </td>
          <td class="border-t">
            <Link class="px-6 py-4 flex items-center" :href="`/users/${user.id}`" tabindex="-1">
              {{ user.email }}
            </Link>
          </td>
          <td class="border-t w-px">
            <Link class="px-4 flex items-center" :href="`/users/${user.id}`" tabindex="-1">
              <icon name="cheveron-right" class="block w-6 h-6 fill-gray-400" />
            </Link>
          </td>
        </tr>
        <tr v-if="users.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No users found.</td>
        </tr>
      </table>
    </div>
    <Link href="/users/new">New user</Link>
  </Layout>
</template>

<script>
  import Layout from '../Layout'
  import { Head, Link } from '@inertiajs/inertia-vue'
  import Icon from '../../shared/Icon'

  export default {
    components: {
      Head,
      Layout,
      Link,
      Icon
    },
    props: {
      users: Array,
    },
  }
</script>
