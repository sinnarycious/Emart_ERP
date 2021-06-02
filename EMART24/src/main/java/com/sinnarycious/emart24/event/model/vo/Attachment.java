package com.sinnarycious.emart24.event.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment implements Serializable{

	private int attNo;
	private String attName;
	
}