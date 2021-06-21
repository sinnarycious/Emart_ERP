package com.sinnarycious.emart24.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Event implements Serializable{

	private int evntNo;
	private String evntTitle;
	private String evntContent;
	private Date evntDateS;
	private Date evntDateE;
	private int evntAttNo;
}
