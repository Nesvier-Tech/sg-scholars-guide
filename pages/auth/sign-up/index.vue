<!-- TODO: Refactor this shit. Use SFCs. -->

<!-- Signup.vue -->
<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="max-w-md w-full bg-white p-8 shadow-md rounded-md">
      <h2 class="text-3xl font-semibold mb-6">Sign Up</h2>

      <form @submit.prevent="signup">
        <div class="mb-4">
          <label for="username" class="block text-gray-700 text-sm font-medium mb-2">Username</label>
          <input v-model="username" type="text" id="username" name="username"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
            required>
        </div>

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

        <div class="mb-4">
          <label for="confirmPassword" class="block text-gray-700 text-sm font-medium mb-2">Confirm Password</label>
          <input v-model="confirmPassword" type="password" id="confirmPassword" name="confirmPassword"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
            required>
        </div>

        <button type="submit"
          class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Sign
          Up</button>
      </form>

      <!-- Already have an account Link -->
      <div class="mt-4 text-center">
        <p class="text-sm">Already have an account? <router-link to="/auth/login"
            class="text-blue-500 hover:underline">Login
            here.</router-link></p>
      </div>
    </div>
  </div>
</template>

<script>
import { Account, ID } from "appwrite";

const client = getClient();
const account = new Account(client);

export default {
  data() {
    return {
      username: '',
      email: '',
      password: '',
      confirmPassword: '',
    };
  },
  methods: {
    async signup() {
      try {
        // Check if passwords match
        if (this.password !== this.confirmPassword) {
          console.error('Passwords do not match');
          alert('Are you f***ing blind?! Passwords do not match!');
          // Handle error, e.g., show an error message to the user
          return;
        }

        // Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. 
        // Can't start with a special char. Max length is 36 chars.
        // Temporary use the Date.now() as the user ID (for now).
        let userID = Date.now().toString();

        const promise = account.create(userID, this.email, this.password, this.username);
        console.log(`creating user... (${this.email})`);

        promise.then(function (response) {
          console.log(response); // Success
          alert('User created!');
        }, function (error) {
          console.log(error); // Failure
          alert(`User creation failed!\n${error.message}`);
        });
      } catch (error) {
        console.error('Signup Failed', error);
        alert('Signup failed!');
        // Handle signup failure, show error messages, etc.
      }
    },
  },
};
</script>

<style>
/* You can customize the styles further based on your design preferences */
</style>
