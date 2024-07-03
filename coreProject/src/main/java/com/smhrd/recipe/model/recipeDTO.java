package com.smhrd.recipe.model;

public class recipeDTO {
   
   private String ingre_name;
   private String expired_at;
    private String rec_name;
    private String rec_ingre;
    private String rec_img_url;
    private String rec_url;
    
   public recipeDTO(String ingre_name, String expired_at, String rec_name, String rec_ingre, String rec_img_url,
         String rec_url) {
      super();
      this.ingre_name = ingre_name;
      this.expired_at = expired_at;
      this.rec_name = rec_name;
      this.rec_ingre = rec_ingre;
      this.rec_img_url = rec_img_url;
      this.rec_url = rec_url;
   }
   public recipeDTO(String rec_name, String rec_ingre, String rec_img_url,
         String rec_url) {
      super();
      this.rec_name = rec_name;
      this.rec_ingre = rec_ingre;
      this.rec_img_url = rec_img_url;
      this.rec_url = rec_url;
   }
   public recipeDTO() {
      super();
   }
   public String getIngre_name() {
      return ingre_name;
   }
   public void setIngre_name(String ingre_name) {
      this.ingre_name = ingre_name;
   }
   public String getExpired_at() {
      return expired_at;
   }
   public void setExpired_at(String expired_at) {
      this.expired_at = expired_at;
   }
   public String getRec_name() {
      return rec_name;
   }
   public void setRec_name(String rec_name) {
      this.rec_name = rec_name;
   }
   public String getRec_ingre() {
      return rec_ingre;
   }
   public void setRec_ingre(String rec_ingre) {
      this.rec_ingre = rec_ingre;
   }
   public String getRec_img_url() {
      return rec_img_url;
   }
   public void setRec_img_url(String rec_img_url) {
      this.rec_img_url = rec_img_url;
   }
   public String getRec_url() {
      return rec_url;
   }
   public void setRec_url(String rec_url) {
      this.rec_url = rec_url;
   }
   @Override
   public String toString() {
      return "recipeDTO [ingre_name=" + ingre_name + ", expired_at=" + expired_at + ", rec_name=" + rec_name
            + ", rec_ingre=" + rec_ingre + ", rec_img_url=" + rec_img_url + ", rec_url=" + rec_url + "]";
   }

    
}
