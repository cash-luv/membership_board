package com.icia.membership_board.repository;

import com.icia.membership_board.dto.MemberDTO;
import com.icia.membership_board.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO MemberSave(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        sql.insert("Member.Save", memberDTO);
        return memberDTO;
    }

    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return sql.selectOne("Member.findByMemberEmail", memberEmail);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }


    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }

    public void delete(Long id) {
        sql.delete("Member.delete", id);
    }

    public boolean findByMemberPassword(String memberPassword) {
        return sql.selectOne("Member.findByMemberPassword",memberPassword);
    }

    public void update(MemberDTO memberDTO) {
        sql.update("Member.update",memberDTO);
    }


}
