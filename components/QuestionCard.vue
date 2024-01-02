<template>
  <div class="question-card">
    <p style="margin-top: 1rem; font-weight: 600;">{{ question.title }}</p>
    <p style="margin-bottom: 2rem;">{{ question.body }}</p>
    <div class="choice-container">
      <div @click="changeAnswerChoice('A')" class="choice-button" :class="{ 'choice-button-active': answerChoice === 'A', 'choice-button-correct': isCorrect('A'), 'choice-button-incorrect': isIncorrect('A'), 'choice-button-red-outline': isRedOutline('A'), 'choice-button': isRightAnswer('A') }">
        A. {{ question.choices[0] }}
      </div>
      <div @click="changeAnswerChoice('B')" class="choice-button" :class="{ 'choice-button-active': answerChoice === 'B', 'choice-button-correct': isCorrect('B'), 'choice-button-incorrect': isIncorrect('B'), 'choice-button-red-outline': isRedOutline('B'), 'choice-button': isRightAnswer('B') }">
        B. {{ question.choices[1] }}
      </div>
      <div @click="changeAnswerChoice('C')" class="choice-button" :class="{ 'choice-button-active': answerChoice === 'C', 'choice-button-correct': isCorrect('C'), 'choice-button-incorrect': isIncorrect('C'), 'choice-button-red-outline': isRedOutline('C'), 'choice-button': isRightAnswer('C') }">
        C. {{ question.choices[2] }}
      </div>
      <div @click="changeAnswerChoice('D')" class="choice-button" :class="{ 'choice-button-active': answerChoice === 'D', 'choice-button-correct': isCorrect('D'), 'choice-button-incorrect': isIncorrect('D'), 'choice-button-red-outline': isRedOutline('D'), 'choice-button': isRightAnswer('D') }">
        D. {{ question.choices[3] }}
      </div>
    </div>
  </div>
</template>

<script setup>
  const { question } = defineProps(["question"]);
  let answerChoice = ref('');
  const finished = useFinished();
  const points = usePoints();

  function changeAnswerChoice(newAnswer) {
    if (finished.value == true) {
      return
    }
    answerChoice.value = newAnswer;
    if (answerChoice.value == question.answer) {
      points.value[question.id] = 1;
      console.log(points.value)
    } else {
      points.value[question.id] = 0;
      console.log(points.value)
    }
  }

  function isCorrect(letter) {
      return answerChoice.value == question.answer && letter == question.answer && finished.value == true
  }

  function isIncorrect(letter) {
      return answerChoice.value == letter && letter != question.answer && finished.value == true
  }

  function isRedOutline(letter) {
      return answerChoice.value != letter && answerChoice.value != question.answer && letter != question.answer && finished.value == true
  }

  function isRightAnswer(letter) {
      return answerChoice.value != letter && letter == question.answer && finished.value == true
  }
</script>

<style scoped>
  .question-card {
    padding: 1rem;
    width: 100%;
    margin: 2rem auto;
    background-color: white;
    border-radius: 0.5rem;
    box-shadow: 0.25rem 0.25rem 1rem rgba(0, 0, 0, 0.1);
    text-align: center;
  }

  .card {
    width: 50%;
    margin: auto;
    
  }

  .choice-button {
    background-color: rgba(0, 0, 0, 0);
    color: #1fab59;
    border: 1px solid transparent;
    border-color: #1fab59;
    border-radius: 4px;
    width: 90%;
    margin: 0.5rem auto;
    padding: 0.5rem 1rem;
  }

  .choice-button-red-outline {
    background-color: rgba(0, 0, 0, 0);
    color: #c72828;
    border: 1px solid transparent;
    border-color: #c72828;
    border-radius: 4px;
    width: 90%;
    margin: 0.5rem auto;
    padding: 0.5rem 1rem;
  }

  .choice-button:hover {
    background-color: #1fab59;
    color: white;
    border: 1px solid;
  }

  .choice-button-active {
    background-color: #1fab59;
    color: white;
    border: 1px solid;
  }

  .choice-button-correct {
    background-color: #1fab59;
    color: white;
    border: 1px solid;
  }

  .choice-button-incorrect {
    background-color: #c72828;
    color: white;
    border: 1px solid;
  }
  .choice-container {
    margin-top: 1rem;
    margin-bottom: 1rem;
    padding: 0 2rem;
    display: grid;
    grid-template-columns: 1fr 1fr;
  }
</style>