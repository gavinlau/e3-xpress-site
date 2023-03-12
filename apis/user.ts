// 查看电子书章节 /book/menus?id=32
export function useBookMenusApi(id: any) {
  return useHttpGet('bookMenus', `/book/menus?id=${id}`, {
    lazy: true,
  })
}
