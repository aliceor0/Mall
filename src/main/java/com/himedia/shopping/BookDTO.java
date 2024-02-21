package com.himedia.shopping;

import lombok.Data;

@Data
public class BookDTO {
	int id;
	String image;
	String name;
	int price;
	int order_id;
	int choice;
	String author;
	String inf;
	String publishDate;
	String publishCompany;
	
}
