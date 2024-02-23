package com.himedia.shopping;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookDAO {
	ArrayList<BookDTO> list();
	int addPro(String itemName,String img1,int price,String aythor,String publishd,String publishc,String booktype);
	ArrayList<BookDTO> cList();
	int addEvent(String title,String inf,String img);
	ArrayList<EventDTO> event();
	ArrayList<DetailDTO> bookInf(int book_id);
	ArrayList<BookDTO> newList();
	ArrayList<BookDTO> pageList(String booktype);
	String booktype(int id);
	
	int removebook(int id);
	int modifybook(int id,String img,String title,int price,String publishd,String publishc,String booktype,String author);
	BookDTO viewbook(int id);
	int gocart(int id,int member_id);
	ArrayList<BookDTO> basketList(int member_id);
	int removecart(int id);
	int removeMemberCart(int member_id);
	int addbasketList(int basketId,String basketImage,String basketName,int basketPrice,int basketSelList );
	
	// QnA 게시판
		ArrayList<dboardDTO> listqna();
		dboardDTO viewqna(int id);
		int savepost(String title,String content,String writer,String passwd);
		int modifypost(int id,String title,String content,String writer,String passwd,String created);
		int delpost(int id);
		int removeallreview(int id);
		
		//QNA게시판 리뷰가져오기
		ArrayList<reviewsDTO> listAnswer(int board_id);
		int qnaAnswer(int id,String username, String title,String inf,String updated);
		int qnaUpdate(int id,String username, String title,String inf,String updated);
		int qnaRemove(int id);
	
	//결제창
	int order_basic(int book_id,int member_id,String address,int cnt,String payway);
	int order_card(int book_id,int member_id,String address,int cnt,String payway,String card,String card_number);
	int order_toss(int book_id,int member_id,String address,int cnt,String payway);
	int cleanCart(int member_id);
	int addTotal(int total,int member_id,String payway);
	// 댓글
		ArrayList<PcommentDTO> listreview(int bookid);
		int addcomment(int bookid, String writer, String content);
		int delcomment(int id);
		int removeAllComment(int id);
	//검색기능 구현하기
	   ArrayList<BookDTO> searchList(String bookTitle);
	//결제내역
	   ArrayList<SalesDTO> salesList_basic(int member_id);
	   ArrayList<SalesDTO> salesList_card(int member_id);
	   ArrayList<SalesDTO> salesList_toss(int member_id);
	
}
