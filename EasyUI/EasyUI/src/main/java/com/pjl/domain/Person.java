package com.pjl.domain;

import java.io.Serializable;

/**
 * @author 19715
 */
public class Person implements Serializable {
  private Integer id;
  private String username;
  private Integer sex;
  private Integer age;
  private String mobile;
  private String address;

  @Override
  public String toString() {
    return "Person{" +
        "id=" + id +
        ", username='" + username + '\'' +
        ", sex=" + sex +
        ", age=" + age +
        ", mobile='" + mobile + '\'' +
        ", address='" + address + '\'' +
        '}';
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public Integer getAge() {
    return age;
  }

  public void setAge(Integer age) {
    this.age = age;
  }

  public String getMobile() {
    return mobile;
  }

  public void setMobile(String mobile) {
    this.mobile = mobile;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }
}
