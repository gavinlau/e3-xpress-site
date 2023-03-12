// 搜索和分页获取数据功能抽离
export async function usePage(initListCallback: Function) {
  const route = useRoute()
  const page = ref(parseInt(route.params.page || 1))
  const limit = ref(2)
  console.log('usePage.initListCallback', page.value)
  const {
    data,
    pending,
    error,
    refresh,
  } = await initListCallback({
    page: page.value,
    limit: limit.value,
  })

  const rows = computed(() => data.value?.rows ?? [])
  const total = computed(() => data.value?.count ?? 0)

  const handlePageChange = async (p: number) => {
    console.log('handlePageChange', route.params)
    console.log('handlePageChange query', route.query)
    // await navigateTo('/search')
    await navigateTo({
      params: {
        ...route.params,
        page: p,
      },
      query: {
        ...route.query,
      },
    })
  }

  return {
    page,
    limit,
    data,
    pending,
    error,
    refresh,
    rows,
    total,
    handlePageChange,
  }
}
