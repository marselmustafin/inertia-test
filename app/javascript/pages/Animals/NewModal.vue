<template>
  <modal name="new-animal-modal">
    <form @submit.prevent="submit" class="w-full max-w-lg">
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="label" for="grid-name">
            Name
          </label>
          <input v-model="form.name" class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-name" type="text" placeholder="Jane">
          <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
        </div>
        <div class="w-full md:w-1/2 px-3"> <label class="label" for="grid-kind">
            Kind
          </label>
          <input v-model="form.kind" class="appearance-none block w-full bg-gray-200 text-gray-700 border
          border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white
          focus:border-gray-500" id="grid-kind" type="text" placeholder="Dog">
        </div>
      </div>
      <div class="flex flex-wrap -mx-3 mb-2">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="label" for="grid-city">
            Age
          </label>
          <input v-model="form.age" class="appearance-none block w-full bg-gray-200 text-gray-700 border
          border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white
          focus:border-gray-500" id="grid-city" type="number" placeholder="0">
        </div>
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="label" for="grid-state">
            Gender
          </label>
          <div class="relative">
            <select v-model="form.gender" class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">
              <option v-for="gender in genders" :value="gender">{{ capitalize(gender) }}</option>
            </select>
            <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
              <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
            </div>
          </div>
        </div>
      </div>
      <button type="submit">Submit</button>
    </form>
  </modal>
</template>

<script>
import Layout from '../Layout'

export default {
  components: {
    Layout,
  },
  props: {
    genders: Array,
  },
  data() {
    return {
      form: {
        name: null,
        age: null,
        gender: null,
        kind: null
      },
    }
  },
  methods: {
    submit() {
      this.$inertia.post('/animals', this.form)
    },
    capitalize(s) {
      return s.charAt(0).toUpperCase() + s.slice(1);
    },
    mounted() {
      $this.modal.show('new-animal-modal')
    }
  },
}
</script>
<style>
  .label {
    @apply block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2;
  }
</style>
