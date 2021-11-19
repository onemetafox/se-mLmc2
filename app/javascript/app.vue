<template>
  <div id="app">
    <v-card
    elevation="2"
    shaped
    >
      <p>{{ message }}</p>
    </v-card>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
