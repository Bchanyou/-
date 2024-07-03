//............................................................... Script ...................................................................
// Data for the sections
let h1Texts = ["registration ", "Calendar", "Notification"]; 

let logoColors = [
  "var(--pear-logo)",
  "var(--apple-logo)",
  "var(--exotic-logo)",
]; // Add your logo colors here
let keyframes = ["wave-pear-effect", "wave-apple-effect", "wave-exotic-effect"]; // Add your keyframes here


// Normal GSAP animation
gsap.from(".fruit_image ", { y: "-100vh", delay: 0.5 });
gsap.to(".fruit_image img", {
  x: "random(-20, 20)",
  y: "random(-20, 20)",
  zIndex: 22,
  duration: 2,
  ease: "none",
  yoyo: true,
  repeat: -1,
});


// Get the elements
const bigTitle = document.querySelector("#big_title");
const mainImg_wrap = document.querySelector("#main_image");
const mainImg = document.querySelectorAll("#main_image img");
const scrollTxt = document.querySelector("#scroll");
const bubble = document.querySelector("#bubble_wrap");
const sectionContainer = document.querySelector(".section_container");


let h3Arr = ['식재료 유통기한\n간편 등록', '한 눈에 보기 쉬운\n유통기한 캘린더!', '유통기한 임박\n알람 기능']; // 배열
const h3Txt = document.querySelector(".txt_box h3");


// 말풍선 바로가기 버튼
let btnArr = ['my_fridge.jsp', 'calendar.jsp', 'login.jsp']; // 배열
const mainBtn = document.querySelector(".main_btn a");


// Set index and current position
let index = 0;
let currentIndex = 0;
let currentPosition = 0;


// 플래그 정의
let isAnimating = false;


// debounce 함수 정의
function debounce(func, delay) {
  let timer;
  return function() {
    clearTimeout(timer);
    const context = this;
    const args = arguments;
    timer = setTimeout(() => {
      func.apply(context, args);
    }, delay);
  };
}


// debounce 적용한 wheel 이벤트 핸들러
const debouncedWheelHandler = debounce(function(event) {
  if (!isAnimating) {
    if (event.deltaY > 0) {
      // 아래로 스크롤 (다음 슬라이드로 이동)
      
      if (currentPosition > -200) {
        currentPosition -= 100;
        updateSlide(event); // event 객체 전달

        gsap.from(".h1", { y: "20%", opacity: 0, duration: 0.5 });
        gsap.from(".fruit_image ", { y: "-100vh", delay: 0.4, duration: 0.4 });
      }

    } else if (event.deltaY < 0) {
      // 위로 스크롤 (이전 슬라이드로 이동)
      if (currentPosition < 0) {
        currentPosition += 100;
        updateSlide(event); // event 객체 전달

        gsap.from(".h1", { y: "20%", opacity: 0, duration: 0.5 });
        gsap.from(".fruit_image ", { y: "100vh", delay: 0.4 });
      }
    }
  }
}, 300); // debounce delay 설정 (ms)


// wheel 이벤트에 debouncedWheelHandler 함수 연결
window.addEventListener("wheel", debouncedWheelHandler);


// 페이지 로드 시 초기 배경 색상 설정
window.addEventListener("DOMContentLoaded", () => {
  
  /*gsap.to("body", { backgroundColor: logoColors[currentIndex], duration: 0.5 });*/
  gsap.to(h3Txt, { color: logoColors[currentIndex], duration: 0.5 });

  updateSlideContent();
});

// 슬라이드 업데이트 함수
function updateSlide(event) {
  // 애니메이션 시작을 플래그로 표시
  isAnimating = true;

  sectionContainer.style.left = `${currentPosition}%`;


  // currentIndex 업데이트
  if (event.deltaY > 0) {
    currentIndex++;
    showImage(currentIndex);
  } else if (event.deltaY < 0) {
    currentIndex--;
    showImage(currentIndex);
  }
  
  
  if(currentIndex >= h1Texts.length - 1){
    scrollTxt.innerText = 'Scroll Up'
  }else{
    scrollTxt.innerText = 'Scroll Down'
  }
  
  function showImage(index) {
    mainImg.forEach((img, idx) => {
      img.classList.remove('active');
      if (idx === index) {
        img.classList.add('active');
      }
    });
  }

  // currentIndex 범위 제한
  currentIndex = Math.max(0, Math.min(currentIndex, h1Texts.length - 1));

  // 배경 색상 전환 (GSAP 사용)
  //gsap.to("body", { backgroundColor: logoColors[currentIndex], duration: 0.5 });
  gsap.to(h3Txt, { color: logoColors[currentIndex], duration: 0.5 });


  // 슬라이드 텍스트 및 이미지 업데이트
  updateSlideContent();


  // 애니메이션 완료 후 플래그 해제
  setTimeout(() => {
    isAnimating = false;
  }, 500); // 애니메이션 지속 시간과 동일하게 설정
}


// 슬라이드 텍스트 및 이미지 업데이트
function updateSlideContent() {
  bigTitle.innerHTML = h1Texts[currentIndex];
  h3Txt.innerText = h3Arr[currentIndex];
  mainBtn.href = btnArr[currentIndex];

  // 클래스 업데이트
  bigTitle.className = "cnt0" + (currentIndex + 1);
  bubble.className = "bubble0" + (currentIndex + 1);
  mainImg_wrap.className = "mainImg0" + (currentIndex + 1);

}