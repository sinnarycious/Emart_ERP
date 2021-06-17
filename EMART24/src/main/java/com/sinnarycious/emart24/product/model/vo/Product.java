package com.sinnarycious.emart24.product.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable{
	
	private static final long serialVersionUID = 1004L;
	private int proNo;
	private String proName;
	private int proPriceS;
	private int proPriceE;
	private int proCatNo;
	
	public Product(int proNo, String proName, int proCatNo) {
		this.proNo = proNo;
		this.proName = proName;
		this.proCatNo = proCatNo;
	}
}

