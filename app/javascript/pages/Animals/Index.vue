<template>
  <Layout>
    <Head title="Animals" />
    <div class="flex justify-center mt-32 w-full h-1/3">
      <div class="w-2/3">
        <div class="bg-green-400 p-6 rounded-md shadow overflow-x-auto">
          <div class="flex w-full rounded-md mb-2 py-2 px-6 bg-white">
            <span class="mr-4">
              <Link href="/animals" :class="isGender('') ? 'font-bold' : ''" :only="['animals']">All ({{ all_count }})</Link>
            </span>
            <span class="mr-4 text-bold">
              <Link href="/animals?gender=boy" :class="isGender('boy') ? 'font-bold' : ''" :only="['animals']">Boys ({{ boys_count }})</Link>
            </span>
            <span class="mr-4 text-bold">
              <Link href="/animals?gender=girl" :class="isGender('girl') ? 'font-bold' : ''" :only="['animals']">Girls ({{ girls_count }})</Link>
            </span>
            <span class="mr-4 text-bold">
              <Link href="/animals?gender=nb" :class="isGender('nb') ? 'font-bold' : ''" :only="['animals']">Non-binary ({{ nb_count }})</Link>
            </span>
          </div>
          <table class="w-full rounded-md bg-white whitespace-nowrap">
            <tr class="h-8 text-left font-bold">
              <th class="px-6 pt-6 pb-4">Name</th>
              <th class="px-6 pt-6 pb-4">Kind</th>
              <th class="px-6 pt-6 pb-4">Gender</th>
              <th class="px-6 pt-6 pb-4" colspan="2"></th>
            </tr>
            <tr h-8 v-for="animal in animals" :key="animal.id" class="hover:bg-gray-100 focus-within:bg-gray-100">
              <td class="border-t">
                <Link class="px-6 py-4 flex items-center focus:text-indigo-500"
                :href="`/animals/${animal.id}`">
                  {{ animal.name }}
                  <icon v-if="animal.deleted_at" name="trash" class="flex-shrink-0 w-3 h-3 fill-gray-400 ml-2" />
                </Link>
              </td>
              <td class="border-t">
                <Link class="px-6 py-4 flex items-center" :href="`/animals/${animal.id}`" tabindex="-1">
                  {{ animal.kind }}
                </Link>
              </td>
              <td class="border-t">
                <Link class="px-6 py-4 flex items-center" :href="`/animals/${animal.id}`" tabindex="-1">
                  {{ animal.gender }}
                </Link>
              </td>
              <td class="border-t w-px">
                <Link class="px-4 flex items-center" :href="`/animals/${animal.id}`" tabindex="-1">
                  <icon name="cheveron-right" class="block w-6 h-6 fill-gray-400" />
                </Link>
              </td>
            </tr>
            <tr v-if="animals.length === 0">
              <td class="border-t px-6 py-4" colspan="4">No animals found.</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
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
      animals: Array,
      all_count: Number,
      boys_count: Number,
      girls_count: Number,
      nb_count: Number
    },
    methods: {
      isGender(gender) {
        const urlSearchParams = new URLSearchParams(window.location.search);
        const params = Object.fromEntries(urlSearchParams.entries());

        return gender === (params.gender || '')
      }
    }
  }
</script>

