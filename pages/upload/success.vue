<template lang="">
    <div>
        <h1 class="text-3xl font-bold">Slayyy, the questions have been uploaded</h1>
        <button @click="this.$emit('submitAgain')">Submit again</button>
        <button @click="this.$emit('showQuestion')">Check out all questions</button>
    </div>
</template>