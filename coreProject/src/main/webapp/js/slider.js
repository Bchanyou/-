
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
    /*autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },*/
	/*  coverflowEffect: {
		  slideShadows: true, // 슬라이더 그림자 : 3D 효과를 강조하기 위한 회전시 흐릿한 효과
		  rotate: 0, // 슬라이더 회전 각 : 클수록 슬라이딩시 회전이 커짐
		  stretch: 0, // 슬라이더간 거리(픽셀) : 클수록 슬라이더가 서로 많이 겹침
		  depth: 100, // 깊이 효과값 : 클수록 멀리있는 느낌이 강해짐
		  modifier: 3, // 효과 배수 : 위 숫자값들에 이 값을 곱하기 처리하여 효과를 강하게 처리함
		  slideShadows: true,
	  },*/
    loop: true,
    spaceBetween: 5,
    speed: 500,
    slidesPerView: 4,
    keyboard: {
      enabled: true
    }

  });


});
