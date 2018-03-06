const onglet = document.getElementById("onglet");
onglet.addEventListener("click", (event) => {
  console.log("hello from JS");
  console.log(event.currentTarget);
  event.currentTarget.classList.toggle("red-onglet");
});