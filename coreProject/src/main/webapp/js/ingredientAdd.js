
/*
 * File Name : ingredientAdd.js
 * 작성일 : 2024-06-14
 */


/********************************************************
 
 *  품목 추가
 ********************************************************/

document.addEventListener('DOMContentLoaded', function() {
	

	//구매일의 기본값을 현재 날짜로 지정
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 필요
	var day = ('0' + currentDate.getDate()).slice(-2); // 일자 형식을 맞추기 위해 0을 추가
	var dateInput = document.getElementsByName('date_buy');
	dateInput[0].value = year + '-' + month + '-' + day;


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
		inputItemName.name = 'name'
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
		const option3 = document.createElement('option');
		option3.textContent = 'g';
		selectUnit.appendChild(option1);
		selectUnit.appendChild(option2);
		selectUnit.appendChild(option3);
		divUnit.appendChild(selectUnit);
		const inputUnitInput = document.createElement('input');
		inputUnitInput.type = 'number';
		inputUnitInput.name = 'unit_stock';
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
		inputQuantity.name = 'stock';
		inputQuantity.value = '1';
		tdQuantity.appendChild(inputQuantity);
		newRow.appendChild(tdQuantity);

		// 구매날짜 열
		const tdPurchaseDate = document.createElement('td');
		const inputPurchaseDate = document.createElement('input');
		tdPurchaseDate.className = 'date_picker';
		inputPurchaseDate.type = 'date';
		inputPurchaseDate.name = 'date_buy';
		inputPurchaseDate.classList.add('date_format');
		tdPurchaseDate.appendChild(inputPurchaseDate);
		newRow.appendChild(tdPurchaseDate);
		var currentDate = new Date();
		var year = currentDate.getFullYear();
		var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 +1 필요
		var day = ('0' + currentDate.getDate()).slice(-2); // 일자 형식을 맞추기 위해 0을 추가
		inputPurchaseDate.value = year + '-' + month + '-' + day;

		// 유통기한 및 파일 업로드 열
		var tdExpiryDateFile = document.createElement('td');
		tdExpiryDateFile.className = 'date_picker exp';
		var inputExpiryDate = document.createElement('input');
		inputExpiryDate.type = 'date';
		inputExpiryDate.name = 'date_exp';
		inputExpiryDate.className = 'date_format';
		tdExpiryDateFile.appendChild(inputExpiryDate);
		var inputFile = document.createElement('input');
		inputFile.type = 'file';
		inputFile.id = 'file' + (tbody.children.length + 1);
		inputFile.className = 'inpFile';
		tdExpiryDateFile.appendChild(inputFile);
		var labelFileUpload = document.createElement('label');
		labelFileUpload.setAttribute('for', 'file'
			+ (tbody.children.length + 1));
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

		//			const tdIndex = document.activeElement('td');

		tbody.appendChild(newRow);

		// 새로 추가된 행에 삭제 이벤트 리스너 추가
		divDelete.addEventListener('click', function() {
			newRow.remove(); // 현재 행 삭제
			updateRowCnt(); // 행 번호 업데이트
		});

		// 새로 추가된 행에 셀렉트 기능 추가
		$('.select').select_box({
			allowMultiple: false
		});

	

		// 새로 추가된 행에 품목 단위별 input 제어
		$('.unit .select').change(function() {
			var selectedOption = $(this).val();
			var unitInput = $(this).closest('td').find('input');

			if (selectedOption !== '개') {
				// 선택된 옵션이 '개'가 아닌 경우
				unitInput.prop('disabled', false); // 입력 필드 활성화
			} else {
				// '개' 선택된 경우
				unitInput.prop('disabled', true).val(''); // 입력 필드 비활성화
			}
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
			var rows = document.querySelectorAll('.add_list tbody tr');

			rows.forEach(function(row) {
				var firstCell = row.querySelector('td:first-child');
				if (firstCell) {
					firstCell.textContent = rowCntNew++;
				}
			});
		}

	});

});






