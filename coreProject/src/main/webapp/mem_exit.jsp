<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@include file="header.jsp"%>


<!-- Util Page -->
<main class="py120 util_page">

   <section id="util_box">

      <div class="big_tit">
         <h3>
            <strong class="font">회원탈퇴</strong>
         </h3>
      </div>

      <div class="bdr_wrap row" id="mem_exit">

         <div class="imgBlock">
            <img src="./images/utilPage/exit.png" alt="회원탈퇴">
         </div>
         <p class="find_guide">회원탈퇴를 원하시면 비밀번호를 입력해주세요.</p>

         <!-- Form_Mem_Exit -->
         <form method="post" action="MemberDeleteCon" name="">
            <div class="tb_wrap my50">
               <table>
                  <caption>회원탈퇴</caption>
                  <colgroup>
                     <col width="25%">
                  </colgroup>
                  <tbody>
                     <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="pw" maxlength="50"
                           placeholder="비밀번호를 입력해주세요"></td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <div class="btn_wrap center my30">
               <button type="submit" class="btn grn w200">탈퇴하기</button>
            </div>
         </form>
         <!-- //Form_Mem_Exit -->

      </div>

   </section>

</main>
<!-- // Util Page -->




<%@include file="footer.jsp"%>