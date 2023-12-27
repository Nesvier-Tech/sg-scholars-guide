<template>
    <!-- 
    To use this, 
    <Button @click="functionHere">Label Here</Button>
    -->

    <div>

        <button type="button"
            class="text-white bg-sg-red hover:bg-sg-dark-red focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
            <slot>
                Default
            </slot>
        </button>
    </div>
</template>
