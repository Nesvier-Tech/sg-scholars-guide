<template>
    <nuxt-link :to="{ name: 'quiz' }" class="no-underline">
      <div class="flex flex-col rounded overflow-hidden shadow-lg bg-white hover:bg-gray-100 transition-colors">
        <div class="px-6 py-4 bg-red-500 text-white">
          <div class="font-bold text-xl mb-2">{{ title }}</div>
          <p class="text-base">
            {{ subtext }}
          </p>
        </div>
        <div class="px-6 py-4 flex-grow">
          <p class="text-gray-700 text-base">
            {{ description }}
          </p>
        </div>
      </div>
    </nuxt-link>
  </template>
  
  <script>
  export default {
    props: {
      title: String,
      subtext: String,
      description: String
    }
  }
  </script>
  
  <style scoped>
  /* Style for hover state and transition */
  </style>
  