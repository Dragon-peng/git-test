package com.pjl.mapper;

import com.pjl.domain.Department;
import com.pjl.domain.Person;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;

import java.util.List;

/**
 * @author 19715
 */
public interface DepartmentMapper {
  List<Department> queryByCondition(QueryObject qo);
  Integer selectCount();
  List<Department> selectDepartmentAll();
}
