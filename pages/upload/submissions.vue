<template lang="">
    <div class="flex flex-col items-center p-2">
        <h1 class="p-5 mt-5 text-3xl font-bold">{{$route.query.subject}}: {{questions.length}} Total Submissions</h1>

        <RevealQuestion v-for="question of questions" :q="question"/>
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
    watch: {
        questions: function () {
            console.log("CHANGED!")
        }
    },
    created() {
        get_questions(SUBJ[this.$route.query.subject]).then((questions) => {
            this.questions = questions.documents
            console.log(this.questions)
        })
    },
}
</script>