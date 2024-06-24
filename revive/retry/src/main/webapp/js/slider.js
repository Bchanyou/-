
/********************************************************
 
 *  Slider JS
 
 ********************************************************/

$(function () {

  "use strict";

  /*-----------------------------------------------------------------------------
  *  추천레시피 Slide
  *----------------------------------------------------------------------------*/

  var swiper1 = new Swiper(".swp_basic", {

    navigation: {
      nextEl: ".swp_wrap .swiper-button-next",
      prevEl: ".swp_wrap .swiper-button-prev",
    },
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
    loop: true,
    spaceBetween: 30,
    speed: 500,
    slidesPerView: 3,
    keyboard: {
      enabled: true
    },

  });


});
