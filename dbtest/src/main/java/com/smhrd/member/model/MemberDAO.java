package com.smhrd.member.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.member.database.SqlSessionManager;

public class MemberDAO {

	// 0. Factory 가지고 오기
	// DB연결, 쿼리문 수행, DB종료를 작업할 수 있는 객체 생성
	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원 가입 기능
		public int join(MemberDTO member) {
			// 1. factory 내부의 session 객체 열어주기
			SqlSession sqlSession = factory.openSession(true);// true 반드시 넣기

			// 2. session 안에 sql 연결: mapper에 연결
			// insert, updata, delete: 성공한 행의 개수를 리턴

			int cnt = 0;
			try {
				cnt = sqlSession.insert("com.smhrd.member.database.MemberMapper.memberInsert", member);// mapper안에 작성한 매개변수 찾기

				if (cnt > 0) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}
			} catch (Exception e) {
				System.out.println("회원가입 실패!");
				e.printStackTrace();
			} finally {
				// 3. session 자원 반납
				sqlSession.close();
			}

			return cnt;
		}
		
		//로그인 기능
		public MemberDTO login(MemberDTO member) {
			SqlSession sqlSession = factory.openSession(true);// true 반드시 넣기

			MemberDTO mem = null;

			try {
				mem = sqlSession.selectOne("com.smhrd.member.database.MemberMapper.selectMember", member);

				if (mem != null) {
					sqlSession.commit();
				} else {
					sqlSession.rollback();
				}

			} catch (Exception e) {
				System.out.println("로그인 실패");
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}

			return mem;
		}
}
