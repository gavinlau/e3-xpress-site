<script setup lang="ts">
import { NCard, NEllipsis, NGrid, NGridItem } from 'naive-ui'
const props = withDefaults(defineProps<{
  entries?: BlogItem[]
  full?: boolean
  ratio?: string
}>(), {
  item: () => useBlogItem('defalut', 'default'),
  full: () => true,
})

const el = ref(null)

onMounted(() => {
  console.log('onMounted', window.screen.width)
})

useResizeObserver(el, (entries) => {
  console.log('window.screen.width', window.screen.width)
  const entry = entries[0]
  const { width, height } = entry.contentRect
})
</script>

<template>
  <NGrid ref="el" cols="1">
    <NGridItem v-for="(entry, index) in entries" :key="index" :item="entry" class="mb-3 sm:flex w-full bg-yellow-200">
      <div class="w-full sm:w-6/24 relative overflow-hidden">
        <div v-if="full" class="absolute top-3 left-2 z-1 bg-gray-500 text-white rounded">
          <span class="p-3">版本发布</span>
        </div>
        <div v-if="full" class="w-full h-45 sm:h-full min-h-20  rounded hover:scale-150 duration-200" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" />
        <div v-else class="w-full h-45 sm:h-full min-h-20  rounded" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" />
        <!-- <div class="w-full pb-10/16 rounded hover:scale-150 duration-200" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" /> -->
      </div>
      <NCard class="w-full sm:w-18/24">
        <NEllipsis v-if="full" :line-clamp="1" :tooltip="false" class="font-bold text-size-4">
          {{ entry.title }}
        </NEllipsis>
        <NEllipsis v-else :line-clamp="2" :tooltip="false">
          {{ entry.title }}
        </NEllipsis>

        <NEllipsis v-if="full" :line-clamp="2" :tooltip="false">
          创业本就是九死一生的事，与其在大浪中为企业的生存挣扎，及时将自己的努力和心血卖出变现，不失为一种选择。但是，创业者卖掉自己的公司，这件创业本就是九死一生的事，与其在大浪中为企业的生存挣扎，及时将自己的努力和心血卖出变现，不失为一种选择。但是，创业者卖掉自己的公司，这件
        </NEllipsis>
        <template v-if="full" #footer>
          <div>
            footer
          </div>
        </template>
      </NCard>
    </NGridItem>
  </NGrid>
</template>
