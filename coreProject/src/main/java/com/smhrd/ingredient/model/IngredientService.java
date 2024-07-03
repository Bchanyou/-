package com.smhrd.ingredient.model;

import java.util.List;

public class IngredientService {
    private IngredientDAO dao = new IngredientDAO();

    public List<IngredientDTO> getExpiryDates(String memId) {
        return dao.selectExpiryDates(memId);
    }
}
