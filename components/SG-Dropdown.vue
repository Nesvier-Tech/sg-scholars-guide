<template>
  <div>
    <fwb-dropdown text="Click me" placement="bottom">
      <fwb-list-group>
        <fwb-list-group-item>Item #1</fwb-list-group-item>
        <fwb-list-group-item>Item #2</fwb-list-group-item>
        <fwb-list-group-item>Item #3</fwb-list-group-item>
      </fwb-list-group>
    </fwb-dropdown>
  </div>
</template>

<script setup>
import { FwbDropdown, FwbListGroup, FwbListGroupItem } from 'flowbite-vue'
</script>