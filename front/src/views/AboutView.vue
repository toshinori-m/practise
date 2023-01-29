<template>
  <div class="about">
  <p id="sample">Hello World!</p>
  </div>
</template>

  <script>
    var id = document.getElementById('sample');
    
    id.textContent = 'こんにちは!';
    
    console.log( id );
  </script>
