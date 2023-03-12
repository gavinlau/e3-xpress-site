import { setup } from '@css-render/vue3-ssr'
import { createDiscreteApi } from 'naive-ui'
import { defineNuxtPlugin } from '#app'

export default defineNuxtPlugin((nuxtApp) => {
  console.log('navie-ui.ts', 'defineNuxtPlugin')
  if (process.server) {
    const { collect } = setup(nuxtApp.vueApp)
    const originalRenderMeta = nuxtApp.ssrContext?.renderMeta
    nuxtApp.ssrContext = nuxtApp.ssrContext || {}
    nuxtApp.ssrContext.renderMeta = () => {
      if (!originalRenderMeta) {
        return {
          headTags: collect(),
        }
      }
      const originalMeta = originalRenderMeta()
      if ('then' in originalMeta) {
        return originalMeta.then((resolvedOriginalMeta) => {
          return {
            ...resolvedOriginalMeta,
            headTags: resolvedOriginalMeta.headTags + collect(),
          }
        })
      }
      else {
        return {
          ...originalMeta,
          headTags: originalMeta.headTags + collect(),
        }
      }
    }
  }
  const bar: any = ref(null)

  nuxtApp.hook('app:mounted', (e) => {
    console.log('navie-ui.ts', 'app:mounted')
    if (!bar.value) {
      const { loadingBar } = createDiscreteApi(['loadingBar'])
      bar.value = loadingBar
    }
  })
  nuxtApp.hook('page:start', (e) => {
    console.log('navie-ui.ts', 'app:start')
    bar.value?.start()
  })
  nuxtApp.hook('page:finish', (e) => {
    console.log('navie-ui.ts', 'app:finish')
    setTimeout(() => bar.value?.finish(), 300)
  })
  nuxtApp.hook('app:error', (e) => {
    console.log('navie-ui.ts', 'app:error')
    if (process.client)
      setTimeout(() => bar.value?.finish(), 300)
  })
})
