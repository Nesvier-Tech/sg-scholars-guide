<template>
    <div>
        <Button @click="handleClick">Test Button</Button>
        <SG-Dropdown />
    </div>
</template>
<script lang="ts">

export default {
    methods: {
        handleClick(): void {
            console.log('TEST CLICK');
        }
    },
}
</script>