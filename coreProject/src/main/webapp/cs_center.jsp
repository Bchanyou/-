<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smhrd.board.model.questionsDTO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ include file="header.jsp"%>

<%
List<questionsDTO> questionsList = (List<questionsDTO>) request.getAttribute("questionsList");
%>

<!-- container -->
<main id="sub">
   <section id="container">

      <!-- Sub Visual -->
      <section id="sub_vis" class="sv04">
         <div id="sub_tit" class="w1280">
            <h2>
               <strong class="font">고객센터</strong>
            </h2>
            <p>
               자주 묻는 질문 이외의 문의사항은<br> 1:1문의로 작성해주시면 언제든 친절하게 답변해드리겠습니다.
            </p>
         </div>
      </section>

      <!-- Sub Content -->
      <section id="content" class="my120">

         <section class="w1280">

            <!-- FAQ -->
            <section class="sub_cont">
               <div class="mid_tit my20 loca">
                  <h4>
                     <strong>FAQ</strong>
                  </h4>
               </div>
               <div class="drop_down_wrap bdr_wrap">
                  <div class="drop_down">
                     <div class="drop_title">
                        <a href="#;" class="pa30"> <span class="title_before"><span>Q</span></span>
                           <span>유통기한 이미지로 인식이 안 될 경우는 어떻게 해야하나요?</span>
                        </a>
                     </div>
                     <div class="drop_sub pa50">
                        <p>유통기한 이미지가 인식되지 않을 경우, 먼저 사진 촬영시 흔들림으로 인해 이미지가 흐려지지 않았는지 확인해주세요.</p>
                        <p>유통기한이 카메라 중앙에 위치하도록 가까이 촬영하시면 더욱 빠르고 정확한 업로드에 도움이 되며, 이미지 인식 외에도 직접 날짜 수정이 가능합니다.</p>
                     </div>
                  </div>
                  <div class="drop_down">
                     <div class="drop_title">
                        <a href="#;" class="pa30"> <span class="title_before"><span>Q</span></span>
                           <span>추천 레시피가 뜨지 않아요!</span>
                        </a>
                     </div>
                     <div class="drop_sub pa50">
                        <p>추천 레시피는 유통기한이 5일 이내로 임박한 재료들을 기준으로 추천해드리고 있습니다.</p>
                        <p>유통기한 임박 품목이 없는 경우 추천 목록이 생성되지 않을 수 있습니다.</p>
                        <p>만약 아직 등록하지 못한 품목이 있으시다면 '품목추가하기' 버튼을 통해 등록하실 수 있습니다.</p>
                     </div>
                  </div>
               </div>
            </section>

            <!-- 문의내역 -->
            <section class="sub_cont" id="cs_inquiry">
               <div class="mid_tit my20">
                  <h4>
                     <strong>문의내역</strong>
                  </h4>
                  <a href="inquiry_write.jsp" class="btn bdr">1:1문의 작성하기</a>
               </div>
               <div class="bdr_wrap">
                  <table class="">
                     <caption>문의내역</caption>
                     <thead>
                        <tr>
                           <th></th>
                           <th>제목</th>
                           <th>등록일</th>
                           <th>답변상태</th>
                        </tr>
                     </thead>
                     <tbody>
                        <%
                        if (questionsList == null || questionsList.isEmpty()) {
                        %>
                        <tr>
                           <td></td>
                           <td colspan="3" style="padding-right: 0; padding-left: 0">
                              <div class="info_box null_box">
                                 <p class="ico_info">1:1 문의 내역이 없습니다.</p>
                              </div>
                           </td>
                        </tr>
                        <%
                        } else {
                        for (questionsDTO question : questionsList) {
                        %>
                        <tr>
                           <td>{문의글인덱스값}</td>
                            <td><a
                                        href="InquiryViewCon?title=<%= URLEncoder.encode(question.getQue_title(), "UTF-8") %>&created_at=<%=question.getCreated_at()%>"><%=question.getQue_title()%></a></td>
                                    <td><%=question.getCreated_at()%></td>
                           <td>답변대기</td>
                        </tr>
                        <%
                        }
                        }
                        %>

                     </tbody>
                  </table>
               </div>
            </section>

         </section>

      </section>
      <!-- //Sub Content -->

   </section>

</main>
<!-- //container -->


<%@include file="footer.jsp"%>
