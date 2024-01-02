<template>
    <div class="container mx-auto p-4">
      <!-- Profile Section -->
      <div class="profile bg-gray-50 shadow rounded overflow-hidden border border-gray-300 p-4 flex flex-col items-start">
        <div class="header self-stretch flex justify-end items-center gap-2 p-2">
          <div class="dots-horizontal w-5 h-5 relative">
            <div class="vector w-4 h-1 bg-gray-500 absolute" style="left: 3px; top: 50%"></div>
          </div>
        </div>
        <div class="avatar-name self-stretch flex flex-col items-center gap-3">
          <img class="avatar w-24 h-24 rounded-full shadow-md" src="https://via.placeholder.com/96x96" />
          <div class="name-role self-stretch flex flex-col items-center gap-1">
            <div class="name text-xl font-semibold text-gray-900">Marc Charles Torezar</div>
            <div class="role text-gray-500">@noobinator69</div>
          </div>
        </div>
        <div class="buttons self-stretch flex justify-center items-center gap-3 pt-6">
          <button class="edit-profile bg-yellow-400 text-white px-3 py-2 rounded flex items-center gap-2 text-sm">Edit Profile</button>
        </div>
      </div>
  
      <!-- CourseOverview Section -->
      <div class="course-overview mt-10 relative">
        <div class="rectangle1 bg-gray-50 shadow rounded p-4">
          <div class="text-black font-bold text-3xl mb-4">Course Overview</div>
          <div class="carousel rounded overflow-hidden">
            <!-- Placeholder for carousel items -->
            <div class="flex justify-center items-stretch space-x-4 my-8">
                <!-- Use of `flex-grow` and `flex-basis-0` ensures each card grows equally -->
                <Card
                class="flex-grow flex-basis-0"
                title="Reading Comprehension"
                subtext="UPCAT Subtest"
                description="Reading comprehension is the ability to process written text, understand its meaning."
                />
                <Card
                class="flex-grow flex-basis-0"
                title="Mathematics"
                subtext="UPCAT Subtest"
                description="Basic and intermediate algebra, geometry, statistics, and in some cases, a bit of trigonometry."
                />
                <Card
                class="flex-grow flex-basis-0"
                title="Science"
                subtext="UPCAT Subtest"
                description="Earth science and basic astronomy, biology, basic chemistry, and basic physics."
                />
                <Card
                class="flex-grow flex-basis-0"
                title="Language Proficiency"
                subtext="UPCAT Subtest"
                description="Vocabulary, synonyms and antonyms, spelling, correct usage and grammar."
                />
            </div>
            <!-- Repeat for additional cards -->
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import Card from '~/components/Card.vue';
  export default {
    name: 'Dashboard',
    components: {
      Card
    },
    // Data, methods, etc. might go here
  };
  </script>
  
  <style scoped>
  /* Specific styles can go here */
  </style>
  