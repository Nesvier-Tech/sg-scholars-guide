<template>
  <div v-if="finished" class="quiz-score" style="margin-top: 0;">
    <p>Score</p>
    <p>{{ computeScore() }}/3</p>
  </div>
  <div v-if="!finished" class="quiz-score" style="margin-top: 0;">
    <p>Science</p>

  </div>
</template>

<script setup>
  const finished = useFinished();
  
  const points = usePoints();
  

  function computeScore() {
    let score = 0;
    for (const point of points.value) {
      score += point;
    }
    return score;
  }

</script>

<style scoped>
  .quiz-score {
    width: 100%;
    padding: 1rem;
    margin: auto;
    margin-top: 1rem;
    margin-bottom: 2rem;
    background-color: white;
    border-radius: 4px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
</style>