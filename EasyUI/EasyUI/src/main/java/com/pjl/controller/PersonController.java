package com.pjl.controller;

import com.pjl.domain.Person;
import com.pjl.page.PageResult;
import com.pjl.query.QueryObject;
import com.pjl.service.PersonService;
import com.pjl.service.impl.PersonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 19715
 */
@Controller
@RequestMapping(value = "person")
public class PersonController {
  @Autowired
  private PersonService personService;

  @RequestMapping(value = "/all")
  public @ResponseBody Object showAll(QueryObject qo) {
    PageResult pageResult = personService.selectByCondition(qo);
    //1.将获得当前页person信息
//      List<Person> personList = pageResult.getRows();
//      Integer total = pageResult.getTotal();
    //2.将结果响应给浏览器，json格式

     /* 注意返回给客户端的数据必须包含有total和rows PageResult 包含total和rows*/

    return pageResult;
  }

  @RequestMapping(value = "/deleteBatch")
  public @ResponseBody Object removeBatch(@RequestParam("ids") List<Integer> ids){
    personService.deleteBatch(ids);
    Map<String ,String> map = new HashMap<String ,String>();
    map.put("code","200");
    map.put("msg","批量删除成功！");
    return map;
  }

  @RequestMapping(value = "/add")
  public @ResponseBody Object addPerson(Person person){
    personService.addPersonInfo(person);
    Map<String ,String> map = new HashMap<String ,String>();
    map.put("code","200");
    map.put("msg","添加成功!");
    return map;
  }

  @RequestMapping(value = "/edit")
  public @ResponseBody Object editPerson(Person person){
    personService.editPeronInfo(person);
    Map<String ,String> map = new HashMap<String ,String>();
    map.put("code","200");
    map.put("msg","修改成功!");
    return map;
  }

  @RequestMapping(value = "/id")
  public @ResponseBody Object showPersonById(Integer id){
    return personService.selectPersonById(id);
  }
}
