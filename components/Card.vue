<template>
    <nuxt-link :to="{ name: 'quiz' }" class="no-underline">
      <div class="flex flex-col overflow-hidden transition-colors rounded shadow-lg bg-sg-white hover:bg-gray-100">
        <div class="px-6 py-4 text-white bg-sg-red">
          <div class="mb-2 text-xl font-bold">{{ title }}</div>
          <p class="text-base">
            {{ subtext }}
          </p>
        </div>
        <div class="flex-grow px-6 py-4">
          <p class="text-base text-gray-700">
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
  