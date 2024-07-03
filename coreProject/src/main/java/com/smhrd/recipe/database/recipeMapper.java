package com.smhrd.recipe.database;

import java.util.List;

import com.smhrd.recipe.model.recipeDAO;

public interface recipeMapper {

   List<recipeDAO> search3(String mem_id);
   
}
