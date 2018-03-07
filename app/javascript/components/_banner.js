import Typed from 'typed.js';

const quote = document.querySelector(".mentor-quote")

const a = "If you have an idea for your business or product then having a mentor to bounce these ideas off can help you plan and organise how to put them into action and make them a reality. Your mentor may be able to see potential pitfalls and opportunities that had not occurred to you, which could be the difference between success or failure.";
const b = "Motivation can be a hard thing to manufacture but telling your mentor you’re going to achieve something and setting yourself a goal means you have someone to hold you accountable to these goals. This means you’re more likely to take action and will therefore see results quicker.";
const c = "If you are having a problem at work a mentor can give you helpful advice to navigate the problem in a professional way. Their experience and insight can stop you making mistakes and can give you the answers rather than you having to waste valuable time and money working out the right way to handle the situation.";
const d = "A mentor is not only handy when you are having a problem at work. Sharing your successes with them can be hugely rewarding for them as well as for you, and can help you find out ways to build on this success in the future.";
const e = "Asking friends and co-workers for help when you’re struggling can be helpful but a mentor is likely to give you an entirely different perspective from anyone who knows you personally. They can offer you impartial advice from a professional point of view, which may help you see opportunities and challenges from a more constructive perspective.";
const f = "Finding a mentor who you aspire to be like, within your chosen profession also helps you add to your network. It’s highly likely that should your mentor not have the answer to a question or problem, then someone they know will. They can introduce you to like-minded people and some of these could be valuable connections throughout your career.";
const g = "It’s all too easy to get distracted these days so having someone to help you stay on track and focus your attention on the important things will help you maintain your personal growth and smash your professional targets.";
const h = "Having a mentor guide you through your career is a great way to learn how to be a mentor yourself. Sharing your knowledge and experience in this way can be massively rewarding and can open up opportunities to you as well as the person you are mentoring."

const array = [a, b, c, d, e, f, g, h]

function loadDynamicBannerText() {
  // new Typed('#typed2', {
  //   strings: ['Open a ticket.', 'Get a mentor.', 'Take over the world.', 'Open a ticket.'],
  //   typeSpeed: 0,
  //   backSpeed: 25,
  //   fadeOut: true,
  // });
  quote.innerText = array[Math.floor(Math.random() * 4)]
}

export { loadDynamicBannerText };
