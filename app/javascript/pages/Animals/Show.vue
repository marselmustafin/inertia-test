<template>
  <Layout>
    <Head :title="animal.name" />
      <div class="flex justify-center h-screen w-full pt-32">
        <div class="bg-white shadow-md mx-3 rounded flex justify-around items-center overflow-hidden flex-row h-72">
        <img
          class="h-1/2 w-full sm:h-full sm:w-1/2 object-cover"
          :src="this.animal.photo_url || require('../../images/placeholder.jpeg')"
          alt="image"
        />
        <div class="flex-1 w-full flex flex-col items-baseline justify-around h-1/2 pl-6 sm:h-full sm:items-baseline sm:w-1/2">
          <div class="flex flex-col justify-start items-baseline">
            <h1 class="font-bold text-lg mb-0">
              {{ animal.name }}
            </h1>
          </div>
          <p class="text-base">
            <ul>
              <li><b>Kind:</b> {{ animal.kind }}</li>
              <li><b>Age:</b> {{ animal.age }}</li>
              <li><b>Class:</b> {{ animal.animal_class }}</li>
            </ul>
          </p>
          <div class="w-full flex justify-between items-center">
            <Link as="button" type="button" method="delete" :href="`/animals/${animal.id}`"
            class="text-xs btn btn-red">Delete animal</Link>
          </div>
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
    @apply py-2 px-4 rounded;
  }
  .btn-red {
    @apply hover:bg-red-100 border-2 border-red-500 text-red-500;
  }
</style>
