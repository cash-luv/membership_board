package com.icia.membership_board.service;

import com.icia.membership_board.dto.CommentDTO;
import com.icia.membership_board.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    private CommentRepository commentRepository;
    public List<CommentDTO> findAll(Long boardId) {
        return  commentRepository.findAll(boardId);
    }

    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }
}
