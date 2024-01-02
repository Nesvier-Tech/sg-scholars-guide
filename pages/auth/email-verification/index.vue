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
// export default {
//   data() {
//     return {
//       email: '', // The email to display (you can pass it as a parameter when navigating to this route)
//     };
//   },
//   created() {
//     // You may want to handle the email verification process here, such as checking a verification token.
//     // Ensure that this component receives the email as a parameter when navigating to this route.
//     // For demonstration purposes, this example assumes that the email is provided in the component's data.
//   },
// };
</script>

<style>
/* You can customize the styles further based on your design preferences */
</style>
