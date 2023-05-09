package com.icia.membership_board.repository;

import com.icia.membership_board.dto.MemberDTO;
import com.icia.membership_board.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private static SqlSessionTemplate sql;
    public static MemberDTO MemberSave(MemberDTO memberDTO) {
        sql.insert("Member.Save",memberDTO);
        return memberDTO;
    }

    public static void saveFile(MemberFileDTO memberFileDTO){
        sql.insert("Member.saveFile",memberFileDTO);
    }
}
