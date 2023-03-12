<script setup>

</script>

<template>
  <main class="flex flex-col bg-blue-600">
    <!-- <div class="bg-green-300 w-full flex justify-center">
        <div class="bg-cyan-700 w-10/12 max-w-[1000px]">
          header
        </div>
      </div> -->
    <Header />
    <div class="bg-red-400 w-full flex justify-center">
      <div class="bg-cyan-100 flex w-10/12 max-w-lg min-h-screen">
        <slot />
      </div>
    </div>
    <div class="bg-yellow-200">
      footer
    </div>
  </main>
</template>
