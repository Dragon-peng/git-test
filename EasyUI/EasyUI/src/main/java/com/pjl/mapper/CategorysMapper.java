package com.pjl.mapper;

import com.pjl.domain.CategorysDTO;

import java.util.List;

/**
 * @author 19715
 */
public interface CategorysMapper {
  List<CategorysDTO> selectCategorysAll();
  List<CategorysDTO> selectCidIsNull();
}
