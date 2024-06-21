package com.smhrd.member.database;

import com.smhrd.member.model.MemberDTO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    int checkMemberId(@Param("mem_id") String mem_id);
    
    int checkMemberEmail(@Param("real_email") String real_email);

    MemberDTO selectMember(@Param("mem_id") String mem_id, @Param("mem_pw") String mem_pw);

    int memberInsert(MemberDTO member);

    int deletMember(@Param("mem_email") String mem_email);

    int updateMember(MemberDTO member);

    List<MemberDTO> findId(@Param("mem_name") String mem_name, @Param("mem_email") String mem_email);



    // 다른 메서드들...
}
