<script setup lang="ts">
import { NCarousel, NGrid, NGridItem } from 'naive-ui'
definePageMeta({
  validate: async (route) => {
    // Check if the id is made up of digits
    // return /^\d+$/.test(route.params.id)
    console.log('index.vue validate')
    return true
  },
})
</script>

<template>
  <NCarousel show-arrow autoplay class="h-[400px] mb-6">
    <img
      class="carousel-img rounded cursor-pointer"
      src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel1.jpeg"
    >
    <img
      class="carousel-img rounded cursor-pointer"
      src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel2.jpeg"
    >
    <img
      class="carousel-img rounded cursor-pointer"
      src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel3.jpeg"
    >
    <img
      class="carousel-img rounded cursor-pointer"
      src="https://naive-ui.oss-cn-beijing.aliyuncs.com/carousel-img/carousel4.jpeg"
    >
  </NCarousel>
  <NGrid :x-gap="12" :y-gap="8" :cols="4">
    <NGridItem>
      <div class="light-green" />
    </NGridItem>
    <NGridItem>
      <div class="green" />
    </NGridItem>
    <NGridItem>
      <div class="light-green" />
    </NGridItem>
    <NGridItem>
      <div class="green" />
    </NGridItem>
    <NGridItem>
      <div class="light-green" />
    </NGridItem>
    <NGridItem>
      <div class="green" />
    </NGridItem>
    <NGridItem>
      <div class="light-green" />
    </NGridItem>
    <NGridItem>
      <div class="green" />
    </NGridItem>
  </NGrid>
</template>

<style scoped>
.carousel-img {
  width: 100%;
  height: 400px;
  object-fit: cover;
}
.light-green {
  height: 108px;
  background-color: rgba(0, 128, 0, 0.12);
}
.green {
  height: 108px;
  background-color: rgba(0, 128, 0, 0.24);
}
</style>
