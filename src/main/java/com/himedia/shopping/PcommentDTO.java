package com.himedia.shopping;

import lombok.Data;

@Data
public class PcommentDTO {
	int id;
	int bookid;
	String writer;
	String content;
	String created;
}
