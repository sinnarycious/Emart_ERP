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
	private int userNo;
	private String userId;
	private String userPwd;
	private String userRNo;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userBranch;
	private Date userOpenDate;
	private String userAttNO;
}