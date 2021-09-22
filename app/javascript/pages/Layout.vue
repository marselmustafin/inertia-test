<template>
  <main>
    <div class="flex w-screen">
      <Sidebar></Sidebar>
      <div class="flex w-full h-screen bg-green-200">
        <slot />
      </div>
    </div>
    <Component v-bind="$page.props" v-if="$root.modalComponent" :is="$root.modalComponent" />
  </main>
</template>

<script>
import { Link } from '@inertiajs/inertia-vue'
import Sidebar from '../shared/Sidebar'

export default {
  components: {
    Link,
    Sidebar
  }
}
</script>
