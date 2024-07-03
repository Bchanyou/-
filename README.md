# 스마트인재개발원 핵심프로젝트
## 냉장고를 부탁해
### 개발 기간 : 2024/05/20 ~ 2024/07/02

팀장 : 방찬유
팀원 : 강다연
       김은석
       이초원
       한채연


## 👀 서비스 소개
* 서비스명:  OCR을 활용한 냉장고 유통기한 관리 웹페이지
* 서비스설명: 유통기한이 지나서 버리게 되는 냉장고 속 음식들에서 착안하여 유통기한을 관리해주고 임박시
알려주는 기능을 만들고자 함.


## ⭐ 주요 기능
* 자동로그인 및 아이디 저장 기능
* 물품의 유통기한을 입력하고 위치에 따라 저장할 수 있도록 설정하는 기능
* 물품의 유통기한을 이미지 업로드 시 OCR을 통해 자동으로 입력해주는 기능
* 저장된 물품의 유통기한을 표기해주는 캘린더
* 물품의 유통기한이 5일 이내로 남은 물품들을 알려주는 알림창
* 물품의 소비를 촉진하기 위해 5일 이내의 품목을 이용해서 만들 수 있는 요리 레시피를 추천해주는 기능
* 고객의 불편사항 혹은 문의사항을 입력할 수 있는 고객센터

## ⛏ 기술스택
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/01b1c6f9-298b-481a-a4ac-08a0cc5c3df3)


## ⚙ 시스템 아키텍처(구조)
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/d21ab0ce-5c7a-469e-8b90-e5184b4f2a16)


## 📌 SW유스케이스
![유스케이스_다이어그램](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/a0a25ce2-ccf4-4f70-9ea3-ffb34e8193e0)


## 📌 ER다이어그램
![ER다이어그램](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/761d721c-50da-466f-bf6f-b5dea27c2724)


## 🖥 화면 구성
### 메인화면
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/19fb3d5c-95c5-47bb-aa4a-6a676e3ae3d3)

### 로그인/회원가입/회원수정/회원탈퇴
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/3358c568-3746-48b5-b783-8a9ae1838491)
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/099d632c-d675-4671-bdaa-b09ad6a001f2)
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/ff4806a1-0285-492a-b6ad-316a351a737e)
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/092e51e4-ce63-4973-98dc-ece8088c0445)

### 캘린더
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/276e0632-f8d4-4ff6-95f0-ae084b9ded4c)

### my냉장고
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/b338473c-9b69-4673-857a-9f2cd4c6f430)

### 레시피 추천
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/23eb213c-9024-4bb7-93a0-47711e21693f)

### 고객센터
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/79a07729-f5e4-4e9d-8cfe-3a0c62d13901)

### 알림
![image](https://github.com/Bchanyou/Take_care_of_the_fridge/assets/162541713/7f725a98-e1bd-444a-87f2-f5159a3897c4)



## 👨‍👩‍👦‍👦 팀원 역할

# 방찬유 - PM, Back
- PM, 산출문서 관리, 전체 프로젝트 구성 및 관리, OCR 기능 구현, 레시피/OCR기능 등 서버 연결, 코드 통합, 발표
# 강다연 - Back
- 크롤링, 데이터 전처리, README 작성, 스토리보드 작성
# 김은석 - Back
- DB 구성 및 구축, 유스케이스 다이어그램 문서 작성, 주요 기능 구성 및 서버연결, 코드 통합
# 이초원 - Front
- 퍼블리싱, 화면 설계서 제작, 웹페이지 설계 밎 제작, 페이지 동작 기능 구현, 코드 통합
# 한채연 - Front
- 페이지 디자인 제작, UI/UX 디자인, PPT 제작, 프로젝트 소개서 등 문서 제작

## 🤾‍♂️ 트러블슈팅
1. OCR 정확도 저하 문제
문제점 : Python 내장 객체인 Tesseract OCR을 이용해 OCR 기술을 구현했을때 정확도가 낮은 문제가 발생함.
       유통기한만 있는 사진에선 값을 정상적으로 출력하였으나, 멀리서 찍었을 때는 문자를 인식해내지 못함.
       색상을 흑백, Gray 등으로 처리해보고 확산도도 수정해보았으나 여전히 쓸 수 없는 성능이었음.
   해결방안 1 : Easy OCR 사용
          -> CPU로 사용하도록 코드를 수정하였으나 구동 오류로 인한 실패.
   해결방안 2 : Paddle OCR 사용
          -> 여러가지 문자들이 인식되어 도출되었으나 규칙성을 발견할 수 없어 데이터를 전처리 할 수 가 없었음.
최종 해결방안 : Google Vision Api를 사용하여 해결함. 정확도도 100%에 가까울 정도로 정확했고 외부 저장소 또한 확보할 수 있었음.

2. 중복 선택과 선택 삭제 기능 에러
문제점 : 여러개의 행을 선택 및 삭제하는 기능을 구현 중에 파라미터 값의 묶음을 NULL로 받아오는 오류가 발생함.
해결방안 : 삼항연산자를 이용하여 경우의 수를 나눠서 예외를 처리.

3. 품목추가 기능 에러
문제점 : 여러개의 값을 한번에 입력하여 오류가 발생함.
해결방안 : 값을 각각의 배열로써 저장하여 for문을 활용해서 데이터를 차근차근 입력.

4. 비밀번호 재설정 시 메일 전송 에러
문제점 : GMail의 보안성 문제와 설정상 오류로 문제가 발생.
해결방안 : POP3 / SMTP 설정, IMAP / SMTP 설정 변경을 통해 포트 설정 후 네이버 메일에서 회원 비밀번호 찾기 메일을 보내도록 수정.

5. Google Cloud API 오류
문제점 : 권한 설정에 관련된 오류, 결제 관리에 대한 오류가 교차적으로 제시.
해결방안 : 프로젝트 재생성 후 서비스계정을 생성하여 필요한 권한을 승인하여 성공.
