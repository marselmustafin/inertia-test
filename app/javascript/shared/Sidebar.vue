<template>
  <div class="flex flex-col w-64 text-gray-700 bg-white flex-shrink-0">
    <div class="flex-shrink-0 px-8 py-4 flex flex-row items-center justify-between">
      <a href="/animals" class="text-lg font-semibold tracking-widest text-gray-900 uppercase rounded-lg focus:outline-none focus:shadow-outline">Animals</a>
    </div>
    <nav class="flex-grow md:block px-4 pb-4 md:pb-0 md:overflow-y-auto">
      <Link class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 rounded-lg hover:text-gray-900
  focus:text-gray-900 hover:bg-green-600 focus:bg-green-600 focus:outline-none focus:shadow-outline"
  href="/animals">Animals list</Link>
      <Link class="block px-4 py-2 mt-2 text-sm font-semibold text-gray-900 rounded-lg hover:text-gray-900
  focus:text-gray-900 hover:bg-green-600 focus:bg-green-600 focus:outline-none focus:shadow-outline"
  href="/animals/new">Add new animal</Link>
    </nav>
  </div>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue'

export default {
  components: {
    Link
  }
}
</script>
