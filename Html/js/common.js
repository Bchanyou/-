
/*
 * File Name : common.js
 * 작성일 : 2024-06-14
 */


/********************************************************
 
 *  Common
 
 ********************************************************/

$(function () {

	"use strict";

	/*Document Ready Start---------------------------------------------------*/

	/*-----------------------------------------------------------------------------
	 *  Drop Down
	 *----------------------------------------------------------------------------*/

	$(".drop_sub").hide();

	$('.drop_title').on("click", function (event) {
		event.stopPropagation();
		$(".drop_sub").slideUp("fast");
		$('.drop_title').removeClass("active");
		if (!$(this).next("ul").is(":visible")) {
			$(this).next("ul").slideDown("fast");
			$(this).addClass("active");
		}
	});

	$(document).on("click", function () {
		$('.drop_sub').slideUp("fast");
		$('.drop_title').removeClass("active");
	});


	/*-----------------------------------------------------------------------------
	 *  Check All
	 *----------------------------------------------------------------------------*/

	$("#check_all").click(function () {

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

	$(".btn_modal").click(function () {
		$(".modal_box").addClass("on");
		$(".modal_back").fadeIn();
	})

	$(".btn_modal_close").click(function () {
		$(".modal_back").fadeOut();
		$(".modal_box").removeClass("on");
	})


	/*-----------------------------------------------------------------------------
	 *  행 삭제 
	 *----------------------------------------------------------------------------*/

	$(function () {

		//행삭제 버튼
		var delBtn = $(".btn_del");

		$(delBtn).click(function () {
			// 변수 = 테이블의 2번째 tr을 삭제
			var pointRow = $(".add_list tr:last");
			if(pointRow.index() != 2){
				pointRow.remove();
			}
							
			
		});
	});



	/*Document Ready End----------------------------------------------------*/

});



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
!function (t, e, i, s) { "use strict"; function n(e, i) { this.$select = t(e), this.$clicker = null, this.$ul = null, this.settings = t.extend({}, h, i), l.apply(this) } function l() { var e = this, n = "" !== this.settings.theme && this.settings.theme !== s ? " " + this.settings.theme : ""; if (this.$select.attr("name") === s) throw this.$select.wrap('<span style="outline: 5px solid red">'), "Name attribute must be specified"; this.$select.wrap('<div class="select_box' + n + '"></div>').parent().append('<a href="#" class="select_title"><span></span><div class="arrow"></div></a><ul></ul>'), this.$clicker = this.$select.siblings(".select_title"), this.$ul = this.$select.siblings("ul"), this.$clicker.on("click", function (s) { s.preventDefault(), s.stopPropagation(), 0 === d.length && t(i).on("click", function () { e.close() }), e.settings.allowMultiple || e.close(null, e.$select), e.$ul.find("li").length > 0 && (t(this).hasClass("open") ? e.close(e.$select) : (t(this).addClass("open"), e.$ul.stop(!0).slideDown(e.settings.transitionSpeed))) }), 0 === d.length && t(i).on("click", function () { e.close() }), d.push(this.$select), this.update() } function a(t) { t !== o.apply(this) && (this.$select.find("option").removeAttr("selected").prop("selected", !1).eq(t).attr("selected", "selected").prop("selected", !0), this.$select.trigger("change"), c.apply(this)), this.close() } function c() { this.$clicker.find("span").text(this.$select.find("option:selected").text()), this.$ul.find("a").removeClass("selected"), this.$ul.find('a[data-index="' + o.apply(this) + '"]').addClass("selected") } function o() { if (this.$select.find("optgroup").length > 0) { var e = 0, i = 0; return t.each(this.$select.find("optgroup"), function () { t.each(t(this).find("option"), function () { t(this).is(":selected") && (i = e), e++ }) }), i } return this.$select.find("option:selected").index() } var p = "select_box", h = { transitionSpeed: 150, allowMultiple: !0, theme: "" }, d = []; t.extend(n.prototype, { update: function () { var e = this; if (this.$ul.find("a").unbind(), this.$ul.empty(), this.$select.find("optgroup").length > 0) { var i = 0; t.each(this.$select.find("optgroup"), function (s, n) { e.$ul.append('<li class="optgroup"><span>' + t(n).attr("label") + "</span></li>"), t.each(t(this).find("option"), function (s, n) { e.$ul.append('<li class="option"><a href="#" data-value="' + t(n).val() + '" data-index="' + i + '">' + t(n).text() + "</a></li>"), i++ }) }) } else t.each(this.$select.find("option"), function (i, s) { e.$ul.append('<li class="option"><a href="#" data-value="' + t(s).val() + '" data-index="' + i + '">' + t(s).text() + "</a></li>") }); 0 === this.$select.find("option[selected]").length && this.$select.find("option").eq(0).attr("selected", "selected"), c.apply(e), this.$select.trigger("update"), this.$ul.find("a").unbind().on("click", function (i) { i.preventDefault(), i.stopPropagation(), a.apply(e, [parseInt(t(this).attr("data-index"))]) }) }, close: function (e, i) { var n = this; e instanceof t ? e.siblings(".select_title").hasClass("open") && (e.siblings(".select_title").removeClass("open"), e.siblings("ul").stop(!0).slideUp(this.settings.transitionSpeed)) : t.each(d, function () { i !== s && this.attr("name") === i.attr("name") || n.close(this) }) } }), t.fn[p] = function (e) { return this.each(function () { if (t.data(this, "plugin_" + p)) switch (e) { case "update": t(this).data("plugin_" + p).update(); break; case "close": t(this).data("plugin_" + p).close(t(this)) } else t.data(this, "plugin_" + p, new n(this, e)) }) } }(jQuery, window, document);

(function ($) {
	$(document).ready(function () {
		if ($(window).width() > 768) {
			$('.select').select_box({ allowMultiple: false });
		}
	});

})(jQuery);

