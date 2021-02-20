package com.pjl.mapper;

import com.pjl.domain.Person;
import com.pjl.query.QueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 19715
 */
@Repository
public interface PersonMapper {
  List<Person> selectPersonAll();
  Integer selectCount();
  List<Person> queryByCondition(QueryObject qo);
  Integer deleteBatch(@Param("ids") List<Integer> ids);
  Integer addPersonInfo(Person person);
  void editPersonInfo(Person person);
  Person selectPersonById(Integer id);
}
