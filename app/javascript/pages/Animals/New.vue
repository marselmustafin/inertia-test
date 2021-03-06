<template>
  <Layout>
    <div class="flex-1 px-4 pt-32">
      <div class="flex justify-center">
        <div class="px-6 py-4 h-2/5 rounded bg-white overflow-hidden shadow-lg max-w-xl">
          <div class="font-bold text-xl mb-6">New animal</div>
          <form @submit.prevent="submit" class="w-full max-w-lg">
            <div class="flex flex-wrap -mx-3 mb-6">
              <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                <label class="label" for="grid-name">Name</label>
                <input v-model="form.name" class="input" :class="{ error: isErrorKey('name') }" id="grid-name" type="text" placeholder="Jane">
                <span v-if="errors.name" class="text-xs text-red-500">{{ errors.name[0] }}</span>
              </div>
              <div class="w-full md:w-1/2 px-3">
                <label class="label" for="grid-kind">Kind</label>
                <input v-model="form.kind" class="input" :class="{ error: isErrorKey('kind') }" id="grid-kind" type="text" placeholder="Dog">
                <div v-if="errors.kind" class="text-xs text-red-500">{{ errors.kind[0] }}</div>
              </div>
            </div>
            <div class="flex flex-wrap -mx-3 mb-6">
              <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                <label class="label" for="grid-age">Age</label>
                <input v-model="form.age" class="input" :class="{ error: isErrorKey('age') }" id="grid-age" type="number" min="0" max="100" placeholder="0">
                <div v-if="errors.age" class="text-xs text-red-500">{{ errors.age[0] }}</div>
              </div>
              <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                <label class="label" for="grid-animal_class">Class</label>
                <div class="relative">
                  <select v-model="form.animal_class" class="input" :class="{ error:
                    isErrorKey('animal_class') }" id="grid-state">
                    <option v-for="animal_class in animal_classes" :value="animal_class">{{
                    capitalize(animal_class) }}</option>
                  </select>
                  <div v-if="errors.animal_class" class="text-xs text-red-500">{{
                    errors.animal_class[0] }}</div>
                  <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                    <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                      <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                    </svg>
                  </div>
                </div>
              </div>
            </div>
            <div class="flex flex-wrap -mx-3 mb-6">
              <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                <label class="label" for="grid-photo">photo</label>
                <input id="grid-photo" type="file" @input="form.photo = $event.target.files[0]" />
              </div>
            </div>
            <div class="flex justify-center my-4">
              <button type="submit" class="btn btn-blue">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </Layout>
</template>

<script>
import Layout from '../Layout'
import { Inertia } from '@inertiajs/inertia'

export default {
  components: {
    Layout,
  },
  props: {
    animal_classes: {
      type: Array,
      default: () => [],
    },
    errors: {
      type: Object,
      default: () => {
        return {}
      },
    },
  },
  data() {
    return {
      form: {
        name: null,
        age: null,
        animal_class: null,
        kind: null,
        photo: null
      },
    }
  },
  methods: {
    submit() {
      Inertia.post('/animals', { animal: this.form })
    },
    capitalize(s) {
      return s.charAt(0).toUpperCase() + s.slice(1);
     },
    isErrorKey(k){
      return this.errors?.[k]?.length
    }
  },
}
</script>
<style>
  .label {
    @apply block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2;
  }
  .btn {
    @apply font-bold py-2 px-4 rounded;
  }
  .btn-blue {
    @apply bg-blue-500 text-white;
  }
  .btn-blue:hover {
    @apply bg-blue-700;
  }
  .input {
    @apply appearance-none block w-full bg-gray-100 text-gray-700 border rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500
  }
  .error {
    @apply border border-red-500 mb-2
  }
</style>
