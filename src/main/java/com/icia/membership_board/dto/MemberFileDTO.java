package com.icia.membership_board.dto;

import lombok.Data;

@Data
public class MemberFileDTO {
    private Long id;
    private String fileName;
    private String filePath;
    private Long memberId;

}
