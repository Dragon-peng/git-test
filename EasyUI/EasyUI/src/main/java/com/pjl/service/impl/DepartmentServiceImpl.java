package com.pjl.service.impl;

import com.pjl.domain.Department;
import com.pjl.domain.Person;
import com.pjl.mapper.DepartmentMapper;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;
import com.pjl.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService {
  @Autowired
  private DepartmentMapper departmentMapper;

  @Override
  public PageResult queryByCondition(QueryObject qo) {
    Integer count = departmentMapper.selectCount();
    if (count>0){
      List<Department> personList = departmentMapper.queryByCondition(qo);
      return new PageResult(count,personList);
    }
    return PageResult.EMPTY;
  }

  @Override
  public List<Department> selectDepartmentAll() {
    return departmentMapper.selectDepartmentAll();
  }
}
