package com.sinnarycious.emart24.inv.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Inv implements Serializable{
	private int invNo;
	private String invName;
	private int invWCount;
	private int invSCount;
	private int invPrice;
	private int invCatNo;
}                      
