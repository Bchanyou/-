
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
		if (!$(this).next(".drop_sub").is(":visible")) {
			$(this).next(".drop_sub").slideDown("fast");
			$(this).addClass("active");
		}
	});

	$(document).on("click", function() {
		$('.drop_sub').slideUp("fast");
		$('.drop_title').removeClass("active");
	});


	/*-----------------------------------------------------------------------------
	  *  Tabs
	  *----------------------------------------------------------------------------*/

	$('.tab').each(function(item) {
		$(this).click(function() {
			$(this).addClass('tabs_head_active').siblings().removeClass('tabs_head_active');
			$($('.tabs_item')[item]).fadeIn().siblings().hide();
		});
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



	/*Document Ready End----------------------------------------------------*/
})



/*-----------------------------------------------------------------------------

*  Sub01 : My냉장고

*----------------------------------------------------------------------------*/

console.log(window.location.pathname);

/*if (window.location.pathname === '/coreProject/my_fridge.jsp') {*/

console.log("gk")
document.addEventListener('DOMContentLoaded', function() {

	/*-----------------------------------------------------------------------------
	*  품목리스트
	*----------------------------------------------------------------------------*/

	var rowCount = $('.fridge_list tbody tr').length;
	if (rowCount < 2) {
		// 행이 없을 경우
		$('.fridge_null').show();
		$('.check_del').hide();
	} else {
		// 행이 있을 경우
		$('.fridge_null').hide();
		$('.check_del').show();
	}

	/*-----------------------------------------------------------------------------
	*  품목추가(팝업창)
	*----------------------------------------------------------------------------*/

	// 품목 단위가 ml일 경우 입력 비활성화
	document.querySelector('td.unit select').addEventListener('change', function() {
		const selectedValue = $(this).val();
		const unitInput = $(this).closest('td.unit').find('input');

		if (selectedValue === 'ml') {
			unitInput.prop('disabled', false);
		} else {
			unitInput.prop('disabled', true);
		}
	});

	// 품목 행 추가
	const addRowButton = document.querySelector('.row_add');

	addRowButton.addEventListener('click', function() {

		const tbody = document.querySelector('.add_list tbody');
		const newRow = document.createElement('tr');

		// No. 열
		const tdNo = document.createElement('td');
		tdNo.textContent = tbody.children.length + 1;
		newRow.appendChild(tdNo);

		// 품목명 열
		const tdItemName = document.createElement('td');
		const inputItemName = document.createElement('input');
		inputItemName.type = 'text';
		inputItemName.placeholder = '품목명 입력';
		tdItemName.appendChild(inputItemName);
		newRow.appendChild(tdItemName);

		// 단위 열
		const tdUnit = document.createElement('td');
		const divUnit = document.createElement('div');
		divUnit.classList.add('select_wrap');
		const selectUnit = document.createElement('select');
		selectUnit.name = 'unit';
		selectUnit.classList.add('select');
		selectUnit.title = '품목 단위';
		const option1 = document.createElement('option');
		option1.textContent = '개';
		option1.selected = true;
		const option2 = document.createElement('option');
		option2.textContent = 'ml';
		selectUnit.appendChild(option1);
		selectUnit.appendChild(option2);
		divUnit.appendChild(selectUnit);
		const inputUnitInput = document.createElement('input');
		inputUnitInput.type = 'text';
		inputUnitInput.classList.add('unit_input');
		inputUnitInput.disabled = true;
		tdUnit.className = 'unit';
		tdUnit.appendChild(divUnit);
		tdUnit.appendChild(inputUnitInput);
		newRow.appendChild(tdUnit);

		// 수량 열
		const tdQuantity = document.createElement('td');
		const inputQuantity = document.createElement('input');
		tdQuantity.className = 'qtt_num';
		inputQuantity.type = 'number';
		inputQuantity.value = '1';
		tdQuantity.appendChild(inputQuantity);
		newRow.appendChild(tdQuantity);

		// 구매날짜 열
		const tdPurchaseDate = document.createElement('td');
		const inputPurchaseDate = document.createElement('input');
		inputPurchaseDate.type = 'date';
		inputPurchaseDate.classList.add('date_format');
		tdPurchaseDate.appendChild(inputPurchaseDate);
		newRow.appendChild(tdPurchaseDate);

		// 유통기한 및 파일 업로드 열
		var tdExpiryDateFile = document.createElement('td');
		tdExpiryDateFile.className = 'date_picker exp';
		var inputExpiryDate = document.createElement('input');
		inputExpiryDate.type = 'date';
		inputExpiryDate.id = 'date_exp';
		inputExpiryDate.name = 'date_exp';
		inputExpiryDate.className = 'date_format';
		tdExpiryDateFile.appendChild(inputExpiryDate);
		var inputFile = document.createElement('input');
		inputFile.type = 'file';
		inputFile.id = 'file' + (tbody.children.length + 1);
		inputFile.className = 'inpFile';
		tdExpiryDateFile.appendChild(inputFile);
		var labelFileUpload = document.createElement('label');
		labelFileUpload.setAttribute('for', 'file' + (tbody.children.length + 1));
		labelFileUpload.className = 'file_upload';
		var iconFile = document.createElement('i');
		iconFile.className = 'fa-regular fa-file-image fa-xl';
		iconFile.style.color = '#2ec758';
		labelFileUpload.appendChild(iconFile);
		tdExpiryDateFile.appendChild(labelFileUpload);
		newRow.appendChild(tdExpiryDateFile);


		// 위치 열
		const tdLocation = document.createElement('td');
		const divLocation = document.createElement('div');
		divLocation.classList.add('select_wrap', 'loca');
		const selectLocation = document.createElement('select');
		selectLocation.name = 'location';
		selectLocation.classList.add('select');
		selectLocation.title = '보관위치';
		const optionLoc1 = document.createElement('option');
		optionLoc1.textContent = '냉장칸';
		optionLoc1.selected = true;
		const optionLoc2 = document.createElement('option');
		optionLoc2.textContent = '야채칸';
		const optionLoc3 = document.createElement('option');
		optionLoc3.textContent = '날개칸';
		selectLocation.appendChild(optionLoc1);
		selectLocation.appendChild(optionLoc2);
		selectLocation.appendChild(optionLoc3);
		divLocation.appendChild(selectLocation);
		tdLocation.appendChild(divLocation);
		newRow.appendChild(tdLocation);

		// 삭제 버튼 열
		const tdDelete = document.createElement('td');
		const divDelete = document.createElement('div');
		divDelete.classList.add('row_del');
		const deleteLink = document.createElement('a');
		deleteLink.href = '#;';
		const deleteImg = document.createElement('img');
		deleteImg.src = './images/sub/delete.png';
		deleteImg.alt = '행 삭제 버튼';
		deleteLink.appendChild(deleteImg);
		divDelete.appendChild(deleteLink);
		tdDelete.appendChild(divDelete);
		newRow.appendChild(tdDelete);

		// 테이블에 새로운 행 추가
		tbody.appendChild(newRow);

		// 새로 추가된 행에 삭제 이벤트 리스너 추가
		divDelete.addEventListener('click', function() {
			newRow.remove(); // 현재 행 삭제
			updateRowCnt(); // 행 번호 업데이트
		});

		// 새로 추가된 행에 셀렉트 기능 추가
		$('.select').select_box({ allowMultiple: false });


		// 새로 추가된 행에 수량입력 제어기능 추가
		$('td.unit select').on('change', function() {
			const selectedValue = $(this).val();
			const unitInput = $(this).closest('td.unit').find('input');

			if (selectedValue === 'ml') {
				unitInput.prop('disabled', false);
			} else {
				unitInput.prop('disabled', true);
			}
		});

	});

	// 기본 행 삭제
	document.querySelectorAll('.row_del').forEach(function(button) {
		button.addEventListener('click', function() {
			const row = button.closest('tr');
			if (row) {
				row.remove();
				updateRowCnt();
			}
		});
	});

	// 품목 행 넘버 업데이트
	function updateRowCnt() {
		var rowCntNew = 1;
		$('.add_list tbody tr').each(function(index) {
			$(this).find('td:first-child').text(rowCntNew++);
		});
	}
})

