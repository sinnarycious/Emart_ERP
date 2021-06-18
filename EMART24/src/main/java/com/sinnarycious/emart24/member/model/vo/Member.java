package com.sinnarycious.emart24.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1000010L;

	private int userNo;
	private String userId;
	private String userPwd;
	private String userRNo;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userBranch;
	private Date userOpenDate;
	private String userAttNo;
	
	
	public Member(String userId, String userPwd) {
		this.userId = userId;
		this.userPwd = userPwd;
	}

	
}
