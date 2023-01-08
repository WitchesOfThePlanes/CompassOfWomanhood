<template>
  <transition name="fade">
    <div
      v-if="loading"
      class="loader w-100 h-100 d-flex align-center justify-center"
    >
      <v-progress-circular
        :size="200"
        :width="10"
        color="#f9b24b"
        indeterminate
      ></v-progress-circular>
    </div>
  </transition>
</template>

<script setup lang="ts">
import { onMounted, ref } from "vue";

const loading = ref(true);

onMounted(() => {
  document.onreadystatechange = () => {
    if (document.readyState == "complete") {
      loading.value = false;
    }
  };
});
</script>

<style scoped>
.loader {
  background: #14162a;
  position: fixed;
  top: 0;
  left: 0;
}
.fade-leave-active {
  transition: opacity 1s;
}
.fade-leave-to {
  opacity: 0;
}
</style>
