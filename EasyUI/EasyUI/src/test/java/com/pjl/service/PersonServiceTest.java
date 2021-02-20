package com.pjl.service;

import com.pjl.controller.PersonController;
import com.pjl.domain.Person;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring-config.xml")
public class PersonServiceTest {
  @Autowired
  private PersonService personService;
  @Test
  public void selectByCondition(){
    QueryObject qo = new QueryObject();
    qo.setRows(9);
    qo.setPage(2);
    PageResult pageResult = personService.selectByCondition(qo);
    System.out.println(pageResult.getTotal());
    for (Object row: pageResult.getRows()){
      System.out.println(row);
    }
  }
  @Test
  public void deleteBatch(){
//    String[] ids = {"17","18"};
    List<Integer> list = new ArrayList<>();
    list.add(19);
    list.add(20);
    personService.deleteBatch(list);
  }
  @Test
  public void add(){
    Person person = new Person();
    person.setUsername("哈哈");
    person.setSex(1);
    person.setAge(12);
    person.setMobile("12345678901");
    person.setAddress("湖北");
    personService.addPersonInfo(person);
  }
}
