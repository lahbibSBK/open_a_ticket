const Tether = require("tether");
const dropdown = document.querySelector(".open-dropdown")
const avatar = document.querySelector("#user-control")

new Tether({
  element: dropdown,
  target: avatar,
  attachment: 'top left',
  targetAttachment: 'top left',
  offset: '-45px 50px'
});
