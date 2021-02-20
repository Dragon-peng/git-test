package com.pjl.page;

import java.util.Collections;
import java.util.List;

/**
 * @author 19715
 */
public class PageResult {
  private Integer total;
  private List rows;
  public static final PageResult EMPTY;

  static {
    EMPTY = new PageResult(0, Collections.EMPTY_LIST);
  }

  public PageResult() {

  }

  public PageResult(Integer total, List rows) {
    this.total = total;
    this.rows = rows;
  }

  public Integer getTotal() {
    return total;
  }

  public void setTotal(Integer total) {
    this.total = total;
  }

  public List getRows() {
    return rows;
  }

  public void setRows(List rows) {
    this.rows = rows;
  }

}
