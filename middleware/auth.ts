export default defineNuxtRouteMiddleware((to, from) => {
  console.log('auth.ts', 'defineNuxtRouteMiddleware')
  return true
})
