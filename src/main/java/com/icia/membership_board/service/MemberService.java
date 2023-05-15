package com.icia.membership_board.service;

import com.icia.membership_board.dto.BoardDTO;
import com.icia.membership_board.dto.MemberDTO;
import com.icia.membership_board.dto.MemberFileDTO;
import com.icia.membership_board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void MemberSave(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getProfile().get(0).isEmpty()) {
            System.out.println("파일없음");
            System.out.println("memberDTO = " + memberDTO);
            memberDTO.setMemberProfile(0);
            memberRepository.MemberSave(memberDTO);

        } else {
            memberDTO.setMemberProfile(1);
            MemberDTO dto = memberRepository.MemberSave(memberDTO);
            for (MultipartFile Profile : memberDTO.getProfile()) {
                String fileName = Profile.getOriginalFilename();
                String filePath = System.currentTimeMillis() + "-" + fileName;
                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setFileName(fileName);
                memberFileDTO.setFilePath(filePath);
                memberFileDTO.setMemberId(dto.getId());

                String savePath = "D:\\springframework_img\\" + filePath;

                Profile.transferTo(new File(savePath));
                memberRepository.saveFile(memberFileDTO);

            }
        }
    }

    public MemberDTO findByMemberEmail(String memberEmail) {
        return memberRepository.findByMemberEmail(memberEmail);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO dto = memberRepository.login(memberDTO);
        if (dto != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public void update(MemberDTO memberDTO) {
        memberRepository.update(memberDTO);
    }


}
