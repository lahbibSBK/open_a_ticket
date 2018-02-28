const element = document.querySelector("#privacy");

function removePrivacyFromPolicy() {
  if (window.visualViewport.width < 463) {
    element.innerText = "Privacy"
  }
}

export { removePrivacyFromPolicy };
