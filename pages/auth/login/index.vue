<!-- TODO: Refactor this shit. Use SFCs. -->

<!-- Login.vue -->
<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="max-w-md w-full bg-white p-8 shadow-md rounded-md">
      <h2 class="text-3xl font-semibold mb-6">Login</h2>

      <form @submit.prevent="login">
        <div class="mb-4">
          <label for="email" class="block text-gray-700 text-sm font-medium mb-2">Email Address</label>
          <input v-model="email" type="email" id="email" name="email"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
            required>
        </div>

        <div class="mb-4">
          <label for="password" class="block text-gray-700 text-sm font-medium mb-2">Password</label>
          <input v-model="password" type="password" id="password" name="password"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
            required>
        </div>

        <!-- Forgot Password Link -->
        <div class="mb-4 text-right">
          <a href="/auth/forgot-password" class="text-sm text-blue-500 hover:underline">Forgot Password?</a>
        </div>

        <button type="submit"
          class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Login</button>
      </form>

      <!-- Create Account Link -->
      <div class="mt-4 text-center">
        <p class="text-sm">Don't have an account? <a href="/auth/sign-up" class="text-blue-500 hover:underline">Create
            now.</a></p>
      </div>
    </div>
  </div>
</template>

<script>
// export default {
//   data() {
//     return {
//       email: '',
//       password: '',
//     };
//   },
//   methods: {
//     async login() {
//       try {
//         // Use Appwrite Auth API to perform login
//         const response = await this.$appwrite.account.createSession(this.email, this.password);

//         // If login is successful, you may redirect to another page or perform additional actions
//         console.log('Login Successful', response);
//       } catch (error) {
//         console.error('Login Failed', error);
//         // Handle login failure, show error messages, etc.
//       }
//     },
//   },
// };
</script>

<style>
/* You can customize the styles further based on your design preferences */
</style>
