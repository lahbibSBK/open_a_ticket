const dropdown = document.querySelector("#drop")
const buttons = document.querySelectorAll(".btn-nav")

function showDropdownOnMobile() {
  if (window.innerWidth < 600) {
    dropdown.classList.remove("d-none"),
    buttons.forEach( (button) => button.classList.add("d-none") )
  }
}

export { showDropdownOnMobile };
