const navbar = document.querySelector(".navbar");
const footer = document.querySelector("footer");
const banner = document.querySelector("thumbie");

const remove_top_0_banner = (e) => {
  banner.classList.remove("top-0");};
const remove_p_absolute_banner = (e) => {
  banner.classList.remove("p-absolute")
};
const add_static_top_banner = (e) => {
  banner.classList.add("static-top");};

const array = [remove_top_0_banner, remove_p_absolute_banner, add_static_top_banner];

function changeWhenScrolled() {
  array.forEach( (func) =>
    window.addEventListener("scroll", func)
   )
  if (window.scrollY == 0) {
    navbar.classList.remove("d-none")
  }
}

export { changeWhenScrolled };
