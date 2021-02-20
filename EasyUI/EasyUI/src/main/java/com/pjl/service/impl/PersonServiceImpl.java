package com.pjl.service.impl;

import com.pjl.domain.Person;
import com.pjl.mapper.PersonMapper;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;
import com.pjl.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PersonServiceImpl implements PersonService {
  @Autowired
  private PersonMapper personMapper;

  @Override
  public PageResult selectByCondition(QueryObject qo) {
    Integer count = personMapper.selectCount();
    if (count>0){
      List<Person> personList = personMapper.queryByCondition(qo);
      return new PageResult(count,personList);
    }
    return PageResult.EMPTY;
  }

  @Override
  public void deleteBatch(List<Integer> ids) {
    Integer r = personMapper.deleteBatch(ids);
  }

  @Override
  public void addPersonInfo(Person person) {
    personMapper.addPersonInfo(person);
  }

  @Override
  public void editPeronInfo(Person person) {
    personMapper.editPersonInfo(person);
  }

  @Override
  public Person selectPersonById(Integer id) {
    return personMapper.selectPersonById(id);
  }


}
