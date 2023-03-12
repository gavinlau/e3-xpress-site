<script setup lang="ts">
import { useBookMenusApi } from '~~/apis/user'

const route = useRoute()
const nuxtApp = useNuxtApp()
// nuxtApp.provide('hello2', (name) => `Hello2 ${name}!`)
// console.log(nuxtApp.$hello2('name')) // Prints "Hello name!"

const {
  data,
  error,
  pending,
} = await useBookMenusApi(32)

console.log('b.vue')
// DOM
onBeforeMount(() => {
  console.log('b.vue onBeforeMount')
})
onMounted(() => {
  console.log('b.vue onMounted')
})
// date update
onBeforeUpdate(() => {
  console.log('b.vue onBeforeUpdate')
})

onUpdated(() => {
  console.log('b.vue onUpdated')
})
// Element Destroy
onBeforeUnmount(() => {
  console.log('b.vue onBeforeUnmount')
})
onUnmounted(() => {
  console.log('b.vue onUnmounted')
})
// Keep-Alive
onActivated(() => {
  console.log('b.vue onActivated')
})
onDeactivated(() => {
  console.log('b.vue onDeactivated')
})

onErrorCaptured(() => {
  console.log('b.vue onErrorCaptured')
})
// Debug hooks
onRenderTriggered(() => {
  console.log('b.vue onRenderTriggered')
})
onRenderTracked(() => {
  console.log('b.vue onRenderTracked')
})

definePageMeta({

  validate: async (route) => {
    // Check if the id is made up of digits
    // return /^\d+$/.test(route.params.id)
    console.log('b.vue validate')
    return true
  },
})
</script>

<template>
  <div class="h-1100 mx-auto mt-16">
    page abc
  </div>
</template>
