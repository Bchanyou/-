package com.smhrd.recipe.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.recipe.database.recipeMapper;
import com.smhrd.recipe.database.SqlSessionManager;

public class recipeDAO {
      
   SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
    
   public List<recipeDAO> search3(String mem_id) {
      SqlSession sqlSession = factory.openSession(true); // true 반드시 넣기
      List<recipeDAO> recipelist = null;

      try {
         recipeMapper mapper = sqlSession.getMapper(recipeMapper.class);
         recipelist = mapper.search3(mem_id); // mem_id를 이용해 해당 회원의 품목 조회
         System.out.println("조회 성공");
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("조회 실패");
      } finally {
         sqlSession.close();
      }
      return recipelist;
   }
   
}
