<template>
  <div>
    <EmitChild @onClick="getMessage" />
    <EmitDisplay :text="message"></EmitDisplay>
  </div>
</template>

<script>
import EmitChild from './EmitChild.vue'
import EmitDisplay from './EmitDisplay.vue'

export default {
  components: {EmitChild, EmitDisplay},
  data() {
    return {
      message: "",
    }
  },
  methods: {
    getMessage(value) {
      this.message = value;
    }
  }
}
</script>