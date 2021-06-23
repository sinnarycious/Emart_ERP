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
	private int saleSum;
	private String findDate;
	private int proNo;

	private String saleDate1;
	private String saleDate2;

	public Sale(String saleDate1, String saleDate2, String saleName, int proNo) {
		this.saleDate1 = saleDate1;
		this.saleDate2 = saleDate2;
		this.saleName = saleName;
		this.proNo = proNo;
	}
	
	public Sale(String findDate, int saleCatNo) {
		this.findDate = findDate;
		this.saleCatNo = saleCatNo;
	}
	
	public Sale(int proNo, String saleName) {
		this.proNo = proNo;
		this.saleName = saleName;
	}

	public Sale(int proNo) {
		 this.proNo = proNo;
	}
}
