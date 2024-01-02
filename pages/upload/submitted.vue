<template lang="">
    <ul v-for="q of questions" :key="index">
        <div id="question-box">
            <h2>Question: {{q.question}}</h2>
            <h3>Correct Answer: {{q.correctAnswer}}</h3>
            <h3>Wrong Answers:
                <ul v-for="o of q.wrongAnswers" :key="index">
                    {{o}}
                </ul>
            </h3>
        </div>
    </ul>
</template>
<script>
// import { get_questions, SUBJECTS } from '../SGDB.js'


export default {
    data: () => {
        return {
            questions: undefined
        }
    },
    watch: {
        questions: function () {
            console.log("CHANGED!")
        }
    },
    created() {
        get_questions(getSubjects().MATH).then((questions) => {
            this.questions = questions.documents
            console.log(questions)
        })
    },
    methods: {

    },


}
</script>