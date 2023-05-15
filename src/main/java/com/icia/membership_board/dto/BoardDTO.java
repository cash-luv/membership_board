package com.icia.membership_board.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Data
public class BoardDTO {
    private Long id;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits = 0;
    private Timestamp boardCreatedDate;
    private int fileAttached = 0;
    private Long memberId;
    private List<MultipartFile> boardFile;

}
