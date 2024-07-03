package com.smhrd.ingredient.model;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.smhrd.ingredient.database.IngredientMapper;
import com.smhrd.ingredient.database.SqlSessionManager;

public class IngredientDAO {

	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// 모든 품목 조회
	public List<IngredientDTO> search(String mem_id) {
		SqlSession sqlSession = factory.openSession(true);
		List<IngredientDTO> list = null;
		try {
			IngredientMapper mapper = sqlSession.getMapper(IngredientMapper.class);
			list = mapper.listIngredient(mem_id);
		} catch (Exception e) {
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			sqlSession.close();
		}
		return list;
	}// 품목 조회 끝

	// 품목 추가 기능
	public int add(IngredientDTO ingredient) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.ingredient.database.IngredientMapper.insertIngredient", ingredient);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("품목 추가 실패!");
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			sqlSession.close();
		}
		return cnt;
	}// 품목 추가 끝

	// 품목 삭제 기능
	public int deleteIngredient(IngredientDTO ingredient) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.smhrd.ingredient.database.IngredientMapper.deleteIngredient", ingredient);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("품목 삭제 실패!");
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 체크박스 품목 인덱스로 삭제 기능 추가
	public int deleteIngredientByIdx(int ingreIdx) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.smhrd.ingredient.database.IngredientMapper.deleteIngredientByIdx", ingreIdx);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("품목 인덱스로 삭제 실패!");
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 유통기한 5일 전 알림
	public List<IngredientDTO> searchEd(String mem_id) {
		SqlSession sqlSession = factory.openSession(true);
		List<IngredientDTO> list = null;
		try {
			IngredientMapper mapper = sqlSession.getMapper(IngredientMapper.class);
			list = mapper.selectProductsByExpirationDate(mem_id);
		} catch (Exception e) {
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			sqlSession.close();
		}
		return list;
	}

	// 품목 수정 기능
	public int editIngredient(IngredientDTO ingredient) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.smhrd.ingredient.database.IngredientMapper.editIngredient", ingredient);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("품목 수정 실패!");
			e.printStackTrace(); // 로깅으로 대체하는 것을 고려
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	// 여러 품목 한 번에 추가 기능
	public int[] addAll(List<IngredientDTO> ingredients) {
		SqlSession sqlSession = factory.openSession(true);
		int[] cons = null;
		try {
			IngredientMapper mapper = sqlSession.getMapper(IngredientMapper.class);
			cons = mapper.insertIngredients(ingredients);
			if (cons != null) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("여러 품목 추가 실패!");
			e.printStackTrace(); // 로깅으로 대체하는 것을 고려
		} finally {
			sqlSession.close();
		}
		return cons;
	}

	// 캘린더 --------------------------------------------------------

	// 품목 조회
	public List<IngredientDTO> selectExpiryDates(String memId) {
		SqlSession session = factory.openSession();
		List<IngredientDTO> list = null;
		try {
			list = session.selectList("com.smhrd.ingredient.database.IngredientMapper.selectExpiryDates", memId);
		} catch (Exception e) {
			e.printStackTrace(); // 이 부분을 로깅으로 대체하는 것을 고려하세요.
		} finally {
			session.close();
		}
		return list;
	}
}
