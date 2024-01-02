<!-- TODO: Refactor this shit. Use SFCs. -->

<!-- EmailVerification.vue -->
<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="max-w-md w-full bg-white p-8 shadow-md rounded-md">
      <h2 class="text-3xl font-semibold mb-6">Email Verification</h2>

      <p class="mb-4">Thank you for signing up! A verification email has been sent to {{ email }}. Please check your email
        and click on the verification link to activate your account.</p>

      <router-link to="/login" class="block text-center text-blue-500 hover:underline">Return to Login</router-link>
    </div>
  </div>
</template>

<script>
import { Account } from "appwrite";

const client = getClient();
const account = new Account(client);

export default {
  data() {
    return {
      email: '',
    };
  },
  methods: {
    async resetPassword() {
      try {
        // TODO: Change this to our own domain.
        const promise = account.createVerification('https://example.com');
        console.log(`sending email verification... (${this.email})`);

        promise.then(function (response) {
          console.log(response);
          alert('Email verification sent!');
        }, function (error) {
          console.log(error);
          alert('Email verification failed!');
        });
      } catch (error) {
        console.error('Email verification failed', error);
        alert1('Email verification failed!');
        // Handle error.
      }
    },
  },
};
</script>

<style>
/* You can customize the styles further based on your design preferences */
</style>
