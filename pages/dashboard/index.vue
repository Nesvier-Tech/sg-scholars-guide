<template>
  <div class="container p-4 mx-auto">
    <!-- Profile Section -->
    <div class="flex flex-col items-start p-4 overflow-hidden border border-gray-300 rounded shadow profile bg-gray-50">
      <div class="flex items-center self-stretch justify-end gap-2 p-2 header">
        <div class="relative w-5 h-5 dots-horizontal">
          <div class="absolute w-4 h-1 bg-gray-500 vector" style="left: 3px; top: 50%"></div>
        </div>
      </div>
      <div class="flex flex-col items-center self-stretch gap-3 avatar-name">
        <img class="w-24 h-24 rounded-full shadow-md avatar" src="https://via.placeholder.com/96x96" />
        <div class="flex flex-col items-center self-stretch gap-1 name-role">
          <div class="text-xl font-semibold text-gray-900 name">Marc Charles Torezar</div>
          <div class="text-gray-500 role">@noobinator69</div>
        </div>
      </div>
      <div class="flex items-center self-stretch justify-center gap-3 pt-6 buttons">
        <button class="flex items-center gap-2 px-3 py-2 text-sm text-white bg-yellow-400 rounded edit-profile">Edit
          Profile</button>
      </div>
    </div>

    <!-- CourseOverview Section -->
    <div class="relative mt-10 course-overview">
      <div class="p-4 rounded shadow rectangle1 bg-gray-50">
        <div class="mb-4 text-3xl font-bold text-black">Course Overview</div>
        <div class="overflow-hidden rounded carousel">
          <!-- Placeholder for carousel items -->
          <div class="flex items-stretch justify-center my-8 space-x-4">
            <!-- Use of `flex-grow` and `flex-basis-0` ensures each card grows equally -->
            <Card class="flex-grow flex-basis-0" title="Reading Comprehension" subtext="UPCAT Subtest" @click="takeQuiz('Reading Comprehension')"
              description="Reading comprehension is the ability to process written text, understand its meaning." />
            <Card class="flex-grow flex-basis-0" title="Mathematics" subtext="UPCAT Subtest" @click="takeQuiz('Math')"
              description="Basic and intermediate algebra, geometry, statistics, and in some cases, a bit of trigonometry." />
            <Card class="flex-grow flex-basis-0" title="Science" subtext="UPCAT Subtest" @click="takeQuiz('Science')"
              description="Earth science and basic astronomy, biology, basic chemistry, and basic physics." />
            <Card class="flex-grow flex-basis-0" title="Language Proficiency" subtext="UPCAT Subtest" @click="takeQuiz('Language Proficiency')"
              description="Vocabulary, synonyms and antonyms, spelling, correct usage and grammar." />
          </div>
          <!-- Repeat for additional cards -->
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
export default {
  methods: {
    takeQuiz(subj: "Math" | "Science" | "Language Proficiency" | "Reading Comprehension"): void {
      this.$router.push({
        path: '/quiz',
        query: {
          subject: subj,
        }
      })
    }
  }
}
</script>
  