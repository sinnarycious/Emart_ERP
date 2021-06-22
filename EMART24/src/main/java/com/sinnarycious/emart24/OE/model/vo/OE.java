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
	private int userNo;

	private String orderDate1;
	private String orderDate2;
	
	
	private int[] oeNo3;
	private int[] oeCount3;
	private int[] oePrice3;
	private int[] oeInvNo3;
	private String[] oeName3;
	private int[] oeCatNo3;
	private int[] userNo3;
	
	public OE(String orderDate1, String orderDate2, String oeName, int oeNo) {
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
	
	public OE(int oeNo) {
		 this.oeNo = oeNo;
	}
	
	public OE(int[] oeNo3, int[] oeCount3, int[] oePrice3,
			int[] oeInvNo3, String[] oeName3, int[] oeCatNo3, int userNo) {
		this.oeNo3 = oeNo3;					// 발주번호
		this.oeCount3 = oeCount3;			// 발주 개수
		this.oePrice3 = oePrice3;			// 발주 가격
		this.oeInvNo3 = oeInvNo3;			// 상품 번호
		this.oeName3 = oeName3;				// 상품명
		this.oeCatNo3 =oeCatNo3;			// 상품카테고리 번호
		this.userNo = userNo;				// 회원번호
	}
}


