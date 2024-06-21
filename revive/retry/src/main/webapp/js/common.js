
/*
 * File Name : common.js
 * 작성일 : 2024-06-14
 */


/********************************************************
 
 *  Common
 
 ********************************************************/

$(function() {

	"use strict";

	/*Document Ready Start---------------------------------------------------*/

	/*-----------------------------------------------------------------------------
	 *  Drop Down
	 *----------------------------------------------------------------------------*/

	$(".drop_sub").hide();

	$('.drop_title').on("click", function(event) {
		event.stopPropagation();
		$(".drop_sub").slideUp("fast");
		$('.drop_title').removeClass("active");
		if (!$(this).next("ul").is(":visible")) {
			$(this).next("ul").slideDown("fast");
			$(this).addClass("active");
		}
	});

	$(document).on("click", function() {
		$('.drop_sub').slideUp("fast");
		$('.drop_title').removeClass("active");
	});


	/*-----------------------------------------------------------------------------
	 *  Check All
	 *----------------------------------------------------------------------------*/

	$("#check_all").click(function() {

		var check = $("#check_all").prop("checked");
		if (check) {
			$("input.chk").prop("checked", true);
		} else {
			$("input.chk").prop("checked", false);

		}

	})


	/*-----------------------------------------------------------------------------
	 *  Modal 
	 *----------------------------------------------------------------------------*/

	$(".btn_modal").click(function() {
		$(".modal_box").addClass("on");
		$(".modal_back").fadeIn();
	})

	$(".btn_modal_close").click(function() {
		$(".modal_back").fadeOut();
		$(".modal_box").removeClass("on");
	})



	
	

});


/*-----------------------------------------------------------------------------
*  품목추가
*----------------------------------------------------------------------------*/

$(document).ready(function() {
	
	// 선택 단위가 ml일 경우 입력 비활성화
	$('td.unit select').on('change', function() {
		const selectedValue = $(this).val();
		const unitInput = $(this).closest('td.unit').find('input');

		if (selectedValue === 'ml') {
			unitInput.prop('disabled', false);
		} else {
			unitInput.prop('disabled', true);
		}
	});

	// 테이블 상태 업데이트 함수
	function updateFridgeTable() {
		var rowCount = $('.fridge_list tbody tr').length;
		console.log(rowCount)
		if (rowCount === 0) {
			// 행이 없을 경우
			$('.fridge_null').show();
			$('.check_del').hide();

		} else {
			// 행이 있을 경우
			$('.fridge_null').hide();
			$('.check_del').show();
		}
	}

	updateFridgeTable(); // 테이블 상태 업데이트

	// 행 추가 및 삭제
	$(".row_add").click(function() {
		var rowCnt = $(".add_list tbody tr").length;
		rowCnt += 1;
		let rowAdd = $(".add_list tbody").append("<tr><td>" + rowCnt + "</td><td><input type='text' placeholder='품목명 입력'></td><td class='unit'><input type='text'><div class='select_wrap'><select name='unit' class='select' title='품목 단위'><option selected>개</option><option>ml</option></select></div></td><td class='qtt_num'><input type='number' value='1'></td><td class='date_picker'><input type='date' id='date_buy" + rowCnt + "' class='date_format' onchange='formatDate()'></td><td class='date_picker'><input type='date' id='date_exp' class='date_format' onchange='formatDate()'></td><td><div class='select_wrap loca'><select name='location' class='select' title='보관위치'><option selected>냉장칸</option><option>야채칸</option><option>날개칸</option></select></div></td><td><div class='row_del'><a href='#;'><img src='./images/sub/delete.png' alt='행 삭제 버튼'></a></div></td></tr>");


		// 행 삭제 버튼 클릭
		rowAdd.find('.row_del').click(function(e) {
			e.preventDefault(); // 기본 동작 방지
			$(this).closest('tr').remove(); // 해당 행 삭제
			updateRowCnt(); // 행 삭제 후 행 번호 업데이트
		});

		$('.add_list tbody').append(rowAdd); // 새로운 행 추가

	});

	// 행 삭제 후 행 번호 업데이트
	function updateRowCnt() {
		var rowCntNew = 1;
		$('.add_list tbody tr').each(function(index) {
			$(this).find('td:first-child').text(rowCntNew++);
		});
	}




	/*Document Ready End----------------------------------------------------*/
})
// 중복 체크 함수
function submitForm(action) {
	var userId = document.getElementsByName('id')[0].value;
	$.ajax({
		type: 'post',
		url: action,
		data: { id: userId },
		success: function(response) {
			console.log('Server response:', response);
			
			if (response.trim() === 'available') {
				alert('사용 가능한 아이디입니다.');
			} else {
				alert('이미 사용 중인 아이디입니다.');
				document.getElementsByName('id')[0].value = ''; // 입력 필드 지우기
				document.getElementsByName('id')[0].focus(); // 입력 필드 포커스
			}
		},
		error: function() {
			alert('서버 오류가 발생했습니다.');
		}
	});
}

// 중복 체크 함수(이메일)
function submitFormEmail(action) {
    var userEmail = document.getElementsByName('mail')[0].value;
    var emailDomain = document.getElementsByName('slt_mail')[0].value;
    
    // AJAX 요청
    $.ajax({
        type: 'post',
        url: action, // 서블릿 URL 또는 컨트롤러 경로
        data: { mail: userEmail, emailname: emailDomain }, // 서버로 전송할 데이터
        success: function(response) {
            console.log('Server response:', response); // 서버 응답 로그
            var trimmedResponse = response.trim();
            if (trimmedResponse === 'available') {
                alert('사용 가능한 이메일입니다.');
                // 이메일이 사용 가능한 경우 폼 데이터를 MemberJoinCon으로 전송
                submitFormWithData();
            } else if (trimmedResponse === 'unavailable') {
                alert('이미 사용 중인 이메일입니다.');
                document.getElementsByName('mail')[0].value = ''; // 입력 필드 초기화
                document.getElementsByName('mail')[0].focus(); // 포커스 설정
            } else {
                alert('서버의 응답을 이해할 수 없습니다: ' + trimmedResponse);
            }
        },
        error: function() {
            alert('서버 오류가 발생했습니다.');
        }
    });
}

// 폼 데이터를 포함하여 submit하는 함수
function submitFormWithData() {
    var formData = $('#joinForm').serialize(); // 폼 데이터 직렬화
    $.ajax({
        type: 'post',
        url: 'MemberJoinCon', // 서블릿 경로 설정
        data: formData, // 직렬화된 폼 데이터 전송
        success: function(response) {
            console.log('폼이 성공적으로 제출되었습니다:', response); // 성공 메시지 출력
            // 필요한 경우 추가 작업 수행
             window.location.href = 'login.jsp'
        },
        error: function() {
            alert('폼 전송 중 오류가 발생했습니다.');
        }
    });
}

