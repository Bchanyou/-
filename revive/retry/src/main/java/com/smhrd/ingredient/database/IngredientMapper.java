package com.smhrd.ingredient.database;

import com.smhrd.ingredient.model.IngredientDTO;

public interface IngredientMapper {

    // 품목 추가를 위한 메서드
    int insertIngredient(IngredientDTO ingredient);
    
    // 다른 필요한 메서드들을 추가할 수 있음
}
