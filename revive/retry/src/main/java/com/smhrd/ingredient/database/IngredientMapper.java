package com.smhrd.ingredient.database;

import java.util.List;

import com.smhrd.ingredient.model.IngredientDTO;

public interface IngredientMapper {

    // 품목 추가를 위한 메서드
    int insertIngredient(IngredientDTO ingredient);

	List<IngredientDTO> listIngredient(String mem_id);

	List<IngredientDTO> findId(String mem_name, String mem_email);

    
    // 다른 필요한 메서드들을 추가할 수 있음
	
	// 유통기한이 현재 기준으로 지정된 날짜 이내의 상품 조회
    List<IngredientDTO> selectProductsByExpirationDate(String mem_id, int days);
    List<IngredientDTO> selectProductsByExpirationDate(String mem_id);

    // 수량을 기준으로 지정된 재고 이하의 상품 조회
    List<IngredientDTO> selectProductsByStock(String mem_id, int stockLimit);
    List<IngredientDTO> selectProductsByStock(String mem_id);

    
    // 수량을 기준으로 지정된 재고 이하이면서 묶음 정보가 있는 상품 조회
    List<IngredientDTO> selectProductsByStockBundle(String mem_id, int stockLimit);
    List<IngredientDTO> selectProductsByStockBundle(String mem_id);
}
