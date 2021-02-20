package com.pjl.domain;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;
import java.util.List;

/**
 * @author 19715
 *  用于展示类别信息的tree使用
 */
public class CategorysDTO{
  private String id;
  @JsonProperty(value = "text")
  private String name;
  private String description;
  //子类别
  @JsonProperty(value = "children")
  private List<CategorysDTO> categorysDTOList;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public List<CategorysDTO> getCategorysDTOList() {
    return categorysDTOList;
  }

  public void setCategorysDTOList(List<CategorysDTO> categorysDTOList) {
    this.categorysDTOList = categorysDTOList;
  }
}
