package com.himedia.shopping;

import lombok.Data;

@Data
public class SalesDTO {
	int id;
	int total;
	String order_dt;
	String book_name;
	String name;
	int cnt;
	String address;
	int price;
	String payway;
	int member_id;
	String card;
	String card_number;
}
