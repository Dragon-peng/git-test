package com.pjl.controller;

import com.pjl.service.CategorysDTOService;
import com.pjl.service.impl.CategorysDTOServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/category")
public class CategorysContriller {
  @Autowired
  @Qualifier(value = "categorysDTOService")
  private CategorysDTOService categorysDTOService;

  @RequestMapping(value = "/tree")
  @ResponseBody
  public Object getCategoryTrees(){
    return categorysDTOService.getAllDTO();
  }
}
