package com.sinnarycious.emart24.product.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable{
	private int proNo;
	private String proName;
	private int proPriceS;
	private int proPriceE;
	private int proCatNo;
}
