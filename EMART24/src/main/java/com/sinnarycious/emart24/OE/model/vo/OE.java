package com.sinnarycious.emart24.OE.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OE implements Serializable{
	private static final long serialVersionUID = 1119L;
	
	private int oeNo;
	private int oeCount;
	private int oePrice;
	private Date orderDate;
	private Date enterDate;
	private String oeStatus;
	private int oeInvNo;
	private String oeName;
	private int oeCatNo;
	

	private Date orderDate1;
	private Date orderDate2;

	public OE(Date orderDate1, Date orderDate2, String oeName, int oeNo) {
		this.orderDate1 = orderDate1;
		this.orderDate2 = orderDate2;
		this.oeName = oeName;
		this.oeNo = oeNo;
	}
	
	public OE(int oeInvNo, String oeName, Date orderDate, int oePrice, int oeCatNo) {
		this.oeInvNo = oeInvNo;
		this.oeName = oeName;
		this.orderDate = orderDate;
		this.oePrice = oePrice;
		this.oeCatNo = oeCatNo;
	}
	
	public OE(int oeNo, String oeName) {
		this.oeNo = oeNo;
		this.oeName = oeName;
	}
}


