<!-- ForgotPassword.vue -->
<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-100">
    <div class="max-w-md w-full bg-white p-8 shadow-md rounded-md">
      <h2 class="text-3xl font-semibold mb-6">Forgot Password</h2>

      <form @submit.prevent="resetPassword">
        <div class="mb-4">
          <label for="email" class="block text-gray-700 text-sm font-medium mb-2">Email Address</label>
          <input v-model="email" type="email" id="email" name="email"
            class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring focus:border-blue-300"
            required>
        </div>

        <button type="submit"
          class="w-full bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-blue-300">Reset
          Password</button>
      </form>

      <!-- Back to Login Link -->
      <div class="mt-4 text-center">
        <p class="text-sm">Remember your password? <router-link to="/auth/login"
            class="text-blue-500 hover:underline">Login
            here.</router-link></p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
    };
  },
  methods: {
    async resetPassword() {
      try {
        // Use Appwrite Auth API to initiate the password reset process
        await this.$appwrite.account.createRecovery(this.email);

        // Provide feedback to the user, e.g., show a success message or redirect to a confirmation page
        console.log('Password reset initiated successfully');
      } catch (error) {
        console.error('Password reset failed', error);
        // Handle password reset failure, show error messages, etc.
      }
    },
  },
};
</script>

<style>
/* You can customize the styles further based on your design preferences */
</style>
