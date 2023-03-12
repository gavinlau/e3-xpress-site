<script setup lang="ts">
import { NConfigProvider } from 'naive-ui'
import { appName } from '~/constants'
if (process.client)
  console.log('\n' + ' %c 别光Clone,留个Star' + ' ' + ' %c https://github.com/webyang-male/nuxt3-edu' + '\n', 'color: #fadfa3; background: #030307; padding:5px 0;', 'background: #fadfa3; padding:5px 0;')
useHead({
  title: appName,
})
</script>

<template>
  <NConfigProvider inline-theme-disabled>
    <VitePwaManifest />
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </NConfigProvider>
</template>

<style>
html, body , #__nuxt{
  height: 100vh;
  margin: 0;
  padding: 0;
}

html.dark {
  background: #222;
  color: white;
}
</style>
