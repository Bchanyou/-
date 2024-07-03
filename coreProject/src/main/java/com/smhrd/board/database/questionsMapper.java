package com.smhrd.board.database;

import java.util.List;

import com.smhrd.board.model.questionsDTO;
import com.smhrd.board.model.questionsDTO;

public interface questionsMapper {
   
   int insertquestions(questionsDTO questions);
   
   List<questionsDTO> listquestions(String mem_id);
   
   List<questionsDTO> getQuestionByTitle(questionsDTO searchTitle);
   
}
