<template >
    <div class="quiz-body-grid">
      <div style="padding: 0 1rem;">
        <div class="card-container" style="margin-top: 0;">
          <p>Marc Peejay Viernes</p>
          <p>Student</p>
        </div>
      </div>
      <div style="padding: 0 2rem;">
        <QuizScore style="margin-top: 0;"/>
        <div>
          <div v-for="q in questions">
            <QuestionCard :question="q"/>
          </div>
        </div>
        <div class="container-100">
          <FinishButton />
        </div>
      </div>
      <div style="padding: 0 1rem;">
        <div class="card-container" style="margin-top: 0;">
          <p>Science</p>
          <p style="margin-top: 1rem;">Time Left:</p>
          <p>1:00:00</p>
        </div>
      </div>
    </div>
    
  </template>
  
  <script setup>
    const finished = useFinished();
  
    const questions = [
      {id: 0, title: "Question 1", body: "The layer of gas covering the earth is called:", choices: ["Atmosphere", "Hydrosphere", "Litosphere", "Troposphere"], answer: "A"},
      {id: 1, title: "Question 2", body: "A distance of one mile is about:" , choices: ["1 kilometer", "16 kilometers", "160 kilometers", "1.6 kilometers"], answer: "D"},
      {id: 2, title: "Question 3", body: "The largest object in the solar system is:", choices: ["A star", "A planet", "An asteroid", "A meteor"], answer: "A"},
    ];
  
  </script>
  
  <style scoped>
    .quiz-body-grid {
      background-color: rgba(0, 0, 0, 0.01);
      padding: 4rem 4rem;
      display: grid;
      grid-template-columns: 1fr 2fr 1fr;
    }
    .container-100 {
      width: 100%;
      margin: auto;
      margin-top: 1rem;
      margin-bottom: 1rem;
    }
  
    .card-container {
      width: 100%;
      margin: 1rem auto;
      border-radius: 0.5rem;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 1rem;
      background-color: white;
    }
  
  </style>