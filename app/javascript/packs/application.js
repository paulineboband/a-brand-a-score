// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("slick-carousel")


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
import { showKeywordsModal } from '../plugins/display_modal_keywords';
import { searchBar } from '../plugins/search_bar'
import { move } from '../plugins/bars';
import { initCategoryFilter } from '../plugins/category_filter';
import { initSorting } from '../plugins/sort_by';
import { initSweetalert } from '../plugins/init_sweetalert';
import { loader } from '../plugins/loader';

document.addEventListener('turbolinks:visit', () => {
  $('#loading').show();
});

document.addEventListener('turbolinks:load', () => {

  $('#loading').hide();

  $('.brand-carrousel').slick({
      infinite: true,
      slidesToShow: 3,
      centerMode: true,
      slidesToScroll: 3
    });


  // Call your functions here, e.g:
  searchBar();

  if (document.getElementById('nav-profile-tab')) {
    move("anger-bar");
    move("sadness-bar");
    move("joy-bar");
    move("disgust-bar");
    move("fear-bar");
  }


  if (document.getElementById('select-filter')) {
    initCategoryFilter();
  }

  if (document.getElementById('select-sorting')) {
    initSorting();
  }

  if (document.getElementById('nav-profile-tab')) {
    loader();
  }


  if (document.getElementById('reviewModal')) {
    showModal();
  }
  if (document.getElementById('requestModal')) {
    showRequestModal();
  }
  if (document.getElementById('keywordsModal')) {
    showKeywordsModal();
  }

  if (document.getElementById('nav-profile-tab')) {
    document.getElementById('nav-profile-tab').addEventListener('click', () => {
      move("anger-bar");
      move("sadness-bar");
      move("joy-bar");
      move("disgust-bar");
      move("fear-bar");
    });
  }

  // document.getElementById(`link-${keyword}`).addEventListener('click', () => {
  //   move(`anger-bar-${keyword}`);
  //   move(`sadness-bar-${keyword}`);
  //   move(`joy-bar-${keyword}`);
  //   move(`disgust-bar-${keyword}`);
  //   move(`fear-bar-${keyword}`);
  // });

  initSweetalert('#fake-btn-fav', {
    title: "Remove from your favorites",
    text: "Do you want to remove this brand from your favorites?",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#btn-remove-fav');
      link.click();
    }
  });


});