/*} else if (window.location.pathname === '/inquiry_write.jsp') {*/

/*-----------------------------------------------------------------------------
 *  문의_이미지업로드
 *----------------------------------------------------------------------------*/

function enviarPhoto() {
	const file = document.querySelector('input')
	const reader = new FileReader()

	const pictureHtml = document.querySelector('.photo')
	reader.readAsDataURL(file.files[0])

	reader.onload = file => {
		const image = file.target.result
		pictureHtml.classList.add('active')
		pictureHtml.style.backgroundImage = `url('${image}')`
	}
}


/*}*/


/*-----------------------------------------------------------------------------

*  Join / Login

*----------------------------------------------------------------------------*/


// join : 중복 체크 함수
function submitForm(action) {
	var userId = document.getElementsByName('id')[0].value;
	$.ajax({
		type: "post",
		url: action,
		data: { id: userId },
		success: function(response) {
			if (response.trim() === 'available') {
				alert('사용 가능한 아이디입니다.');
				console(response)
				document.getElementsByName('id_check')[0].value = '중복확인완료'// 중복확인로직통과한경우 중복확인완료
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


// join : 중복 체크 함수
function checkDuplicate(action) {
	var userId = document.getElementsByName('id')[0].value;
	$.ajax({
		type: "post",
		url: action,
		data: { id: userId },
		success: function(response) {
			if (response.trim() === 'available') {
				alert('사용 가능한 아이디입니다.');
				document.getElementsByName('id_check')[0].value = '중복확인완료'; // 중복확인 로직 통과한 경우 중복확인완료 설정
			} else {
				alert('이미 사용 중인 아이디입니다.');
				document.getElementsByName('id')[0].value = ''; // 입력 필드 초기화
				document.getElementsByName('id')[0].focus(); // 포커스 설정
			}
		},
		error: function() {
			alert('서버 오류가 발생했습니다.');
		}
	});
}

function submitFormEmail(action) {
    var idCheckValue = document.getElementsByName('id_check')[0].value;
    if (idCheckValue !== '중복확인완료') {
        alert('아이디 중복 확인을 먼저 진행해주세요.');
        return; // 함수 종료
    }

    var userEmail = document.getElementsByName('mail')[0].value;
    var emailDomain = document.getElementsByName('slt_mail')[0].value;

    $.ajax({
        type: "post",
        url: action, // 서블릿 URL 또는 컨트롤러 경로
        data: { mail: userEmail, slt_mail: emailDomain }, // 서버로 전송할 데이터
        success: function(response) {
            console.log('Server response:', response);
            var trimmedResponse = response.trim();
            if (trimmedResponse === 'available') {
                alert('사용 가능한 이메일입니다.');
                window.location.href = "MemberJoinCon"; // 페이지 리다이렉트
            } else if (trimmedResponse === 'unavailable') {
                alert('이미 사용 중인 이메일입니다.');
                resetEmailField();
            } else {
                alert('알 수 없는 오류가 발생했습니다.');
            }
        },
        error: function(request, status, error) {
            alert("서버 요청에 실패했습니다. 상태 코드: " + request.status);
        }
    });
}



function resetEmailField() {
    document.getElementsByName('mail')[0].value = ''; // 입력 필드 초기화
    document.getElementsByName('mail')[0].focus(); // 포커스 설정
}



$(document).ready(function() {
	// 회원 정보 수정 폼 제출 이벤트 핸들러
	$("form[name='editForm']").submit(function(event) {
		event.preventDefault(); // 기본 제출 행동 방지

		var formData = $(this).serialize(); // 폼 데이터 직렬화

		// AJAX 요청
		$.ajax({
			type: "post",
			url: "MemberEditCon",
			data: formData,
			success: function(response) {
				if (response === "success") {
					alert("회원 정보가 성공적으로 수정되었습니다.");
					window.location.href = "profile.jsp"; // 성공 시 프로필 페이지로 이동
				} else {
					alert(response); // 실패 또는 오류 메시지 출력
				}
			},
			error: function(xhr, status, error) {
				console.error(xhr.responseText);
				alert("서버 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
			}
		});
	});
});

function submitFormEmail2(action) {
	console.log("함수 호출됨");
    var userEmail = document.getElementsByName('mail')[0].value;
    var emailDomain = document.getElementsByName('slt_mail')[0].value;

    $.ajax({
        type: "post",
        url: action, // 서블릿 URL 또는 컨트롤러 경로
        data: { mail: userEmail, slt_mail: emailDomain }, // 서버로 전송할 데이터
        success: function(response) {
            console.log('Server response:', response);
            var trimmedResponse = response.trim();
            if (trimmedResponse === 'available') {
                alert('사용 가능한 이메일입니다.');
                window.location.href = "MemberJoinCon"; // 페이지 리다이렉트
            } else if (trimmedResponse === 'unavailable') {
                alert('이미 사용 중인 이메일입니다.');
                resetEmailField();
            } else {
                alert('알 수 없는 오류가 발생했습니다.');
            }
        },
        error: function(request, status, error) {
            alert("서버 요청에 실패했습니다. 상태 코드: " + request.status);
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
			alert('회원가입 정보 전송 실패');
		}
	});
}





// login : 실패 알림




/*-----------------------------------------------------------------------------
*  Select
*----------------------------------------------------------------------------*/

/*
 * Project: Select_box
 * Description: Select dropdown jQuery plug-in
 * Author: https://github.com/Wancieho
 * License: MIT
 * Version: 0.0.4
 * Dependancies: jquery-1.*
 * Date: 24/11/2016
 */
!function(t, e, i, s) { "use strict"; function n(e, i) { this.$select = t(e), this.$clicker = null, this.$ul = null, this.settings = t.extend({}, h, i), l.apply(this) } function l() { var e = this, n = "" !== this.settings.theme && this.settings.theme !== s ? " " + this.settings.theme : ""; if (this.$select.attr("name") === s) throw this.$select.wrap('<span style="outline: 5px solid red">'), "Name attribute must be specified"; this.$select.wrap('<div class="select_box' + n + '"></div>').parent().append('<a href="#" class="select_title"><span></span><div class="arrow"></div></a><ul></ul>'), this.$clicker = this.$select.siblings(".select_title"), this.$ul = this.$select.siblings("ul"), this.$clicker.on("click", function(s) { s.preventDefault(), s.stopPropagation(), 0 === d.length && t(i).on("click", function() { e.close() }), e.settings.allowMultiple || e.close(null, e.$select), e.$ul.find("li").length > 0 && (t(this).hasClass("open") ? e.close(e.$select) : (t(this).addClass("open"), e.$ul.stop(!0).slideDown(e.settings.transitionSpeed))) }), 0 === d.length && t(i).on("click", function() { e.close() }), d.push(this.$select), this.update() } function a(t) { t !== o.apply(this) && (this.$select.find("option").removeAttr("selected").prop("selected", !1).eq(t).attr("selected", "selected").prop("selected", !0), this.$select.trigger("change"), c.apply(this)), this.close() } function c() { this.$clicker.find("span").text(this.$select.find("option:selected").text()), this.$ul.find("a").removeClass("selected"), this.$ul.find('a[data-index="' + o.apply(this) + '"]').addClass("selected") } function o() { if (this.$select.find("optgroup").length > 0) { var e = 0, i = 0; return t.each(this.$select.find("optgroup"), function() { t.each(t(this).find("option"), function() { t(this).is(":selected") && (i = e), e++ }) }), i } return this.$select.find("option:selected").index() } var p = "select_box", h = { transitionSpeed: 150, allowMultiple: !0, theme: "" }, d = []; t.extend(n.prototype, { update: function() { var e = this; if (this.$ul.find("a").unbind(), this.$ul.empty(), this.$select.find("optgroup").length > 0) { var i = 0; t.each(this.$select.find("optgroup"), function(s, n) { e.$ul.append('<li class="optgroup"><span>' + t(n).attr("label") + "</span></li>"), t.each(t(this).find("option"), function(s, n) { e.$ul.append('<li class="option"><a href="#" data-value="' + t(n).val() + '" data-index="' + i + '">' + t(n).text() + "</a></li>"), i++ }) }) } else t.each(this.$select.find("option"), function(i, s) { e.$ul.append('<li class="option"><a href="#" data-value="' + t(s).val() + '" data-index="' + i + '">' + t(s).text() + "</a></li>") }); 0 === this.$select.find("option[selected]").length && this.$select.find("option").eq(0).attr("selected", "selected"), c.apply(e), this.$select.trigger("update"), this.$ul.find("a").unbind().on("click", function(i) { i.preventDefault(), i.stopPropagation(), a.apply(e, [parseInt(t(this).attr("data-index"))]) }) }, close: function(e, i) { var n = this; e instanceof t ? e.siblings(".select_title").hasClass("open") && (e.siblings(".select_title").removeClass("open"), e.siblings("ul").stop(!0).slideUp(this.settings.transitionSpeed)) : t.each(d, function() { i !== s && this.attr("name") === i.attr("name") || n.close(this) }) } }), t.fn[p] = function(e) { return this.each(function() { if (t.data(this, "plugin_" + p)) switch (e) { case "update": t(this).data("plugin_" + p).update(); break; case "close": t(this).data("plugin_" + p).close(t(this)) } else t.data(this, "plugin_" + p, new n(this, e)) }) } }(jQuery, window, document);


(function($) {
	$(document).ready(function() {

		// 초기 로드 시 select_box 플러그인 적용
		$('.select').select_box({ allowMultiple: false });

		// 행 추가 버튼 클릭 시
		$('.row_add').on('click', function() {

			// 새로운 행에 대해 select_box 플러그인 다시 적용
			$('.select').select_box({ allowMultiple: false });
		});
	});
})(jQuery);








