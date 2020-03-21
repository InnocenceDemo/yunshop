package com.lhy.pojo;


public class County {

  private long id;
  private String countycode;
  private String county;
  private String citycode;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getCountycode() {
    return countycode;
  }

  public void setCountycode(String countycode) {
    this.countycode = countycode;
  }


  public String getCounty() {
    return county;
  }

  public void setCounty(String county) {
    this.county = county;
  }


  public String getCitycode() {
    return citycode;
  }

  public void setCitycode(String citycode) {
    this.citycode = citycode;
  }

}
