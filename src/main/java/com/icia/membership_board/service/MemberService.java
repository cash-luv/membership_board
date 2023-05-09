package com.icia.membership_board.service;

import com.icia.membership_board.dto.BoardDTO;
import com.icia.membership_board.dto.MemberDTO;
import com.icia.membership_board.dto.MemberFileDTO;
import com.icia.membership_board.repository.MemberRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    public void MemberSave(MemberDTO memberDTO) throws IOException {
        if (memberDTO.getProfile().get(0).isEmpty()) {
            System.out.println("파일없음");
            memberDTO.setMemberProfile(0);
            MemberRepository.MemberSave(memberDTO);

        } else {
            memberDTO.setMemberProfile(1);
            MemberDTO dto = MemberRepository.MemberSave(memberDTO);
            for (MultipartFile Profile : memberDTO.getProfile()) {
                String fileName = Profile.getOriginalFilename();
                String filePath = System.currentTimeMillis() + "-" + fileName;
                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setFileName(fileName);
                memberFileDTO.setFilePath(filePath);
                memberFileDTO.setMemberId(dto.getId());

                String savePath = "D:\\springframework_img\\" + filePath;

                Profile.transferTo(new File(savePath));
                MemberRepository.saveFile(memberFileDTO);

            }
        }
    }

}
