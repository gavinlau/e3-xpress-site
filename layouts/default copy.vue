<script setup>
import { NButton } from 'naive-ui'
</script>

<template>
  <main class="py-20 px-10 text-center">
    <slot />
    <Footer />
    <div class="mt-5 mx-auto text-center opacity-25 text-sm">
      <NButton>naive-ui</NButton>
    </div>
  </main>
</template>
