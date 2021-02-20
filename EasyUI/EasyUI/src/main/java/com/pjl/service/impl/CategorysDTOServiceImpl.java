package com.pjl.service.impl;

import com.pjl.domain.CategorysDTO;
import com.pjl.mapper.CategorysMapper;
import com.pjl.service.CategorysDTOService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 19715
 */
@Service(value = "categorysDTOService")
public class CategorysDTOServiceImpl implements CategorysDTOService {
  @Autowired
  private CategorysMapper categorysMapper;
  @Override
  public List<CategorysDTO> getAllDTO() {
    return categorysMapper.selectCidIsNull();
  }
}
