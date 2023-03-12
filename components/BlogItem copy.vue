<script setup>
import { NGrid, NGridItem } from 'naive-ui'
</script>

<template>
  <NGrid cols="24">
    <NGridItem :span="6">
      <div class="w-full h-full relative overflow-hidden">
        <div class="absolute top-3 left-2 z-1 bg-gray-500 text-white rounded">
          <span class="p-3">版本发布</span>
        </div>
        <div class="w-full h-full rounded hover:scale-150 duration-200" style="background-image: url('/blog10.jpg'); background-size: cover; background-repeat: no-repeat; background-position: center;" />
      </div>
    </NGridItem>
    <NGridItem :span="18" class="relative">
      <div class="m-3 font-bold text-size-4 z-100">
        <NEllipsis :line-clamp="2" :tooltip="false">
          卖掉公司后，创业者还要战胜这七大心魔
        </NEllipsis>
      </div>
      <div class="hidden lg:flex m-3">
        <NEllipsis :line-clamp="3" :tooltip="false">
          创业本就是九死一生的事，与其在大浪中为企业的生存挣扎，及时将自己的努力和心血卖出变现，不失为一种选择。但是，创业者卖掉自己的公司，这件创业本就是九死一生的事，与其在大浪中为企业的生存挣扎，及时将自己的努力和心血卖出变现，不失为一种选择。但是，创业者卖掉自己的公司，这件
        </NEllipsis>
      </div>
      <div class="w-full px-3 bg-green-700 hidden md:flex absolute bottom-0 z-0">
        <div class="flex-grow">
          2018.12.1
        </div>
        <div class="text-right">
          阅读
        </div>
      </div>
    </NGridItem>
  </NGrid>
</template>
