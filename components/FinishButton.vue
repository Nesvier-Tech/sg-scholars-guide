
import type { inlineConfig } from '#build/types/app.config';

import type { inlineConfig } from '#build/types/app.config';
<template>
  <div @click="setFinish" class="finish-button">
    <p>Finish</p>
  </div>
</template>

<script setup>
  const finished = useFinished()

  function setFinish() {
    finished.value = true;
  }
</script>

<style scoped>
  .finish-button {
    display: inline-block;
    background-color: #1fab59;
    border-color: #1fab59;
    border-radius: 4px;
    margin: auto;
    margin-top: 2px;
    margin-bottom: 2px;
    padding: 0.5rem 1rem;
    color: #fff;
    border: 1px solid transparent;
  }

  .finish-button:hover {
    color: #1fab59;
    background-color: rgba(0, 0, 0, 0);
    border: 1px solid;
  }
</style>