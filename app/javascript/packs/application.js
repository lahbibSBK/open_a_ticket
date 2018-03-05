/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import "bootstrap";
import Choices from 'choices.js';

new Choices('#ticket_ticket_skills');

// import 'choices.js/assets/styles/css/base.css';
import 'choices.js/assets/styles/css/choices.css';

import { loadDynamicBannerText } from '../components/_banner';
loadDynamicBannerText();

import { resetMargin } from '../components/_reset-margin';
resetMargin();

import { removePrivacyFromPolicy } from '../components/_remove_policy_from_privacy';
removePrivacyFromPolicy();

// import { changeWhenScrolled } from '../components/_change_when_scrolled' ;
// changeWhenScrolled();
