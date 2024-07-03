package com.smhrd.member.model;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.database.MemberMapper;
import com.smhrd.member.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory factory = SqlSessionManager.getSqlSessionFactory();

	// -------------------------------------------------------------------------------
	// 회원가입

	public int join(MemberDTO member) {
		SqlSession sqlSession = factory.openSession(true);

		int cnt = 0;
		try {
			cnt = sqlSession.insert("com.smhrd.member.database.MemberMapper.memberInsert", member);// mapper안에 작성한 매개변수
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("회원가입 실패!");
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;
	}

	// 아이디 중복 체크
	public int check(String mem_id) {
		try (SqlSession sqlSession = factory.openSession()) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.checkMemberId(mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// 이메일 중복 체크
	public int check2(String real_email) {
		try (SqlSession sqlSession = factory.openSession()) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			return mapper.checkMemberEmail(real_email);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	// -------------------------------------------------------------------------------
	// 로그인

	public MemberDTO login(MemberDTO dto) {
		MemberDTO member = null;
		try (SqlSession sqlSession = factory.openSession()) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			member = mapper.selectMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	// 자동로그인
	public boolean autologin(HttpServletRequest request, HttpServletResponse response) {
		// 사용자의 브라우저에서 쿠키를 받아옵니다.
		Cookie[] cookies = request.getCookies();

		// 쿠키가 존재하는지 확인합니다.
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				// 쿠키의 이름이 "autologin"인지 확인합니다.
				if (cookie.getName().equals("autologin")) {
					String[] values = cookie.getValue().split(":");
					String mem_id = values[0]; // 쿠키에서 저장된 회원 아이디를 가져옵니다.
					String mem_pw = values[1]; // 쿠키에서 저장된 회원 비밀번호를 가져옵니다.

					// DB에서 mem_id와 mem_pw를 이용하여 회원 정보를 조회합니다.
					MemberDTO member = new MemberDTO();
					member.setMem_id(mem_id);
					member.setMem_pw(mem_pw);

					// 실제로 로그인 기능을 수행하여 회원 정보를 가져옵니다.
					MemberDTO loggedMember = login(member);

					// 회원 정보가 존재한다면 로그인 성공 처리를 합니다.
					if (loggedMember != null) {
						return true;
					}
				}
			}
		}

		return false; // 자동 로그인 실패
	}

	// -------------------------------------------------------------------------------
	// 아이디/ 비번 찾기

	// 아이디 찾기
	public List<MemberDTO> findId(String mem_name, String mem_email) {
		SqlSession sqlSession = factory.openSession(true);
		List<MemberDTO> list = null;

		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			list = mapper.findId(mem_name, mem_email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	}

	// -------------------------------------------------------------------------------
	// 회원탈퇴

	// 회원 탈퇴
	public int delete(String deleteId) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.delete("com.smhrd.member.database.MemberMapper.deleteMember", deleteId);
			if (cnt > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("삭제실패");
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return cnt;

	}
	// 회원 탈퇴 끝

	// -------------------------------------------------------------------------------
	// 회원정보 수정

	public int update(MemberDTO updateMember) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.smhrd.member.database.MemberMapper.updatePwMember", updateMember);

			if (cnt > 0) {
				System.out.println("완료");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}// 회원정보 수정 끝

	// 회원정보수정페이지에서 현재 id를 기준으로 현재 pw를 가져오기
	public int getMemberById(String saveID) {
		SqlSession sqlSession = factory.openSession(true);
		int cnt = 0;
		try {
			cnt = sqlSession.update("com.smhrd.member.database.MemberMapper.selectMemberPwInfoByID", saveID);

			if (cnt > 0) {
				System.out.println("완료");
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	public MemberDTO selectMember(MemberDTO memberDTO) {
		return null;
	}

	// 회원 정보 수정
	public int updateMember(MemberDTO updateMember) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 비밀번호와 맞는지 확인
	public MemberDTO login2(MemberDTO dto) {
		MemberDTO member = null;
		try (SqlSession sqlSession = factory.openSession()) {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			member = mapper.selectMember(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}// 로그인 끝
	
    // 회원 조회
    public MemberDTO findMember(String mem_id, String mem_email, String mem_name) {
        MemberDTO member = null;
        try (SqlSession sqlSession = factory.openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            member = mapper.findMember(mem_id, mem_email, mem_name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return member;
    }
    
    // 비번 제외 수정
    public int updateName(MemberDTO updateMember) {
       SqlSession sqlSession = factory.openSession(true);
       int cnt = 0;
       try {
          cnt = sqlSession.update("com.smhrd.member.database.MemberMapper.updateName", updateMember);

          if (cnt > 0) {
             System.out.println("완료");
             sqlSession.commit();
          } else {
             sqlSession.rollback();
          }
       } catch (Exception e) {
          System.out.println("수정실패");
          e.printStackTrace();
       } finally {
          sqlSession.close();
       }
       return cnt;
    }//회원 정보 수정 끝

    // 비밀번호 업데이트
    public int updatePassword(String mem_id, String mem_pw) {
        int count = 0;
        try (SqlSession sqlSession = factory.openSession()) {
            MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
            count = mapper.updatePassword(mem_id, mem_pw);
            sqlSession.commit(); // 트랜잭션 커밋
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        }
        return count;
    }

	
	
	// 로그인 시 알람 데이터 불러오기
    public  List<IngredientDTO> checkIngreTime(String mem_id) {
        List<IngredientDTO> alarm = null;
      try (SqlSession sqlSession = factory.openSession()) {
         MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
         alarm = mapper.checkIngreTime(mem_id);
      } catch (Exception e) {
         e.printStackTrace();
      }
      return alarm;
      
   }


}