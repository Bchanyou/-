<%@page import="com.smhrd.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie"%>

<%
MemberDTO member = (MemberDTO) session.getAttribute("loginMember");

String email = member.getMem_email();
String[] emailParts = email.split("@");
String emailLocalPart = emailParts.length > 0 ? emailParts[0] : "";
String emailDomainPart = emailParts.length > 1 ? emailParts[1] : "";
%>

<%@include file="header.jsp"%>

<!-- Util Page -->
<main class="py120 util_page">

   <section id="util_box">

      <div class="big_tit">
         <h3>
            <strong class="font">회원정보수정</strong>
         </h3>
      </div>

      <!-- Form_Mem_Modify -->
      <form method="post" action="MemberEditInfo" name="">
         <div class="bdr_wrap row">
            <table>
               <caption>회원정보수정</caption>
               <colgroup>
                  <col width="30%">
               </colgroup>
               <tbody>
                  <tr>
                     <th>아이디</th>
                     <td style="text-align: left;">
                        <%
                        String savedId = null;
                        if (session != null) {
                           savedId = (String) session.getAttribute("savedId");
                        }
                        if (savedId == null) {
                           Cookie[] cookies = request.getCookies();
                           if (cookies != null) {
                              for (Cookie cookie : cookies) {
                                 if ("savedId".equals(cookie.getName())) {
                                    savedId = cookie.getValue();
                                    break;
                                 }
                              }
                           }
                        }
                        %> 
                        <%=savedId != null ? savedId : ""%>
                     </td>
                  </tr>
                  <tr>
                     <th>이름</th>
                     <td><input type="text" name="name" placeholder="이름을 입력해주세요" value="<%=member.getMem_name()%>"></td>
                  </tr>
                  <tr>
                     <th>휴대폰</th>
                     <td><input type="text" name="phone" placeholder="- 는 제외하고 숫자만 입력해주세요" value="<%=member.getMem_phone()%>"></td>
                  </tr>
                  <tr>
                     <th>이메일</th>
                     <td class="disf">
                        <input type="text" name="mail" placeholder="이메일" value="<%=emailLocalPart%>"> 
                        <span>@</span>
                        <div class="select_wrap">
                           <select name="slt_mail" class="select">
                              <option <%if ("naver.com".equals(emailDomainPart)) {%> selected <%}%>>naver.com</option>
                              <option <%if ("gmail.com".equals(emailDomainPart)) {%> selected <%}%>>gmail.com</option>
                           </select>
                        </div>
                     </td>
                  </tr>
               </tbody>
            </table>
            <div class="btn_wrap center my30">
               <a href="mem_exit.jsp" class="btn bg w200">회원탈퇴</a>
               <button type="submit" class="btn grn w200">수정하기</button>
            </div>
         </div>
      </form>
      <!-- //Form_Mem_Modify -->

   </section>

</main>
<!-- // Util Page -->

<%@include file="footer.jsp"%>
