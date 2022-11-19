<template>
  <div
    v-if="!state.mobileMenuOpen"
    class="h-screen d-flex align-end justify-start flex-column pa-6 mobile-nav-menu"
  >
    <v-btn
      variant="text"
      icon="fa:fas fa-bars"
      @click="state.mobileMenuOpen = true"
    />
  </div>
  <div v-else class="h-screen w-100 bg-white mobile-nav-menu">
    <div class="d-flex align-end justify-start flex-column pa-6">
      <v-btn
        variant="text"
        icon="fa:fas fa-times"
        @click="state.mobileMenuOpen = false"
      />
    </div>
    <slot name="menu"></slot>
  </div>
</template>

<script setup lang="ts">
import { reactive } from "vue";

const state = reactive({ mobileMenuOpen: false });
</script>

<style scoped>
.mobile-nav-menu {
  position: fixed;
  right: 0;
  top: 0;
}
</style>
