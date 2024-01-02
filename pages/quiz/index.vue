<template >
  <div class="quiz-body-grid">
    <div style="padding: 0 1rem;">
      <div class="card-container" style="margin-top: 0;">
        <p>Marc Peejay Viernes</p>
        <p>Student</p>
      </div>
    </div>
    <div style="padding: 0 2rem;">
      <QuizScore style="margin-top: 0;" />
      <div>
        <div v-for="q in this.questions">
          <QuestionCard :question="q" />
        </div>
      </div>
      <div class="container-100">
        <FinishButton />
      </div>
    </div>
    <div style="padding: 0 1rem;">
      <div class="card-container" style="margin-top: 0;">
        <p>{{this.$route.query.subject}}</p>
        <p style="margin-top: 1rem;">Time Left:</p>
        <p>1:00:00</p>
        <p>(Not yet working)</p>
      </div>
    </div>
  </div>
</template>
  
<script>
const { get_questions, SUBJECTS } = SGDB()
const SUBJ = {
  'Math': SUBJECTS.MATH,
  'Science': SUBJECTS.SCI,
  'Language Proficiency': SUBJECTS.LANG_PROF,
  'Reading Comprehension': SUBJECTS.READ_COMP
}

export default {
  data: () => {
    return {
      questions: []
    }
  },
  created() {
    console.log(this.$route.query.subject)
    get_questions(SUBJ[this.$route.query.subject]).then((output) => {
      console.log(output.documents.length)
      for (let i = 0; i < output.documents.length; i++) {
        const old_question = output.documents[i];
        const questionToAdd = { id: i, title: `Question ${i + 1}`, body: old_question.question, choices: [...old_question.wrongAnswers, old_question.correctAnswer], answer: "A" }

        // randomize 
        // min 0, max 3, outcome is either 0 1 2 3
        const min = 0;
        const max = 3;
        let x = Math.floor(Math.random() * (max - min + 1)) + min
        const temp = questionToAdd.choices[3];
        questionToAdd.choices[3] = questionToAdd.choices[x];
        questionToAdd.choices[x] = temp;

        const map = ['A', 'B', 'C', 'D'];
        questionToAdd.answer = map[x];

        this.questions.push(questionToAdd)
      }

      console.log(this.questions)
    })
  },
}


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