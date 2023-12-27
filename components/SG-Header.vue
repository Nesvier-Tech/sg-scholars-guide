<template>
  <nav class="bg-sg-white border-gray-200 dark:bg-gray-900 shadow-md">
    <div class="max-w-screen-xl flex flex-wrap items-center justify-between mx-auto p-1">
      <nuxt-link to="login" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="@/assets/sg-logo.png" class="h-12" alt="SG Logo" />
        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">Scholar's Guide</span>
      </nuxt-link>
      <button data-collapse-toggle="navbar-default" type="button"
        class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
        aria-controls="navbar-default" aria-expanded="false">
        <span class="sr-only">Open main menu</span>
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 17 14">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M1 1h15M1 7h15M1 13h15" />
        </svg>
      </button>
      <div class="hidden w-full md:flex md:w-auto bg-white p-2 shadow-md rounded-md justify-center" id="navbar-default">
        <ul
          class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
          <li>
            <nuxt-link to="quiz"
              class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">
              Take Quiz</nuxt-link>
          </li>
          <li>
            <nuxt-link to="upload"
              class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Upload
              Quiz</nuxt-link>
          </li>
        </ul>
      </div>
      <div class="hidden w-full md:block md:w-auto" id="navbar-default">
        <ul
          class="font-medium flex flex-col p-4 md:p-0 mt-4 border border-gray-100 rounded-lg bg-gray-50 md:flex-row md:space-x-8 rtl:space-x-reverse md:mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">
          <li>
            <nuxt-link to="profile"
              class="block py-2 px-3 text-gray-900 rounded hover:bg-gray-100 md:hover:bg-transparent md:border-0 md:hover:text-sg-red md:p-0 dark:text-white md:dark:hover:text-sg-red dark:hover:bg-gray-700 dark:hover:text-white md:dark:hover:bg-transparent">Account
              Name Here</nuxt-link>
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