package com.icia.membership_board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Long id;
    private String boardWriter;
    private String boardContents;
    private int boardHits = 0;
    private Timestamp boardCreateDate;
    private int fileAttached = 0;
    private Long memberId;

}
