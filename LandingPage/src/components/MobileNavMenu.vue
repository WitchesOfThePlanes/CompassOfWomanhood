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
  <div v-else class="h-screen w-100 mobile-nav-menu bg-dark">
    <div class="d-flex align-end justify-start flex-column pa-6">
      <v-btn
        variant="text"
        icon="fa:fas fa-times"
        @click="state.mobileMenuOpen = false"
      />
    </div>
    <NavMenu @close-mobile-menu="state.mobileMenuOpen = false" />
  </div>
</template>

<script setup lang="ts">
import { reactive } from "vue";
import NavMenu from "@/components/NavMenu.vue";

const state = reactive({ mobileMenuOpen: false });
</script>

<style scoped>
.mobile-nav-menu {
  position: fixed;
  right: 0;
  top: 0;
}
.bg-dark {
  background: #14162a;
}
</style>
