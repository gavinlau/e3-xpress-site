<script setup lang="ts">
import { NBreadcrumb, NBreadcrumbItem } from 'naive-ui'

const blog10 = useBlogItem('blog10', 'content10')
const blog11 = useBlogItem('blog11', 'content11')
// https://nuxt.com/docs/getting-started/data-fetching#data-fetching
// https://www.cnblogs.com/bingcola/p/16499094.html
const ret = await useList('course', '')
const route = useRoute()
// console.log(ret.data.value?.rows)
const blogs = [blog10]

useHead({ title: '博客' })
onMounted(async () => {
  // await navigateTo('/search')
  // const t = new Date().getTime()
  // await navigateTo({
  //   path: '/blogs',
  //   query: { page: t },
  // })
  // await navigateTo('https://nuxt.com', {
  //   external: true,
  // })
})

const cat = ref('course')// route.params
const title = route.meta.title
const {
  page,
  limit,
  pending,
  error,
  refresh,
  rows,
  total,
  handlePageChange,
} = await usePage(({ page, limit }) => {
  console.log('blogs.usePage', page)
  const query = {
    page,
    limit,
  }
  return useList(cat.value as string, query)
})

// console.log('...row', rows.value)
</script>

<template>
  <NBreadcrumb class="mb-5">
    <NBreadcrumbItem>
      <nuxt-link to="/">
        首页
      </nuxt-link>
    </NBreadcrumbItem>
    <NBreadcrumbItem>
      博客
    </NBreadcrumbItem>
  </NBreadcrumb>
  <div class="flex justify-between bg-green-300 p-2 lg:p-4">
    <div id="content" class="bg-green-500 flex flex-col  w-full lg:w-17/24">
      <BlogList :entries="rows" />
      <div class="flex justify-center items-center mt-5 mb-10">
        <!-- <NPagination size="large" :item-count="total" :page="page" :page-size="limit" :on-update:page="handlePageChange" /> -->
      </div>
    </div>
    <div id="right" class="bg-yellow-400 hidden lg:flex lg:flex-col lg:w-7/24 ml-4 h-screen">
      <div class="flex flex-col p-3">
        <div class="text-size-4 border-blue border-l-3 pl-3 mb-5">
          最新文章
        </div>
        <BlogList :entries="blogs" :full="false" />
      </div>
    </div>
  </div>
</template>

<style>

</style>
