const avatar = document.querySelector("#user-control");
const dropdown = document.querySelector(".open-dropdown")

avatar.addEventListener("mouseover", (e) => {
  dropdown.classList.remove("hidden")
})
dropdown.addEventListener("mouseleave", (e) => {
  dropdown.classList.add("hidden")
})
