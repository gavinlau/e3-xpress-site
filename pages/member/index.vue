<script setup lang="ts">
import { NButton } from 'naive-ui'
import commonAPI from '~~/utils/commonn'
const go = () => {
  commonAPI.getWeather({ key: 'cf5d655757b78657dc10f610a364ddaa', city: '无锡' }).then((res) => {
    console.log(res)
  }).catch((err) => {

  }).finally(() => {

  })
}

definePageMeta({
  layout: 'member',
})
</script>

<template>
  <div>
    <div>Member</div>
    <NButton @click="go">
      naive-ui
    </NButton>
  </div>
</template>
