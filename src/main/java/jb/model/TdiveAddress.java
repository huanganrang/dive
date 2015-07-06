﻿
/*
 * @author John
 * @date - 2015-07-06
 */

package jb.model;

import javax.persistence.*;

import java.util.Date;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@SuppressWarnings("serial")
@Entity
@Table(name = "dive_address")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TdiveAddress implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DiveAddress";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_NAME = "潜水名称";
	public static final String ALIAS_SUMARY = "简介";
	public static final String ALIAS_ICON = "图片";
	public static final String ALIAS_DESCRIPTION = "文案";
	public static final String ALIAS_AREA = "地区";
	public static final String ALIAS_FEATURE = "特点";
	public static final String ALIAS_STATUS = "状态（上架，下架）";
	public static final String ALIAS_ADDTIME = "addtime";
	
	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private java.lang.String id;
	//@Length(max=128)
	private java.lang.String name;
	//@Length(max=256)
	private java.lang.String sumary;
	//@Length(max=2147483647)
	private java.lang.String icon;
	//@Length(max=2147483647)
	private java.lang.String description;
	//@Length(max=4)
	private java.lang.String area;
	//@Length(max=4)
	private java.lang.String feature;
	//@Length(max=4)
	private java.lang.String status;
	//
	private java.util.Date addtime;
	//columns END


		public TdiveAddress(){
		}
		public TdiveAddress(String id) {
			this.id = id;
		}
	

	public void setId(java.lang.String id) {
		this.id = id;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "name", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	@Column(name = "sumary", unique = false, nullable = true, insertable = true, updatable = true, length = 256)
	public java.lang.String getSumary() {
		return this.sumary;
	}
	
	public void setSumary(java.lang.String sumary) {
		this.sumary = sumary;
	}
	
	@Column(name = "icon", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getIcon() {
		return this.icon;
	}
	
	public void setIcon(java.lang.String icon) {
		this.icon = icon;
	}
	
	@Column(name = "description", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getDescription() {
		return this.description;
	}
	
	public void setDescription(java.lang.String description) {
		this.description = description;
	}
	
	@Column(name = "area", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getArea() {
		return this.area;
	}
	
	public void setArea(java.lang.String area) {
		this.area = area;
	}
	
	@Column(name = "feature", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getFeature() {
		return this.feature;
	}
	
	public void setFeature(java.lang.String feature) {
		this.feature = feature;
	}
	
	@Column(name = "status", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	

	@Column(name = "addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.util.Date getAddtime() {
		return this.addtime;
	}
	
	public void setAddtime(java.util.Date addtime) {
		this.addtime = addtime;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("Sumary",getSumary())
			.append("Icon",getIcon())
			.append("Description",getDescription())
			.append("Area",getArea())
			.append("Feature",getFeature())
			.append("Status",getStatus())
			.append("Addtime",getAddtime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DiveAddress == false) return false;
		if(this == obj) return true;
		DiveAddress other = (DiveAddress)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

