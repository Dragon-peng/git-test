package com.pjl.service;

import com.pjl.domain.Person;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;

import java.util.List;

/**
 * @author 19715
 */
public interface PersonService {
  PageResult selectByCondition(QueryObject qo);
  void deleteBatch(List<Integer> ids);
  void addPersonInfo(Person person);
  void editPeronInfo(Person person);
  Person selectPersonById(Integer id);
}
