<template>
  <span class="section-title">
    <slot></slot>
  </span>
</template>

<script setup lang="ts"></script>

<style scoped>
.section-title {
  display: flex;
  font-family: "Alexandria", serif;
  font-weight: 600;
  font-size: 10vw;
  line-height: 12vw;
  background: linear-gradient(
    90deg,
    #96c3ea 6.88%,
    #8d97cc 30%,
    #5f556e 97.48%
  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  text-fill-color: transparent;
  text-transform: uppercase;
}

@media (min-width: 600px) {
  .section-title {
    font-size: 4rem;
    line-height: 78px;
  }
}
</style>
