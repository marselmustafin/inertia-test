<template>
  <Layout>
    <Head :title="animal.name" />
    <div class="flex justify-center mt-32 rounded-md w-full">
      <div class="h-52 rounded bg-white shadow-lg">
        <div class="px-6 py-4">
          <div class="font-bold text-xl mb-2">{{ animal.name }}</div>
          <p class="text-gray-700 text-base">
            <ul>
              <li>Kind: {{ animal.kind }}</li>
              <li>Age: {{ animal.age }}</li>
              <li>Gender: {{ animal.gender }}</li>
            </ul>
          </p>
          <Link as="button" type="button" method="delete" :href="`/animals/${animal.id}`"
          class="mt-4 btn btn-red">Delete animal</Link>
        </div>
      </div>
    </div>
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
      animal: Object,
    },
  }
</script>

<style>
  .btn {
    @apply font-bold py-2 px-4 rounded;
  }
  .btn-red {
    @apply hover:bg-red-100 border-2 border-red-500 text-red-500;
  }
</style>
