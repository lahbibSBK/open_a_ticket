// const separators = document.querySelectorAll(".myseparator");
const cards = document.querySelector(".cards");
const individual_cards = document.querySelectorAll(".card")
const banner = document.querySelector(".banner")

function hoverCards() {

  // cards.forEach((card) => card.addEventListener("mouseover", (e) => {
  //   separators[].classList.remove("hidden")
  // }))
  // cards.forEach((card) => card.addEventListener("mouseout", (e) => {
  //   card.classList.add("hidden")
  // }))
  if (window.innerWidth < 854) {
    cards.style.display = "block",
    individual_cards.forEach((card) => card.classList.remove("jump")),
    banner.style.flexDirection = "column"
  }
}

export { hoverCards };
