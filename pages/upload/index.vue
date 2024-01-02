<template>
    <div class="p-4">

        <!-- Select Subject Section -->
        <h1 class="flex justify-center p-4 text-2xl font-bold">Choose a Subject to Upload Questions</h1>
        <div class="inline-flex justify-center w-full p-2 bg-white border-2 rounded-md md:w-auto md:flex">{{ subj }}</div>
        <Button id="dropdownDefaultbutton"
            onclick="const d = document.getElementById('dropdown'); d.classList.contains('hidden')? d.classList.remove('hidden'): d.classList.add('hidden');">
            Choose Subject
            <svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" fill="none" viewBox="0 0 10 6">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="m1 1 4 4 4-4" />
            </svg>
        </Button>
        <div id="dropdown"
            class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow dropdown-content w-44 dark:bg-gray-700">
            <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefaultButton">
                <li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                    @click="subj = 'Math'" onclick="document.getElementById('dropdown').classList.add('hidden');">
                    Math
                </li>
                <li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                    @click="subj = 'Science'" onclick="document.getElementById('dropdown').classList.add('hidden');">
                    Science
                </li>
                <li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                    @click="subj = 'Language Proficiency'"
                    onclick="document.getElementById('dropdown').classList.add('hidden');">
                    Language Proficiency
                </li>
                <li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                    @click="subj = 'Reading Comprehension'"
                    onclick="document.getElementById('dropdown').classList.add('hidden');">
                    Reading Comprehension
                </li>
            </ul>
        </div>

        <!-- Questions Section -->
        <div>
            <ul v-for="vq of questions" :key="vq" class="p-2">
                <CreateQuestion :id="vq.id" :question="vq.question" :options="vq.options" :correct="vq.correct"
                    @update="updateQuestion" class="text-center rounded-md shadow-md bg-sg-white p-7" />
            </ul>
        </div>
        <Button @click="addQuestion" class="flex justify-center">Add Question</Button>
        <Button v-show="showRemoveButton" @click="removeQuestion" class="flex justify-center">Remove Question</Button>
        <Button @click="submitQuestion" class="flex justify-center">Submit Questions</Button>

        <div id="incomplete" class="hidden">
            <div class="flex justify-center border-2 bg-sg-white border-sg-red">
                Make sure all inputs are complete before submitting or click Remove Questions
            </div>
        </div>
    </div>
</template>

<script>
const { post_questions, SUBJECTS } = SGDB()
const SUBJ = {
    'Math': SUBJECTS.MATH,
    'Science': SUBJECTS.SCI,
    'Language Proficiency': SUBJECTS.LANG_PROF,
    'Reading Comprehension': SUBJECTS.READ_COMP
}

export default {
    data() {
        return {
            subj: 'Science',
            count: 0,
            questions: [{
                id: 0,
                question: '',
                options: [],
                correct: '',
                authorID: 'a'
            }],
            showRemoveButton: false
        }
    },
    methods: {
        updateQuestion(data) {
            this.questions[data.id].question = data.question
            this.questions[data.id].options = data.options
            this.questions[data.id].correct = data.correct
        },
        addQuestion() {
            this.count++
            const q = {
                id: this.count,
                question: '',
                options: [],
                correct: '',
                authorID: 'a'
            }
            this.questions.push(q)
            if (this.questions.length > 1) this.showRemoveButton = true
        },
        removeQuestion() {
            if (this.questions.length > 1) {
                this.questions.pop()
                this.count--
            }
            if (this.questions.length === 1) this.showRemoveButton = false
        },
        submitQuestion() {
            for (const q of this.questions) {
                if (q.question === '' || q.options.some((e) => e === '') || q.correct === '') {
                    document.getElementById('incomplete').classList.remove('hidden')
                    return
                }
            }

            const result = post_questions(SUBJ[this.subj], this.questions)

            this.$router.push({
                path: '/upload/success',
                query: {
                    subject: this.subj,
                    questions: JSON.stringify(this.questions)
                }
            })
        }
    }
}
</script>