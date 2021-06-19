package com.sinnarycious.emart24.sale.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sale implements Serializable{
	private int saleNo;
	private int saleCount;
	private int salePrice;
	private Date saleDate;
	private int saleCatNo;
	private String saleName;
	private int userNo;
	private int proNo;
	
	private Date saleDate1;
	private Date saleDate2;
	
	public Sale(Date saleDate1, Date saleDate2, String saleName, int proNo) {
		this.saleDate1 = saleDate1;
		this.saleDate2 = saleDate2;
		this.saleName = saleName;
		this.proNo = proNo;
	}
}
