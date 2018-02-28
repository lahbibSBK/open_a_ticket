import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#typed2', {
    strings: ['Open a ticket.', 'Get a mentor.', 'Take over the world.', '', 'Open a ticket.'],
    typeSpeed: 0,
    backSpeed: 10,
    fadeOut: true,
  });
}

export { loadDynamicBannerText };
