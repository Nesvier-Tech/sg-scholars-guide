<template lang="">
    <div id="question-box">
        <textarea class="h-32 w-96" :id="'question'+id" placeholder='Place your question here' @input="update" required></textarea>
        <div id="option">
            <input type="radio" value='0' v-model="selectedOption" @change="update" required>
            <input type="text" :class="'option'+id" placeholder="Put your option here" @input="update" required>
        </div>
        <div id="option">
            <input type="radio" value='1' v-model="selectedOption" @change="update" required>
            <input type="text" :class="'option'+id" placeholder="Put your option here" @input="update" required>
        </div>
        <div id="option">
            <input type="radio" value='2' v-model="selectedOption" @change="update" required>
            <input type="text" :class="'option'+id" placeholder="Put your option here" @input="update" required>
        </div>
        <div id="option">
            <input type="radio" value='3' v-model="selectedOption" @change="update" required>
            <input type="text" :class="'option'+id" placeholder="Put your option here" @input="update" required>
        </div>
    </div>
</template>


<script>
export default {
    data: () => {
        return {
            selectedOption: '0'
        }
    },
    props: {
        id: Number,
        question: String,
        options: Array,
        correct: String
    },
    methods: {
        update() {
            let c;
            let o = [];

            const get_options = document.getElementsByClassName(`option${this.id}`)
            for (let i = 0; i < get_options.length; i++) {
                if (i === Number(this.selectedOption)) {
                    c = get_options[i].value
                }
                else o.push(get_options[i].value)
            }


            this.$emit('update', {
                id: this.id,
                question: document.getElementById(`question${this.id}`).value,
                options: o,
                correct: c
            });
        },
    },
}
</script>