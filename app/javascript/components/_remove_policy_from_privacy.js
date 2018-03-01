const element = document.querySelector("#privacy");

function removePrivacyFromPolicy() {
  if (window.innerWidth < 463) {
    element.innerText = "Privacy"
  }
}

export { removePrivacyFromPolicy };
