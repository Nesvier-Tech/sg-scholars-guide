<template lang="">
    <div class="items-center">
        <h1 class="flex justify-center mt-10 text-3xl font-bold text-green-500">Success!</h1>
        <h1 class="flex justify-center p-5 text-2xl font-bold">Uploaded under {{$route.query.subject}}. Here's what you uploaded:</h1>
        
        <div class="flex flex-col items-center p-2">
            <RevealQuestion v-for="question of JSON.parse(this.$route.query.questions)" :q="question"/>
        </div>

        <Button class="flex justify-center p-2"><nuxt-link to="/upload">Submit Again</nuxt-link></Button>
        <Button class="flex justify-center" @click="visitSubmitted">View {{$route.query.subject}} Questions</Button>
    </div>
</template>

<script>
export default {
    methods: {
        visitSubmitted() {
            this.$router.push({
                path: '/upload/submissions',
                query: {
                    subject: this.$route.query.subject
                }
            })
        }
    },
}
</script>