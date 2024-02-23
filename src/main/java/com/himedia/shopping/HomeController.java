package com.himedia.shopping;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private BookDAO bdao;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	@GetMapping("/gomypage")
	public String mypage() {
		return "mypage";
	}
	@GetMapping("/buyList")
	public String buyList() {
		return "buyList";
	}
	
	@PostMapping("/order")
	public String order(HttpServletRequest req,Model model) {
		String[] cnt = req.getParameterValues("cnt");
		System.out.println(cnt.length);
		String str="";
		for(int i=0; i<cnt.length; i++) {
			if(i==cnt.length-1) {
				str+=cnt[i];
				break;
			}
			str +=cnt[i]+',';
		}
		System.out.println(str);
		model.addAttribute("cnt",str);
		return "order";
	}
	
	@GetMapping("/pregist")
	public String pRegist(Model model) {
		ArrayList<BookDTO> albook = bdao.list();
		 model.addAttribute("albook",albook);
		return "pregist";
	}
	
	@GetMapping("/details")
	   public String details(HttpServletRequest req,Model model) {
	      HttpSession sess = req.getSession();
	      
	      int id=Integer.parseInt(req.getParameter("book_id"));
	      model.addAttribute("book_id",id);

	      ArrayList<PcommentDTO> alreview = bdao.listreview(id);
	      model.addAttribute("alreview", alreview);
	      System.out.println(alreview);
	      
	      
	      return "details";
	   }
	
	@GetMapping("/page")
	public String showPage(HttpServletRequest req,Model model) {
		String type_id = req.getParameter("id");
		String booktype = bdao.booktype(Integer.parseInt(type_id));
		ArrayList<BookDTO> albook= bdao.pageList(booktype);
		model.addAttribute("albook",albook);
		return "page";
	}
	
	@PostMapping("/doDetailList")
	@ResponseBody
	public String doList(HttpServletRequest req) {
		int id=Integer.parseInt(req.getParameter("book_id"));
		ArrayList<DetailDTO> alDetail = bdao.bookInf(id);
//		System.out.println(alDetail);
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alDetail.size(); i++) {
//			System.out.println("들어옴");
			JSONObject jo = new JSONObject();
			jo.put("id", alDetail.get(i).getId());
			jo.put("image", alDetail.get(i).getImage());
//			System.out.println(alDetail.get(i).getImage());
			jo.put("name", alDetail.get(i).getName());
			jo.put("price", alDetail.get(i).getPrice());
			ja.add(jo);
		}

		return ja.toJSONString();
	}
	
	@GetMapping("/getList")
	@ResponseBody
	public String getList() {
		ArrayList<BookDTO> alBook = bdao.list();
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alBook.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", alBook.get(i).getId());
			jo.put("image", alBook.get(i).getImage());
			jo.put("name", alBook.get(i).getName());
			jo.put("price", alBook.get(i).getPrice());
			ja.add(jo);
		}

		return ja.toJSONString();
	}
	
	@ResponseBody
	@PostMapping("/eventList")
	public String eventList() {
		ArrayList<EventDTO> alBook = bdao.event();
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alBook.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", alBook.get(i).getId());
			jo.put("img", alBook.get(i).getImg());
			jo.put("title", alBook.get(i).getTitle());
			jo.put("inf", alBook.get(i).getInf());
			ja.add(jo);
		}

		return ja.toJSONString();
	}
	
	@GetMapping("/event")
	public String doevent() {
		return "event";
	}
	
	@ResponseBody
	@PostMapping("/addEvent")
	public String addEvent(HttpServletRequest req) {
		String title = req.getParameter("title");
		String img = req.getParameter("img");
		String inf = req.getParameter("inf");
		
		int n= bdao.addEvent(title, inf, img);
		
		return ""+n;
	}
	
	@PostMapping("/newList")
	@ResponseBody
	public String newList() {
		ArrayList<BookDTO> alNew = bdao.newList();
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alNew.size(); i++) {
			System.out.println(alNew.size());
			JSONObject jo = new JSONObject();
			jo.put("id", alNew.get(i).getId());
			jo.put("image", alNew.get(i).getImage());
//			System.out.println(alNew.get(i).getImage());
			jo.put("name", alNew.get(i).getName());
			jo.put("price", alNew.get(i).getPrice());
			ja.add(jo);
		}

		return ja.toJSONString();
	}
	@ResponseBody
	@GetMapping("/addpro")
	public String addpro(HttpServletRequest req) {
		// pregist.jsp에서 데이터 받기
		String itemName = req.getParameter("itemName");
		String img1=req.getParameter("img1");
		int price=Integer.parseInt(req.getParameter("price"));
		String author=req.getParameter("author");
		String publishd=req.getParameter("publishd");
		String publishc=req.getParameter("publishc");
		String booktype=req.getParameter("booktype");

		int n = bdao.addPro(itemName, img1, price,author,publishd,publishc,booktype);
		
		return ""+n;
	}
	
	@ResponseBody
	@PostMapping("/choice")
	public String doChoice() {
		ArrayList<BookDTO> alBook = bdao.cList();
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alBook.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("id", alBook.get(i).getId());
			jo.put("image", alBook.get(i).getImage());
			jo.put("name", alBook.get(i).getName());
			jo.put("price", alBook.get(i).getPrice());
			ja.add(jo);
		}

		return ja.toJSONString();
	}
	
	// (jsp) 상세페이지
	@GetMapping("/pdetail")
	public String pdetail(@RequestParam("id") int id,Model model) {
		BookDTO pdto = bdao.viewbook(id);
		model.addAttribute("pd",pdto);
			
		return "pdetail";
	}
		// (db) 책 목록에서 삭제
	@GetMapping("/deletebook")
	public String delbook(HttpServletRequest req) {
		String id = req.getParameter("id");
		System.out.println("ㅇㅇ"+id);
		String userid = req.getParameter("userid");
		String a=mdao.getMember_id(userid);
		int q=bdao.removeAllComment(Integer.parseInt(id));
		int w=bdao.removeMemberCart(Integer.parseInt(a));
		int n = bdao.removebook(Integer.parseInt(id));
//		System.out.println("deleted row: "+n);
		return "redirect:/pregist";
		}
		// (db) 책 목록 수정
	@ResponseBody
	@GetMapping("/modifybook")
	public String modifybook(HttpServletRequest req) {
		String id = req.getParameter("id");
		String img=req.getParameter("img");
		String title=req.getParameter("title");
		String author=req.getParameter("author");
		String publishDate=req.getParameter("publishDate");
		String publishc=req.getParameter("publishCompany");
		String booktype=req.getParameter("booktype");
//		System.out.println("id:"+id+" \n img:"+img+" \n title:"+title+" \n price:"+req.getParameter("price"));
			
		int price=Integer.parseInt(req.getParameter("price"));
		int n = bdao.modifybook(Integer.parseInt(id), img, title, price,publishDate,publishc,booktype,author);
			
		return ""+n;
	}
	
		  //장바구니에서 클릭한 사진띄우기
	@GetMapping("/getbasketList")
	@ResponseBody
	public String getbasketList(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		String a=mdao.getMember_id(userid);
//		System.out.println("들어옴");
		ArrayList<BookDTO> alBook = bdao.basketList(Integer.parseInt(a));
//		System.out.println(alBook);
		JSONArray ja = new JSONArray();
		for (int i = 0; i < alBook.size(); i++) {
			JSONObject jo = new JSONObject();
		    jo.put("id", alBook.get(i).getId());
		    jo.put("order_id", alBook.get(i).getOrder_id());
		    jo.put("image", alBook.get(i).getImage());
//		    System.out.println(alBook.get(i).getImage());
		    jo.put("name", alBook.get(i).getName());
		    jo.put("price", alBook.get(i).getPrice());
		    ja.add(jo);
		}
		  
		return ja.toJSONString();
	}
		   
		   //장바구니에서 보관을 누를시 DB TABLE Bakset 에 인서트로 보관하기
	@GetMapping("/addbasketList")
	@ResponseBody
	public String doaddbaksetList(HttpServletRequest req) {
		String book_id = req.getParameter("book_id");
		int basketId = Integer.parseInt(req.getParameter("basketId"));
		String basketImage = req.getParameter("basketImage");
		String basketName = req.getParameter("basketName");
		int basketPrice = Integer.parseInt(req.getParameter("basketPrice"));
		int basketCnt = Integer.parseInt(req.getParameter("basketCnt"));
		int n=bdao.addbasketList(basketId,basketImage,basketName,basketPrice,basketCnt);
		return ""+n;
	}
	
	@PostMapping("/removecart")
	@ResponseBody
	public String removeCart(HttpServletRequest req) {
		String order_id = req.getParameter("order_id");
		int n= bdao.removecart(Integer.parseInt(order_id));
		
		return ""+n;
	}
	
	//장바구니 페이지로 이동하기
	@GetMapping("/basketList")
	public String goshoppingList() {
		return "/basketList";
	}
	
	@GetMapping("/login")
	public String doLogin() {
		return "login";
	}

	
	
	@GetMapping("/signup")
	public String Signup() {
		return "/signup";
	}
	@GetMapping("/mypage")
	public String gomypage() {
		return "/mypage";
	}
	//회원가입하기
	@PostMapping("/doSignup")
	public String doPostSignup(HttpServletRequest req) {
		String hcheckId = req.getParameter("hcheckId");
		String userid = req.getParameter("userid");
		String passwd = req.getParameter("passwd");
		String passwd1 = req.getParameter("passwd1");
		String name = req.getParameter("name");
		String email1 = req.getParameter("emailAddress");
		String email2 = req.getParameter("emailAddress123");
		String email = email1+"@"+email2;
		String mobile = req.getParameter("mobile");
		if(hcheckId.equals(userid)) {
			if(passwd.equals(passwd1)) {
				System.out.println("passwd 는" + passwd);
				System.out.println("passwd1  은 " + passwd1);
				 mdao.doSignup(userid,passwd,name,email,mobile);
				 return "checkSignup";
			} 
		}
			return "/signup";
	}
	
	@GetMapping("/checkId")
	@ResponseBody
	public String doCheckId(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		
		int n= mdao.checkId(userid);
		
		return ""+n;
	}
	
	//새페이지에서 홈으로 아이디를 가지고 가는 로그인 
	//로그인하기
	@PostMapping("/doLogin123")
	public String doLogin12345(HttpServletRequest req,Model model) {
		String userid = req.getParameter("userid");
		String passwd = req.getParameter("passwd");
		HttpSession sess = req.getSession();
		System.out.println("userid" + userid);
		int n=0;
		if(userid==null || userid.equals("")) {
			n=0;
		} else {
			n=mdao.manager(userid,passwd);
			sess.setAttribute("userid", userid);
			if(n==0) {
				n = mdao.doLogin(userid,passwd);
				System.out.println("n은 로그인" + n);
				sess.setAttribute("writer", userid);
				return "redirect:/";
			}
			sess.setAttribute("admin",userid);
			System.out.println("n 은 매니저로그인"+n);
			n=2;
		}
		return "redirect:/";
	}
		
		//로그아웃하기
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession sess = req.getSession();
		sess.invalidate();
		return "redirect:/";
	}
		
		
	//리뷰작성인가요
	@GetMapping("/write")
	public String write() {
		return "write";
	}
		
	//장바구니에 옮겨담기
	@PostMapping("/dobasketList")
	@ResponseBody
	public String gobasketList() {
		return "/basketList";
		
	}
	
	@PostMapping("/gocart")
	@ResponseBody
	public String gocart(HttpServletRequest req) {
		String book_id = req.getParameter("book_id");
		String member_id =req.getParameter("member_id");
		String a=mdao.getMember_id(member_id);
		System.out.println(book_id);
		System.out.println(a);
		int n=bdao.gocart(Integer.parseInt(book_id),Integer.parseInt(a));
		return ""+n;
	}

	
