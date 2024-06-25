package com.smhrd.board.model;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.ingredient.database.IngredientMapper;
import com.smhrd.ingredient.database.SqlSessionManager;

public class BoardDAO {

	// 0. Factory 가지고 오기
	// DB연결, 쿼리문 수행, DB종료를 작업할 수 있는 객체 생성
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	SqlSession sqlSession = factory.openSession(true); // true 반드시 넣기

}
