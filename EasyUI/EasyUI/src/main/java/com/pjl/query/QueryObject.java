package com.pjl.query;

/**
 * @author 19715
 */
public class QueryObject {
  private Integer page;//第几页
  private Integer rows;//行数
  private String keywords;//用来姓名模糊搜索查询
  private String sort;//排序字段名
  private String order;//排序方式


  public String getSort() {
    return sort;
  }

  public void setSort(String sort) {
    this.sort = sort;
  }

  public String getOrder() {
    return order;
  }

  public void setOrder(String order) {
    this.order = order;
  }

  public String getKeywords() {
    return keywords;
  }

  public void setKeywords(String keywords) {
    this.keywords = keywords;
  }

  //每页起始位置
  public Integer getStart(){
    return (this.page-1)*this.rows;
  }

  public Integer getPage() {
    return page;
  }

  public void setPage(Integer page) {
    this.page = page;
  }

  public Integer getRows() {
    return rows;
  }

  public void setRows(Integer rows) {
    this.rows = rows;
  }
}