// 게시판
	// (jsp) 게시판생성
	@GetMapping("/qnaboard")
	public String qnaboard123(Model model) {
		ArrayList<dboardDTO> alqna = bdao.listqna();
		System.out.println("alqna는 리스트가져오기"+alqna);
		model.addAttribute("alqna", alqna);
		return "qnaboard";
	}
	
	// jsp 등록화면 게시판 세션등록
	@GetMapping("/qnawrite")
	public String qnawrite(HttpServletRequest req) {
		HttpSession sess = req.getSession();
		return "qnawrite";
	}
	//게시판 C
	@GetMapping("/savepost")
	@ResponseBody
	public String savepost(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String passwd = req.getParameter("passwd");
		int n=0;
			n = bdao.savepost(title, content, writer, passwd);
			System.out.println("savepost:"+n);
		return ""+n;
	}
	//view 화면으로보기 R
	@GetMapping("/qnaview")
	public String qnawrite(@RequestParam("id") int id,Model model) {
		dboardDTO dbdto = bdao.viewqna(id);
		model.addAttribute("board",dbdto);
		return "qnaview";
	}
	
	//게시물 수정하기 U
	@ResponseBody
	@GetMapping("/modpost")
	public String modpost(HttpServletRequest req) {
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String writer = req.getParameter("writer");
		String passwd = req.getParameter("passwd");
		String created = req.getParameter("created");
//		System.out.println("id"+id+","+"title"+title+","+"created"+created);
		
		if(title==null||title.equals("")) {
			return "redirect:/qnaview";
		}
		int n=0;
			n = bdao.modifypost(Integer.parseInt(id), title, content, writer, passwd, created);
//			System.out.println("modify:"+n);
		return ""+n;
	}
	
	
	//게시물 삭제하기 D
	@PostMapping("/deletePost")
	@ResponseBody
	public String delpost(HttpServletRequest req) {
		String id = req.getParameter("id");
		System.out.println(id);
		// if 게시물을 삭제하는데 안에 댓글이 달려있으면
		// 댓글 을 먼저 지우고 게시물을 삭제한다
		int a= bdao.removeallreview(Integer.parseInt(id));
		int n = bdao.delpost(Integer.parseInt(id));
		
		System.out.println("n은 삭제" +n);
		
		return ""+n;
	}
	//댓글달기 C
	@PostMapping("/qnaAnswer")
	@ResponseBody
	public String doqnaAnswer1(HttpServletRequest req) {
		String board_id = req.getParameter("board_id");
		String userid = req.getParameter("username");
		String title = req.getParameter("title");
		String inf = req.getParameter("inf");
		String updated = req.getParameter("updated");
		System.out.println("date는현재"+updated);
		
		int n = bdao.qnaAnswer(Integer.parseInt(board_id),userid,title,inf,updated);
			System.out.println("n은 답글달기 인서트"+n);
		return ""+n;
		
	}
	
	//댓글들 아이디별로 뷰로 띄우기 R
	@GetMapping("/showAnswer")
	@ResponseBody
	public String showAnswer(HttpServletRequest req) {
		String board_id = req.getParameter("board_id");
		ArrayList<reviewsDTO> alBoard = bdao.listAnswer(Integer.parseInt(board_id));
		JSONArray ja = new JSONArray();
		for(int i=0;i<alBoard.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",alBoard.get(i).getId());
			jo.put("username",alBoard.get(i).getUsername());
			jo.put("title",alBoard.get(i).getTitle());
			jo.put("inf",alBoard.get(i).getInf());
			jo.put("created",alBoard.get(i).getCreated());
			jo.put("updated",alBoard.get(i).getUpdated());
		
			ja.add(jo);
			
		}
	
		return ja.toJSONString();
		
	}
	//댓글달린것 삭제하기 
	@GetMapping("/qnaRemove")
	@ResponseBody
	public String removeqna(HttpServletRequest req) {
		String board_id = req.getParameter("board_id");
		System.out.println("board_id "+ board_id);
		int n =0;
		n = bdao.qnaRemove(Integer.parseInt(board_id));
		
		return ""+n;
	}
		
	//결제창
	@PostMapping("/orderList")
	@ResponseBody
	public String orderList(HttpServletRequest req) {
		
		String cnt = req.getParameter("cnt");
		String[] n = cnt.split(",");
		for(int j=0;j<n.length;j++) {
			if(n[j]==null||n[j].equals("")) {
				return "1";
			}
		}
		String userid = req.getParameter("userid");
		String a=mdao.getMember_id(userid);
		ArrayList<BookDTO> list = bdao.basketList(Integer.parseInt(a));
//		System.out.println(list);
//	    System.out.println(n.length+","+list.size());
		if(n.length!=list.size()) {
			return "1";
		}
		JSONArray ja = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_id", list.get(i).getId());
//		    jo.put("order_id", list.get(i).getOrder_id());
//		    jo.put("image", list.get(i).getImage());
//		    System.out.println(alBook.get(i).getImage());
		    jo.put("name", list.get(i).getName());
		    jo.put("price", list.get(i).getPrice());
		    jo.put("cnt", n[i]);
		    ja.add(jo);
		}
		  System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}
	
	@PostMapping("/basicBuy")
	@ResponseBody
	public String basicBuy(HttpServletRequest req) {
		String cntA =req.getParameter("cnt");
		String book_idA=req.getParameter("book_id");
		String address=req.getParameter("address");
		String member_id=req.getParameter("member_id");
		String payway=req.getParameter("payway");
		String mobile=req.getParameter("mobile");
		String[] book_id=book_idA.split(",");
		String[] cnt=cntA.split(",");
		System.out.println(member_id);
		String a=mdao.getMember_id(member_id);
		int m = mdao.eqmobile(Integer.parseInt(mobile), Integer.parseInt(a));
		if(m==0) {
			return ""+m;
		}
		System.out.println(a);
		for(int i=0;i<book_id.length;i++) {
			System.out.println(book_id[i]);
			int n=bdao.order_basic(Integer.parseInt(book_id[i]), Integer.parseInt(a), address, Integer.parseInt(cnt[i]), payway);
		}
		return "1";
	}
	
	@PostMapping("/cardBuy")
	@ResponseBody
	public String cardBuy(HttpServletRequest req) {
		String cntA =req.getParameter("cnt");
		String book_idA=req.getParameter("book_id");
		String address=req.getParameter("address");
		String member_id=req.getParameter("member_id");
		String payway=req.getParameter("payway");
		String card=req.getParameter("card");
		String cardNum=req.getParameter("cardNum");
		String[] book_id=book_idA.split(",");
		String[] cnt=cntA.split(",");
//		System.out.println(member_id);
		String a=mdao.getMember_id(member_id);
//		System.out.println(a);
		for(int i=0;i<book_id.length;i++) {
			int n=bdao.order_card(Integer.parseInt(book_id[i]), Integer.parseInt(a), address, Integer.parseInt(cnt[i]), payway,card,cardNum);
		}
		return "1";
	}
	
	@PostMapping("/tossBuy")
	@ResponseBody
	public String tossBuy(HttpServletRequest req) {
		String cntA =req.getParameter("cnt");
		String book_idA=req.getParameter("book_id");
		String address=req.getParameter("address");
		String member_id=req.getParameter("member_id");
		String payway=req.getParameter("payway");
		String mobile=req.getParameter("mobile");
		String[] book_id=book_idA.split(",");
		String[] cnt=cntA.split(",");
//		System.out.println(member_id);
		String a=mdao.getMember_id(member_id);
		int m = mdao.eqmobile(Integer.parseInt(mobile), Integer.parseInt(a));
		if(m==0) {
			return ""+m;
		}
//		System.out.println(a);
		for(int i=0;i<book_id.length;i++) {
			int n=bdao.order_toss(Integer.parseInt(book_id[i]), Integer.parseInt(a), address, Integer.parseInt(cnt[i]), payway);
		}
		return "1";
	}
	
	@PostMapping("/addTotal")
	@ResponseBody
	public String addTotal(HttpServletRequest req) {
		String member_id=req.getParameter("member_id");
		String payway=req.getParameter("payway");
		String total=req.getParameter("total");
		
		String a=mdao.getMember_id(member_id);
		int n =bdao.addTotal(Integer.parseInt(a), Integer.parseInt(total), payway);
		
		return ""+n;
	}
	
	@PostMapping("/cleanCart")
	@ResponseBody
	public String cleanCart(HttpServletRequest req) {
		String member_id=req.getParameter("member_id");
		String a=mdao.getMember_id(member_id);
		
		int n =  bdao.cleanCart(Integer.parseInt(a));
		System.out.println("ㅇㅇ"+n);
		return ""+n;
	}
	
