document.addEventListener("DOMContentLoaded", () => {
  const loader = document.getElementById("loader");
  const content = document.getElementById("content");

  // SimulaciÃ³n de carga (puedes reemplazarlo con carga real de recursos)
  setTimeout(() => {
    // Desvanecer loader
    loader.style.opacity = "0";
    setTimeout(() => {
      loader.style.display = "none";
      // Mostrar contenido
      content.classList.remove("hidden");
      content.classList.add("visible");
    }, 800); // Tiempo para que termine la transiciÃ³n
  }, 2000); // Tiempo de carga simulado

  // BotÃ³n de entrada (opcional: puede redirigir o hacer algo)
  document.getElementById("btn-enter").addEventListener("click", () => {
    alert("Â¡Has entrado al sistema! í¾‰");
    // AquÃ­ puedes redirigir: window.location.href = "dashboard.html";
  });
});
