package com.smhrd.member.database;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.ingredient.model.IngredientDTO;
import com.smhrd.member.model.MemberDTO;

@Mapper
public interface MemberMapper {

	int checkMemberId(@Param("mem_id") String mem_id);

	int checkMemberEmail(@Param("real_email") String real_email);

	MemberDTO selectMember(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw);

	MemberDTO selectMember(MemberDTO member);

	int memberInsert(MemberDTO member);

	int deletMember(@Param("mem_id") String mem_id);

	int updateMember(MemberDTO member);

	int updateName(MemberDTO member);

	List<MemberDTO> findId(@Param("mem_name") String mem_name, @Param("mem_email") String mem_email);

	// 회원 정보 조회
	MemberDTO findMember(@Param("mem_id") String mem_id, @Param("mem_email") String mem_email,
			@Param("mem_name") String mem_name);

	// 비밀번호 업데이트
	int updatePassword(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw);
   
    List<IngredientDTO> checkIngreTime(String mem_id);

}

