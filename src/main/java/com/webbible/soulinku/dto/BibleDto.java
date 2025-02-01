package com.webbible.soulinku.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BibleDto{

	
	private String bookAf;     //구약, 신약
	private String bookSeq;    //시퀀스넘버
	private String btweenYn;   //단건, 다건 조회
	private String chapter;    //장
	private String verse;      //절
	private String chapter2;   //장
	private String verse2;     //절
	private String searchKeyword; //키워드
	
	
	
}
