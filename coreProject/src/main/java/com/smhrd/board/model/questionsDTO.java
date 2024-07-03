package com.smhrd.board.model;

public class questionsDTO {
    
    private String mem_id;
    private String que_title;
    private String que_content;
    private String que_img;
    private String created_at;

    // 기본 생성자
    public questionsDTO() {
        super();
    }

    // 모든 필드를 포함하는 생성자
    public questionsDTO(String mem_id, String que_title, String que_content, String que_img, String created_at) {
        super();
        this.mem_id = mem_id;
        this.que_title = que_title;
        this.que_content = que_content;
        this.que_img = que_img;
        this.created_at = created_at;
    }

    // mem_id getter
    public String getMem_id() {
        return mem_id;
    }

    // mem_id setter
    public void setMem_id(String mem_id) {
        this.mem_id = mem_id;
    }

    // que_title getter
    public String getQue_title() {
        return que_title;
    }

    // que_title setter
    public void setQue_title(String que_title) {
        this.que_title = que_title;
    }

    // que_content getter
    public String getQue_content() {
        return que_content;
    }

    // que_content setter
    public void setQue_content(String que_content) {
        this.que_content = que_content;
    }

    // que_img getter
    public String getQue_img() {
        return que_img;
    }

    // que_img setter
    public void setQue_img(String que_img) {
        this.que_img = que_img;
    }

    // created_at getter
    public String getCreated_at() {
        return created_at;
    }

    // created_at setter
    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
    public String toString() {
        return "questionsDTO [mem_id=" + mem_id + ", que_title=" + que_title + ", que_content=" + que_content
                + ", que_img=" + que_img + ", created_at=" + created_at + "]";
    }
}
