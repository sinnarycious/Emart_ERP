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
}
