<script setup>
import { breakpointsTailwind, useBreakpoints } from '@vueuse/core'
//  sm	640px	@media (min-width: 640px) { ... }
//  md	768px	@media (min-width: 768px) { ... }
//  lg	1024px	@media (min-width: 1024px) { ... }
//  xl	1280px	@media (min-width: 1280px) { ... }
//  2xl	1536px	@media (min-width: 1536px) { ... }
const breakpoints = useBreakpoints(breakpointsTailwind)
const smWidth = breakpointsTailwind.sm
const sm = breakpoints.smaller('sm')
const sme = breakpoints.smallerOrEqual('sm')
const md = breakpoints.between('sm', 'md')
const lg = breakpoints.between('md', 'lg')
const xl = breakpoints.between('lg', 'xl')
const xxl = breakpoints.between('xl', '2xl')
const xxxl = breakpoints['2xl']
</script>

<template>
  <main>
    {{ sme }}
  </main>
</template>
