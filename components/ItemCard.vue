<script setup>
import {
  NCard,
} from 'naive-ui'

const props = defineProps({
  item: Product,
})

// 偷懒404处理
// let reg = /^(http|https):\/\//;
// let img_404 = "https://unpkg.com/hassan-assets@1.0.22/img/404.png";

const open = () => {
  let path = ''
  // 课程详情
  if (['course', 'media', 'video', 'audio'].includes(props.item.type))
    path = `/detail/course/${props.item.id}`

  // 专栏详情
  else if (props.item.type == 'column')
    path = `/detail/column/${props.item.id}`

  // 直播详情
  else if (props.item.type == 'live')
    path = `/detail/live/${props.item.id}`

  // 秒杀和拼团
  if (props.item.group_id)
    path = `${path}?group_id=${props.item.group_id}`

  if (props.item.flashsale_id)
    path = `${path}?flashsale_id=${props.item.flashsale_id}`

  navigateTo(path)
}
</script>

<template>
  <NCard class="cursor-pointer mb-5 shadow-md !border-0" footer-style="padding:0;" @click="open">
    <template #cover>
      <!-- nuxt3特性：服务端渲染会导致404图片资源加载失败，可实验性尝试ClientOnly API -->
      <UiImage v-if="item?.thumbnail" :src="item.thumbnail" class="w-[100%] h-[150px]" />
      <!-- <UiImage v-if="item?.cover" :src="reg.test(item.cover) ? item.cover : img_404" class="w-[100%] h-[150px]"/> -->
    </template>
    <div class="pt-2">
      <span class="font-bold w-full truncate font-semibold">{{ item.title }}</span>
    </div>
    <div class="mt-2 flex items-end">
      <Price :value="item.price" />
      <Price :value="item.originPrice" through class="ml-2" />
    </div>
  </NCard>
</template>
