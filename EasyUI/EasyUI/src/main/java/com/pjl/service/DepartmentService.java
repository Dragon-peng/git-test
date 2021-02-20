package com.pjl.service;

import com.pjl.domain.Department;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;

import java.util.List;

public interface DepartmentService {
  PageResult queryByCondition(QueryObject qo);
  List<Department> selectDepartmentAll();
}
