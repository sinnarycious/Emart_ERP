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
	private static final long serialVersionUID = 1119L;

	private int evntNo;
	private String evntTitle;
	private String evntContent;
	private Date evntDateS;
	private Date evntDateE;
	private int evntAttNo;
	
	private Date evntDateS1;
	private Date evntDateS2;
	
	public Event(Date evntDateS1, Date evntDateS2, String evntTitle, int evntNo) {
		this.evntDateS1 = evntDateS1;
		this.evntDateS2 = evntDateS2;
		this.evntTitle = evntTitle;
		this.evntNo = evntNo;
	}
	
	public Event(String evntContent, Date evntDateE, int evntAttNo) {
		this.evntContent = evntContent;
		this.evntDateE = evntDateE;
		this.evntAttNo = evntAttNo;

	}
}
