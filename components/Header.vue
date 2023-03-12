<script setup lang="ts">
import type { Component } from 'vue'
import { h, ref } from 'vue'
import type { MenuOption } from 'naive-ui'
import { NAutoComplete, NButton, NIcon, NMenu, NPopover } from 'naive-ui'

import {
  MenuOutline,
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
          href: '/',
        },
        '首页',
      ),
    key: 'hear-the-wind-sing',
  },
  {
    label: '媒体',
    key: 'pinball-1973',
    children: [
      {
        label: '音频',
        key: 'a-wild-sheep-chase',
      },
      {
        label: '视频',
        key: 'a-wild-sheep-chase',
      },
      {
        label: '图库',
        key: 'a-wild-sheep-chase',
      },
    ],
  },
  {
    label: '下载',
    key: 'a-wild-sheep-chase',
  },

  {
    label: '文集',
    key: 'a-wild-sheep-chase',
  },

  {
    label: '物语',
    key: 'a-wild-sheep-chase',
  },
  {
    label: '直播',
    key: 'a-wild-sheep-chase',
  },
  {
    label: () => h('a', { href: '/blogs/1' }, '博客'),
    key: 'blogs',
  },
]
const activeKey = ref(null)
</script>

<template>
  <div class="navbar">
    <div class="flex w-full  lg:max-w-8/12 p-5">
      <NButton text class="!text-xl !font-bold">
        XPress
      </NButton>
      <div class="hidden lg:flex">
        <NMenu v-model:value="activeKey" mode="horizontal" :options="menuOptions" />
      </div>
      <div class="flex-1 flex justify-center">
        <NAutoComplete class="w-45" clear-after-select blur-after-select default-value="" />
      </div>

      <div class="lg:hidden flex flex-col justify-center">
        <NPopover style="padding: 0; width: 288px" placement="bottom-end" display-directive="show" trigger="click">
          <template #trigger>
            <NIcon size="20" style="margin-left: 12px">
              <MenuOutline />
            </NIcon>
          </template>
          <div style="overflow: auto; max-height: 79vh">
            <NMenu v-model:value="activeKey" mode="vertical" :options="menuOptions" />
          </div>
        </NPopover>
      </div>

      <NButton text class="hidden lg:flex">
        登陆
      </NButton>
    </div>
  </div>
  <div class="h-[80px]" />
</template>

<style>
.navbar {
  z-index: 1000;
  @apply flex flex-col justify-center items-center bg-green-300 h-[60px] fixed top-0 left-0 right-0 shadow-sm
}
</style>
