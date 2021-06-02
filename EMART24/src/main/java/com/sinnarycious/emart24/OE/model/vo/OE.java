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
	private int oeNo;
	private int oeCount;
	private Date orderDate;
	private Date enterDate;
	private String oeStatus;
	private int oeInvNo;
	private String oeName;
	private int oeCatNo;
}
