<template>
    <div class="p-4">
        <div>
            <h1 class="text-2xl font-bold p-4">Choose a Subject to Upload Questions</h1>
            <div class="bg-white border-2 p-2 md:w-auto w-full md:flex rounded-md justify-center inline-flex">{{ subj }}
            </div>

            <!-- Dropdown -->
            <button id="dropdownDefaultbutton"
                onclick="const d = document.getElementById('dropdown'); d.classList.contains('hidden')? d.classList.remove('hidden'): d.classList.add('hidden');"
                class="text-white bg-sg-red hover:bg-sg-dark-red focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
                type="Button">Choose Subject<svg class="w-2.5 h-2.5 ms-3" aria-hidden="true" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="m1 1 4 4 4-4" />
                </svg>
            </button>

            <div id="dropdown"
                class="z-10 dropdown-content hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
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
                        @click="subj = 'Language Proficiency'" onclick="document.getElementById('dropdown').classList.add('hidden');">
                        Language Proficiency
                    </li>
                    <li class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white"
                        @click="subj = 'Reading Comprehension'" onclick="document.getElementById('dropdown').classList.add('hidden');">
                        Reading Comprehension
                    </li>
                </ul>
            </div>
        </div>

        <!-- Questions Section -->
        <div>
            <ul v-for="vq of questions" :key="vq" class="p-2">
                <CreateQuestion :id="vq.id" :question="question" :options="vq.options" :correct="vq.correct"
                    @update="updateQuestion" class="bg-sg-white p-7 text-center shadow-md rounded-md" />
            </ul>
        </div>
        <Button @click="addQuestion" class="flex justify-center">Add Question</Button>
        <Button v-show="showRemoveButton" @click="removeQuestion" class="flex justify-center">Remove Question</Button>
        <Button @click="submitQuestion" class="flex justify-center">Submit Questions</Button>

    </div>
</template>

<script>
const { post_questions, SUBJECTS } = SGDB()

export default {
    data() {
        return {
            subj: 'Math',
            count: 0,
            questions: [{
                id: 0,
                question: '',
                options: [],
                correct: ''
            }],
            showRemoveButton: false
        }
    },
    methods: {
        updateQuestion(data) {
            this.questions[data.id].question = data.question
            this.questions[data.id].options = data.options
            this.questions[data.id].correct = data.correct

            // console.log("==================UPDATE FROM PARENT!================")
            // console.log(`id: ${data.id}`)
            // console.log(`question: ${data.question}`)
            // console.log(`correct: ${data.correct}`)
            // console.log(`all wrong options: ${data.options}`)
            // console.log(`result: ${this.questions[data.id].question}`)
            // console.log(`result: ${this.questions[data.id].correct}`)
            // console.log(`result: ${this.questions[data.id].options}`)

        },
        addQuestion() {
            this.count++
            const q = {
                id: this.count,
                question: '',
                options: [],
                correct: ''
            }
            this.questions.push(q)
            if (this.questions.length > 1) this.showRemoveButton = true

            // console.log(`START: ==========`)
            // for (let i = 0; i < this.questions.length; i++) {
            //     console.log(this.questions[i].id)
            //     console.log(this.questions[i].question)
            //     console.log(this.questions[i].options)
            //     console.log(this.questions[i].correct)
            //     console.log(`NEXT ==========`)
            // }
        },
        removeQuestion() {
            if (this.questions.length > 1) {
                this.questions.pop()
                this.count--
            }
            if (this.questions.length === 1) this.showRemoveButton = false
        },
        submitQuestion() {
            const result = post_questions(SUBJECTS.MATH, this.questions)
            //console.log(result)
            this.$emit('submitted')
        }
    }
}
</script>