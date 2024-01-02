<template lang="">
    <div class="w-1/2 p-4 my-5 text-center rounded-md shadow-md bg-sg-white">
        <h2 class="text-3xl">Question: {{q.question}}</h2>
        <h3 class="text-2xl">Correct Answer: {{q.correctAnswer || q.correct}}</h3>
        <h3 class="text-2xl">Wrong Answers:
            <ul v-for="o of q.wrongAnswers || q.options" :key="index">
                {{o}}
            </ul>
        </h3>
    </div>
</template>

<script>
export default {
    props: {
        q: Object
    }
}
</script>