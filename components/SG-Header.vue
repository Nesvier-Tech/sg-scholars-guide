<template>
  <nav class="border-gray-200 shadow-md bg-sg-white dark:bg-gray-900">
    <div class="flex flex-wrap items-center justify-between max-w-screen-xl p-1 mx-auto">

      <!-- Logo Section -->
      <nuxt-link to="/login" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="@/assets/sg-logo.png" class="h-12" alt="SG Logo" />
        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Scholar's Guide</span>
      </nuxt-link>
      <button data-collapse-toggle="navbar-default" type="button"
        class="inline-flex items-center justify-center w-10 h-10 p-2 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
        aria-controls="navbar-default" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M1 1h15M1 7h15M1 13h15" />
        </svg>
      </button>

      <!-- Quiz Section -->
      <div class="justify-center w-full p-2 bg-white rounded-md shadow-md md:flex md:w-auto" id="navbar-default">
        <ul
          class="flex flex-col p-4 mt-4 font-medium border border-gray-100 rounded-lg md:p-0 bg-gray-50 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
          <li>
            <nuxt-link to="/dashboard"
              class="block px-3 py-2 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
              Take Quiz</nuxt-link>
          </li>
          <li>
            <nuxt-link to="/upload"
              class="block px-3 py-2 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
              Upload Quiz</nuxt-link>
          </li>
        </ul>
      </div>

      <!-- Profile Section -->
      <div class="w-full md:block md:w-auto bg-sg-white" id="navbar-default">
        <ul
          class="flex items-center p-4 mt-4 font-medium border border-gray-100 rounded-lg md:p-0 bg-sg-white md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
          <li>
            <nuxt-link to="/profile"
              class="block px-3 py-2 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
              Account Name Here</nuxt-link>
          </li>
          <li>
            <img src="@/assets/cute-puppy.jpg" class="rounded-full w-9 h-9" alt="Account Picture" />
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
  
<script setup>

</script>