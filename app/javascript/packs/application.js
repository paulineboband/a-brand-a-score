// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { showModal } from '../plugins/display_modal';
import { showRequestModal } from '../plugins/display_modal_request';
import { move } from '../plugins/bars';
import { initCategoryFilter } from '../plugins/category_filter';



document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initCategoryFilter();

  if (document.getElementById('reviewModal')) {
    showModal();
  }
  if (document.getElementById('requestModal')) {
    showRequestModal();
  }
  document.addEventListener('click', () => {
    if (document.getElementById('nav-profile-tab')) {
      move("anger-bar");
      move("sadness-bar");
      move("joy-bar");
      move("disgust-bar");
      move("fear-bar");
    }
  });


});


