/*
 * File Name : common.js
 * 작성일 : 2024-06-14
 */

$(function() {

    "use strict";

    /*Document Ready Start---------------------------------------------------*/

    /*-----------------------------------------------------------------------------
    *  main header
    *----------------------------------------------------------------------------*/

    // index.jsp에서 header 디자인 변경
    if (window.location.pathname === '/coreProject/index.jsp') {
        $("#header").addClass("main_on");
    } else {
        $("#header").removeClass("main_on");
    }

    // 회원정보 sub menu
    $(".hdr_util .mem").on("mouseover", function() {
        $(this).children(".dep2").stop().fadeIn("fast");
    });

    $(".hdr_util .mem").on("mouseout", function() {
        $(this).children(".dep2").stop().fadeOut("fast");
    });

    // 알람표시
    var hasLiElements = $('.noti_list').find('li').length > 1;

    // li 요소가 존재할 경우 on 클래스 추가
    if (hasLiElements) {
        $('#bell').addClass('on');
    } else {
        $('#bell').removeClass('on');
    }

    /*-----------------------------------------------------------------------------
    *  품목 단위별 input 제어
    *----------------------------------------------------------------------------*/

    $('.unit .select').change(function() {
        var selectedOption = $(this).val();
        var unitInput = $(this).closest('td').find('input');

        if (selectedOption === '개') {
            unitInput.prop('disabled', true).val(''); // 입력 필드 비활성화
        } else {
            unitInput.prop('disabled', false); // 입력 필드 활성화
        }
    });

    /*-----------------------------------------------------------------------------
     *  Drop Down
     *----------------------------------------------------------------------------*/

    $(".drop_sub").hide();

    $('.drop_title a').on("click", function(event) {
        event.stopPropagation();
        $(".drop_sub").slideUp("fast");
        $('.drop_title').removeClass("active");
        if (!$(this).parent().next(".drop_sub").is(":visible")) {
            $(this).parent().next(".drop_sub").slideDown("fast");
            $(this).parent().addClass("active");
        }
        return false;
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
            $($('.tabs_item')[item]).addClass('tabs_cont_active').siblings().removeClass('tabs_cont_active');
            $($('.tabs_item')[item]).fadeIn().siblings().hide();
        });
    });

    /*-----------------------------------------------------------------------------
     *  Check All
     *----------------------------------------------------------------------------*/

    // 냉장고 칸 별, 전체 체크 
    $('.chk_all').change(function() {
        var isChecked = $(this).prop('checked');
        $(this).closest('table').find('.chk').prop('checked', isChecked);
    });

    // 다른 칸 클릭 시, 기존 칸 체크 삭제
    $(".tab").on("click", function() {
        $('.chk').prop('checked', false);
    });

    /*-----------------------------------------------------------------------------
     *  Modal 
     *----------------------------------------------------------------------------*/

    $(".btn_modal").click(function() {
        $(".modal_box.add").addClass("on");
        $(".modal_back").fadeIn();
    });

    // 품목 수정 모달
    $(".btn.edit").click(function() {
        $(".modal_box.edit").addClass("on");
        $(".modal_back").fadeIn();
    });

    // 알람 모달
    $(".bell_modal").click(function() {
        $(".modal_box.alarm").addClass("on");
        $(".modal_back").fadeIn();
    });

    // 모달 닫기
    $(".btn_modal_close").click(function() {
        $(".modal_back").fadeOut();
        $(".modal_box").removeClass("on");
    });

    /*Document Ready End----------------------------------------------------*/
});

/*-----------------------------------------------------------------------------
*  Join / Login
*----------------------------------------------------------------------------*/

// join : 중복 체크 함수
function submitForm(action) {
    var userId = document.getElementsByName('id')[0].value;
    $.ajax({
        type: 'post',
        url: action,
        data: { id: userId },
        success: function(response) {
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

// join : 중복 체크 함수(이메일)
function submitFormEmail(action) {
    var userId = document.getElementsByName('id')[0].value;
    var userPw = document.getElementsByName('pw')[0].value;
    var userPwCheck = document.getElementsByName('pw_check')[0].value;
    var userName = document.getElementsByName('name')[0].value;
    var userPhone = document.getElementsByName('phone')[0].value;
    var userEmail = document.getElementsByName('mail')[0].value;
    var emailDomain = document.getElementsByName('slt_mail')[0].value;

    if (userId === '' || userPw === '' || userPwCheck === '' || userName === '' || userPhone === '' || userEmail === '' || emailDomain === '선택하세요') {
        alert('모든 정보를 입력해주세요.');
        return false;
    }

    // 비밀번호 규칙 검증
    var pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!pwRegex.test(userPw)) {
        alert("비밀번호는 8자 이상, 영문자, 숫자, 특수문자를 포함해야 합니다.");
        return false;
    }

    if (userPw !== userPwCheck) {
        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return false;
    }

    // AJAX 요청
    $.ajax({
        type: 'post',
        url: action, // 서블릿 URL 또는 컨트롤러 경로
        data: { mail: userEmail, slt_mail: emailDomain }, // 서버로 전송할 데이터
        success: function(response) {
            console.log('Server response:', response); // 서버 응답 로그
            var trimmedResponse = response.trim();
            if (trimmedResponse === 'available') {
                alert('회원가입이 완료되었습니다.');
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
            window.location.href = 'login.jsp';
        },
        error: function() {
            alert('폼 전송 중 오류가 발생했습니다.');
        }
    });
}

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