//	리뷰 댓글 작성
	// (jsp) 댓글 페이지
	@GetMapping("/pcomment")
	public String preview(HttpServletRequest req, Model model) {
		
		HttpSession sess = req.getSession();
		int bookid = Integer.parseInt(req.getParameter("id")) ;
		BookDTO pdto = bdao.viewbook(bookid);
		model.addAttribute("pd",pdto);
		
		ArrayList<PcommentDTO> alreview = bdao.listreview(bookid);
		model.addAttribute("alreview", alreview);
//		System.out.println(alreview);
		return "pcomment";
	}
	// (db) 댓글 등록
	@ResponseBody
	@GetMapping("/addcomment")
	public String addcmt(HttpServletRequest req) {
		String bookid = req.getParameter("bookid");// 임시
		String writer = req.getParameter("writer");// 임시
		String content = req.getParameter("content");
//		System.out.println("bookid"+bookid+",writer"+writer+",content"+content,"score"+score);
		
		int n = bdao.addcomment(Integer.parseInt(bookid), writer, content);
		System.out.println("addcmt:"+n);
		return ""+n;
	}
	// (db) 댓글 삭제
	@ResponseBody
	@GetMapping("/delcomment")
	public String delcomment(HttpServletRequest req) {
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		int n=bdao.delcomment(id);
		
		System.out.println("delcomment:"+n);
		return ""+n;
	}
	
	
	
	
	//검색엔진 제이스로 아쟉스로 바로홈에띄우기
	@GetMapping("/getSearchList")
	@ResponseBody
	public String getSearchList(HttpServletRequest req) {
		String bookTitle = req.getParameter("bookTitle");
		System.out.println("booktitle"+bookTitle);
		ArrayList<BookDTO> alSearch = bdao.searchList(bookTitle);
		JSONArray ja = new JSONArray();
		for(int i=0;i<alSearch.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("id",alSearch.get(i).getId());
			jo.put("image",alSearch.get(i).getImage());
			jo.put("author",alSearch.get(i).getAuthor());
			jo.put("name",alSearch.get(i).getName());
			jo.put("inf",alSearch.get(i).getInf());
			jo.put("price",alSearch.get(i).getPrice());
			ja.add(jo);
			
		}
		System.out.println("ja 를찍어줘" + ja);
		return ja.toJSONString();
	}
	
	//결제내역 리스트
	@GetMapping("/gobuyList")
	@ResponseBody
	public String gobuyList(HttpServletRequest req) {
		String member_id = req.getParameter("member_id");
		String mem = mdao.getMember_id(member_id);
		System.out.println("mem 은 아이디 뽑아오기" + mem);
		System.out.println("member_id 결제내역" +member_id );
		JSONArray ja = new JSONArray();
		
		ArrayList<SalesDTO> alSales = mdao.findTotal_basic(Integer.parseInt(mem));
		System.out.println("alSales 가져오나요 토탈을");
		
		
		for(int i=0;i<alSales.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name",alSales.get(i).getBook_name());
			System.out.println("jo는 책제목" + jo);
			jo.put("cnt",alSales.get(i).getCnt());
			jo.put("price",alSales.get(i).getPrice());
			jo.put("order_dt",alSales.get(i).getOrder_dt());
			jo.put("address",alSales.get(i).getAddress());
			jo.put("total",(alSales.get(i).getCnt()*alSales.get(i).getPrice()));
			ja.add(jo);
		}
		
		alSales = mdao.findTotal_card(Integer.parseInt(mem));
		for(int i=0;i<alSales.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name",alSales.get(i).getBook_name());
			jo.put("cnt",alSales.get(i).getCnt());
			jo.put("price",alSales.get(i).getPrice());
			jo.put("order_dt",alSales.get(i).getOrder_dt());
			jo.put("address",alSales.get(i).getAddress());
			jo.put("total",(alSales.get(i).getCnt()*alSales.get(i).getPrice()));
			ja.add(jo);
		}
		
		
		alSales = mdao.findTotal_toss(Integer.parseInt(mem));

		for(int i=0;i<alSales.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name",alSales.get(i).getBook_name());
			jo.put("cnt",alSales.get(i).getCnt());
			jo.put("price",alSales.get(i).getPrice());
			jo.put("order_dt",alSales.get(i).getOrder_dt());
			jo.put("address",alSales.get(i).getAddress());
			jo.put("total",(alSales.get(i).getCnt()*alSales.get(i).getPrice()));
			ja.add(jo);
		
		}
		return ja.toJSONString();
	}
	
	
	@GetMapping("/delList")
	@ResponseBody
	public String delList(HttpServletRequest req) {
		String member_id = req.getParameter("member_id");
		String mem = mdao.getMember_id(member_id);
		System.out.println("me은 아이디" + mem);
		String order_dt = req.getParameter("order_dt");
		System.out.println("order_dt 는 시간"+order_dt);
		int n=0;
		
		n = mdao.delList(Integer.parseInt(mem),order_dt);
			System.out.println("n은 삭제입니다전체삭제"+n);
		
		 n = mdao.delList_basic(Integer.parseInt(mem),order_dt);
		 System.out.println("n은 삭제입니다현찰"+n);
		 n = mdao.delList_card(Integer.parseInt(mem),order_dt);
		 System.out.println("n은 삭제입니다카드"+n);
		 n = mdao.delList_toss(Integer.parseInt(mem),order_dt);
		System.out.println("n은 삭제입니다토스"+n);
		return ""+n;
	}
	
	
	
	
	
	
	
}
