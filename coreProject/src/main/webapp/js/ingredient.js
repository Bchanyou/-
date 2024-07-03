
/*
 * File Name : ingredient.js
 * 작성일 : 2024-06-14
 */


/********************************************************
 
 *  Ingredient
 
 ********************************************************/

document.addEventListener('DOMContentLoaded', function() {

	//초기 로드 시 행 개수 확인하여 선택버튼 제어
	var tabs = [
		{ id: "tab1", hasItems: true },
		{ id: "tab2", hasItems: true },
		{ id: "tab3", hasItems: true },
		// 필요에 따라 다른 탭들도 추가
	];

	tabs.forEach(function(tab) {
		var tableBody = document.querySelector(".tabs_item#" + tab.id + " .fridge_list tbody");
		var checkDelButton = document.querySelector(".tabs_item#" + tab.id + " .check_del");
		var nullBox = document.querySelector(".tabs_item#" + tab.id + " .null_box");

		if (tableBody.children.length === 0 || !tab.hasItems) {
			checkDelButton.style.display = "none";
			nullBox.style.display = "flex";
		} else {
			checkDelButton.style.display = "inline-block";
			nullBox.style.display = "none";
		}
	});

	// 삭제 버튼 클릭 처리 함수
	function handleDeleteButtonClick(tabId) {
		var deleteButtons = document.querySelectorAll('#' + tabId + ' .check_del'); // 각 탭에서 삭제 버튼 선택
		deleteButtons.forEach(function(deleteButton) {
			deleteButton.addEventListener('click', function() {
				var checkedItems = []; // 체크된 품목 인덱스를 담을 배열

				// 현재 탭에서 선택된 체크박스들 선택
				var checkboxes = this.closest('.tabs_item').querySelectorAll('.fridge_list tbody .chk:checked');
				// 각 체크된 체크박스에서 품목 인덱스 추출하여 배열에 저장
				checkboxes.forEach(function(checkbox) {
					var row = checkbox.closest('tr'); // 체크박스의 부모 행(tr) 요소 가져오기
					var itemIndex = row.querySelector('.delete').getAttribute('data-ingre-idx'); // 품목 인덱스 추출
					checkedItems.push(itemIndex); // 배열에 품목 인덱스 추가
				});

				// 테스트 출력
				console.log("선택된 품목들: ", checkedItems);

				if (checkedItems.length > 0) {
					var xhr = new XMLHttpRequest();
					xhr.open('POST', 'IngredientSelectDeleteCon'); // 서블릿 경로 설정
					xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
					xhr.onload = function() {
						if (xhr.status === 200) {
							console.log("응답: ", xhr.responseText);
							window.location.reload();
							// 삭제 후에 해당 탭 내용 다시 불러오기
							refreshTabContent(tabId);
						} else {
							console.error('요청 실패: ', xhr.status);
							window.location.reload();
						}
					};
					xhr.onerror = function() {
						console.error('요청 오류');
						window.location.reload();
					};

					var params = checkedItems.map(function(item) {
						return 'ingre_idx=' + encodeURIComponent(item);
					}).join('&');

					console.log("전송할 파라미터: ", params); // 전송할 파라미터 확인
					xhr.send(params); // 선택된 품목 인덱스들을 URL 인코딩된 형식으로 전송
				} else {
					alert('삭제할 품목을 선택해주세요.');
				}
			});
		});
	}

	// 탭 내용 업데이트 함수
	function refreshTabContent(tabId) {
		var xhr = new XMLHttpRequest();
		xhr.open('GET', 'GetFridgeItems?tab=' + tabId); // 서버에서 탭 내용을 가져오는 경로 설정
		xhr.onload = function() {
			if (xhr.status === 200) {
				var tabContent = document.querySelector('#' + tabId + ' .fridge_list tbody');
				tabContent.innerHTML = xhr.responseText; // 새로운 탭 내용으로 업데이트
				console.log(tabId + ' 탭 내용 업데이트 완료');
				// 업데이트된 탭에 다시 삭제 버튼 처리 함수 연결
				handleDeleteButtonClick(tabId);
			} else {
				console.log('요청 실패: ', xhr.status);
			}
		};
		xhr.onerror = function() {
			console.error('요청 오류');
		};
		xhr.send();
	}

	// 각 탭에서 삭제 버튼 클릭 처리 함수 호출
	handleDeleteButtonClick('tab1'); // 냉장칸
	handleDeleteButtonClick('tab2'); // 야채칸
	handleDeleteButtonClick('tab3'); // 날개칸


});



//삭제 버튼
$(document).ready(function() {
	
	// 삭제 버튼 클릭 시
	$(".delete").click(function(event) {
		event.preventDefault(); // 기본 이벤트 방지 (href="#" 링크 디폴트 이벤트)

		// data-ingre-idx 속성 값 가져오기
		var ingreIdx = $(this).data('ingre-idx');

		// AJAX 요청
		$.ajax({
			type: "POST",
			url: "IngredientDeleteCon", // 서블릿 주소
			data: { ingre_idx: ingreIdx }, // 서블릿으로 전송할 데이터
			success: function(response) {
				console.log("삭제 요청 성공");
				// 페이지 새로고침
				location.reload();
			},
			error: function(err) {
				console.error("삭제 요청 실패", err);
				// 실패 시 처리
			}
		});
	});
	
});




