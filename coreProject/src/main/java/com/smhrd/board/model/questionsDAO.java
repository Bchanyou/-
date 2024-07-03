package com.smhrd.board.model;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.board.database.questionsMapper;
import com.smhrd.board.database.SqlSessionManager;

public class questionsDAO {
   
   SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
   
   public int add(questionsDTO questions) {
      SqlSession sqlSession = factory.openSession(true);// true 반드시 넣기

      int cnt = 0;
      try {
         cnt = sqlSession.insert("com.smhrd.board.database.questionsMapper.insertquestions", questions);// mapper안에
                                                                                       // 작성한
                                                                                       // 매개변수

         if (cnt > 0) {
            sqlSession.commit();
         } else {
            sqlSession.rollback();
         }
      } catch (Exception e) {
         System.out.println("문의사항추가 실패!");
         e.printStackTrace();
      } finally {
         // 3. session 자원 반납
         sqlSession.close();
         System.out.println("DAO 이상 무");
      }

      return cnt;
   }// 문의사항 추가 끝

   // 모든 문의사항 조회
   public List<questionsDTO> search(String mem_id) {
      SqlSession sqlSession = factory.openSession(true); // true 반드시 넣기
      List<questionsDTO> questionsList = null;

      try {
         questionsMapper mapper = sqlSession.getMapper(questionsMapper.class);
         questionsList = mapper.listquestions(mem_id); // mem_id를 이용해 해당 회원의 품목 조회
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("조회안됨");
      } finally {
         sqlSession.close();
      }
      return questionsList;
    }
   
   public questionsDTO getQuestionByTitle(questionsDTO searchTitle) {
        SqlSession sqlSession = factory.openSession(true);
        questionsDTO question = null;
        try {
           question = sqlSession.selectOne("com.smhrd.board.database.questionsMapper.getQuestionByTitle", searchTitle);
        } catch(Exception e) {
           e.printStackTrace();
           System.out.println("조회안됨");
        } finally {
           sqlSession.close();
        }
        return question;
    }
}
