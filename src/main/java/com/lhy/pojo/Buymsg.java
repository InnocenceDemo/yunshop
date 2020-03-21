package com.lhy.pojo;


public class Buymsg {

  private long id;
  private long uid;
  private long gid;
  private long isbuy;
  private long iscomment;
  private Integer buycount;
  private java.sql.Timestamp createTime;
  private java.sql.Date updateTime;

  public Integer getBuycount() {
    return buycount;
  }

  public void setBuycount(Integer buycount) {
    this.buycount = buycount;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUid() {
    return uid;
  }

  public void setUid(long uid) {
    this.uid = uid;
  }


  public long getGid() {
    return gid;
  }

  public void setGid(long gid) {
    this.gid = gid;
  }


  public long getIsbuy() {
    return isbuy;
  }

  public void setIsbuy(long isbuy) {
    this.isbuy = isbuy;
  }


  public long getIscomment() {
    return iscomment;
  }

  public void setIscomment(long iscomment) {
    this.iscomment = iscomment;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public java.sql.Date getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(java.sql.Date updateTime) {
    this.updateTime = updateTime;
  }

}
