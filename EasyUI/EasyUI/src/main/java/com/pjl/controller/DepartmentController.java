package com.pjl.controller;

import com.pjl.domain.Department;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;
import com.pjl.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "department")
public class DepartmentController {
  @Autowired
  private DepartmentService departmentService;
  @RequestMapping(value = "/all")
  @ResponseBody
  public Object showAllDepts(){
    List<Department> departmentList = departmentService.selectDepartmentAll();
    return departmentList;
  }
}
