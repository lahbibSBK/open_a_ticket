const elements = document.querySelectorAll(".reset-margin");

function resetMargin() {
  if (window.visualViewport.width < 530) {
    elements.forEach((element) =>
      element.classList.remove("ml-5")
    )
  }
}

export { resetMargin };
