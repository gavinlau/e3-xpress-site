<script setup lang="ts">
import { NCard, NEllipsis, NGrid, NGridItem } from 'naive-ui'
const props = withDefaults(defineProps<{
  item?: BlogItem
  lftWidth?: number
  rgtWidth?: number
  full?: boolean
  ratio?: string
}>(), {
  item: () => useBlogItem('defalut', 'default'),
  lftWidth: () => 8,
  rgtWidth: () => 16,
  full: () => true,
})
const lftw = ref(8)
const rgtw = ref(16)
const el = ref(null)
const loading = ref(true)

onMounted(() => {
  console.log('onMounted', window.screen.width)
  loading.value = false
})

useResizeObserver(el, (entries) => {
  console.log('window.screen.width', window.screen.width)
  const entry = entries[0]
  const { width, height } = entry.contentRect
  if (window.screen.width < 640) {
    lftw.value = 24
    rgtw.value = 24
  }
  else {
    lftw.value = 8
    rgtw.value = 16
  }
})
</script>

<template>
  <NGrid ref="el" cols="24" class="mb-3" item-responsive responsive="screen">
    <NGridItem :span="lftw">
      <!-- <NSpace v-if="loading" vertical>
        <NSkeleton text class="w-full" />
        <NSkeleton text class="w-full" />
        <NSkeleton text class="w-full" />
        <NSkeleton text class="w-full" />
        <NSkeleton text class="w-1/2" />
      </NSpace> -->
      <div class="w-full h-full relative overflow-hidden">
        <div v-if="full" class="absolute top-3 left-2 z-1 bg-gray-500 text-white rounded">
          <span class="p-3">版本发布</span>
        </div>
        <div v-if="full" class="w-full h-45 sm:h-full min-h-20  rounded hover:scale-150 duration-200" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" />
        <div v-else class="w-full h-45 sm:h-full min-h-20  rounded" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" />
        <!-- <div class="w-full pb-10/16 rounded hover:scale-150 duration-200" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" /> -->
      </div>
    </NGridItem>
    <NGridItem :span="rgtw">
      <NCard>
        <NEllipsis v-if="full" :line-clamp="1" :tooltip="false" class="font-bold text-size-4">
          卖掉公司后，创业者还要战胜这七大心魔
        </NEllipsis>
        <NEllipsis v-else :line-clamp="2" :tooltip="false">
          卖掉公司后，创业者还要战胜这七大心魔
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
