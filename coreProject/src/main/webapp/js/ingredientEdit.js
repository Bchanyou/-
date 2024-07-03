
/*
 * File Name : ingredientEdit.js
 * 작성일 : 2024-06-14
 */


/********************************************************
 
 *  품목 수정
 
 ********************************************************/

document.addEventListener('DOMContentLoaded', function() {

   var editButtons = document.querySelectorAll('.fridge_list td .edit');

   editButtons.forEach(function(button) {
      button.addEventListener('click', function(e) {
         e.preventDefault();

         var row = button.closest('tr');
         var cells = row.querySelectorAll('td');
         var currentLoca = document.querySelector('.tabs_cont_active .loca strong');
         
         // 셀에서 데이터 추출
         var itemName = cells[1].textContent.trim(); // 품목명
         var unitStock = cells[2].querySelector('span[name="bundle"]').textContent.trim();
         var unit = cells[2].querySelector('span[name="unit"]').textContent.trim();
         var stock = cells[3].textContent.trim(); // 수량
         var purchaseDate = cells[4].textContent.trim(); // 구매일
         var expiryDate = cells[5].textContent.trim(); // 유통기한
         var location = currentLoca.textContent.trim(); // 보관위치
         var idx=cells[7].textContent.trim(); // 수량
         console.log(unit);
         console.log(location);

         // 모달 박스에 데이터 채우기
         var modal = document.querySelector('.modal_box.edit');
         modal.querySelector('input[name="name"]').value = itemName;
         modal.querySelector('select[name="unit"]').value = unit;
         modal.querySelector('.unit .select_title span').innerHTML = unit;
         modal.querySelector('input[name="unit_stock"]').value = unitStock;
         modal.querySelector('input[name="stock"]').value = stock;
         modal.querySelector('input[name="date_buy"]').value = purchaseDate;
         modal.querySelector('input[name="date_exp"]').value = expiryDate;
         modal.querySelector('select[name="location"]').value = location;
         modal.querySelector('.loca .select_title span').innerHTML = location;
         modal.querySelector('input[name="idx"]').value = idx;


         // 단위 '개' 이외의 경우 입력활성화
         modal.addEventListener('click', function() {
            var selected = modal.querySelector('td.unit select');
            var unitInput = selected.closest('td.unit').querySelector('input.unit_input');

            if (selected.value === '개') {
               unitInput.disabled = true;
               unitInput.value = '';
            } else {
               unitInput.disabled = false;
            }

         });


      });


   });

});








