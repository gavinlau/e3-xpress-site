<script setup lang="ts">
// https://www.cnblogs.com/shuiche/p/15727864.html

import { NButton } from 'naive-ui'
import { useBookMenusApi } from '~~/apis/user'
const route = useRoute()
const nuxtApp = useNuxtApp()
// nuxtApp.provide('hello', (name) => `Hello ${name}!`)
// console.log(nuxtApp.$hello('name')) // Prints "Hello name!"
const runtimeConfig = useRuntimeConfig()
console.log(runtimeConfig.apiSecret)
const go = () => {
  navigateTo('/b')
}

const {
  data,
  error,
  pending,
} = await useBookMenusApi(32)

console.log(data)

console.log('index2.vue')
// DOM
onBeforeMount(() => {
  console.log('a.vue onBeforeMount')
})
onMounted(() => {
  console.log('a.vue onMounted')
})
// date update
onBeforeUpdate(() => {
  console.log('a.vue onBeforeUpdate')
})

onUpdated(() => {
  console.log('a.vue onUpdated')
})
// Element Destroy
onBeforeUnmount(() => {
  console.log('a.vue onBeforeUnmount')
})
onUnmounted(() => {
  console.log('a.vue onUnmounted')
})
// Keep-Alive
onActivated(() => {
  console.log('a.vue onActivated')
})
onDeactivated(() => {
  console.log('a.vue onDeactivated')
})

onErrorCaptured(() => {
  console.log('a.vue onErrorCaptured')
})
// Debug hooks
onRenderTriggered(() => {
  console.log('a.vue onRenderTriggered')
})
onRenderTracked(() => {
  console.log('a.vue onRenderTracked')
})

definePageMeta({
  middleware: 'auth',
  validate: async (route) => {
    // Check if the id is made up of digits
    // return /^\d+$/.test(route.params.id)
    console.log('a.vue validate')
    return true
  },
})
</script>

<template>
  <div class="h-1100 mx-auto mt-16">
    <nuxt-link to="/b">
      nuxt-link b
    </nuxt-link><br>
    <a href="/b">b href</a><br>
    <NButton @click="go">
      navigateTo
    </NButton>
  </div>
</template>
