<script setup lang="ts">
import type { Component } from 'vue'
import { h, ref } from 'vue'
import type { MenuOption } from 'naive-ui'
import { NButton, NIcon, NMenu } from 'naive-ui'

import {
  BookOutline as BookIcon,
} from '@vicons/ionicons5'

function renderIcon(icon: Component) {
  return () => h(NIcon, null, { default: () => h(icon) })
}

const menuOptions: MenuOption[] = [
  {
    label: () =>
      h(
        'a',
        {
          href: 'https://baike.baidu.com/item/%E4%B8%94%E5%90%AC%E9%A3%8E%E5%90%9F',
          target: '_blank',
          rel: 'noopenner noreferrer',
        },
        '且听风吟',
      ),
    key: 'hear-the-wind-sing',
    icon: renderIcon(BookIcon),
  },
  {
    label: '1973年的弹珠玩具',
    key: 'pinball-1973',
    icon: renderIcon(BookIcon),
    children: [
      {
        label: '鼠',
        key: 'rat',
      },
    ],
  },
  {
    label: '寻羊冒险记',
    key: 'a-wild-sheep-chase',
    icon: renderIcon(BookIcon),

  },
  {
    label: '舞，舞，舞',
    key: 'dance-dance-dance',
    icon: renderIcon(BookIcon),

  },
]
const activeKey = ref(null)
</script>

<template>
  <div class="navbar">
    <div class="flex bg-red-400 w-10/12 max-w-[64em]">
      <NButton text class="!text-xl !font-bold">
        IT编程
      </NButton>
      <NMenu v-model:value="activeKey" class="hidden lg:flex" mode="horizontal" :options="menuOptions" />
      <NMenu v-model:value="activeKey" class="lg:hidden" mode="vertical" :options="menuOptions" accordion />
      <div class="flex-1" />
      <NButton text mx-3>
        搜索
      </NButton>
      <NButton text>
        登陆
      </NButton>
    </div>
  </div>
  <div class="h-[80px]" />
</template>

<style>
.navbar {
    z-index: 1000;
    @apply flex flex-col justify-center  items-center  bg-green-300 h-[80px] fixed top-0 left-0 right-0 shadow-sm
}
</style>
