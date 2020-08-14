package spring.project.bookshop4.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import spring.project.bookshop4.persistence.BoardDAO;
import spring.project.bookshop4.persistence.BookDAO;
import spring.project.bookshop4.persistence.ExtraDAO;
import spring.project.bookshop4.persistence.GuestDAO;
import spring.project.bookshop4.persistence.OrderDAO;
import spring.project.bookshop4.vo.BoardVO;
import spring.project.bookshop4.vo.BookVO;
import spring.project.bookshop4.vo.GuestVO;
import spring.project.bookshop4.vo.OrderVO;

@Service
public class GuestServiceImpl implements GuestService{
	
	@Autowired
	GuestDAO guestDAO;
	@Autowired
	BookDAO bookDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	ExtraDAO extraDAO;
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public void mainPage(HttpServletRequest request, Model model) {
		//신간 리스트
		List<BookVO> newBookList = bookDAO.getNewBook();
		//잘팔린 리스트
		List<BookVO> bestBookList01 = bookDAO.getBestBook("01");
		List<BookVO> bestBookList02 = bookDAO.getBestBook("02");
		List<BookVO> bestBookList03 = bookDAO.getBestBook("03");
		List<BookVO> bestBookList04 = bookDAO.getBestBook("04");
		
		//할인율 높은 책
		List<BookVO> goodPriceList = bookDAO.getGoodPriceBook();
		
		model.addAttribute("newBookList", newBookList);
		model.addAttribute("bestBookList01", bestBookList01);
		model.addAttribute("bestBookList02", bestBookList02);
		model.addAttribute("bestBookList03", bestBookList03);
		model.addAttribute("bestBookList04", bestBookList04);
		model.addAttribute("goodPriceList", goodPriceList);
		
	}
	
	@Override
	public void admit(HttpServletRequest request, Model model) {
		int admitCnt =0 ;
		
		String id = request.getParameter("uid");
		String pwd = request.getParameter("pwd1");
		System.out.println("pwd 암호화 이전 : "+ pwd);
		pwd = passwordEncoder.encode(pwd);
		System.out.println("pwd 암호화 이후 : "+ pwd);
		
		
		String name = request.getParameter("uname");
		String jumin1 = request.getParameter("jumin1");
		String jumin2 = request.getParameter("jumin2");
		String solar = request.getParameter("birthType");
		String birthYear = request.getParameter("birthYear");
		String birthMonth = request.getParameter("birthMonth");
		String birthDate = request.getParameter("birthDate");
		String birth = birthYear+"-"+birthMonth+"-"+birthDate;
		
		String gender = request.getParameter("sex");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String phone1 = request.getParameter("handphone1");
		String phone2 = request.getParameter("handphone2");
		String phone3 = request.getParameter("handphone3");
		String emailCheck = request.getParameter("mailAgree");
		String smsCheck = request.getParameter("smsAgree");
		String address1 = request.getParameter("homezip1");
		String address2 = request.getParameter("homeAddr1");
		String address3 = request.getParameter("homeAddr2");
		
		GuestVO guest = new GuestVO();
		guest.setId(id);
		guest.setPassword(pwd); 
		guest.setName(name);
		guest.setJumin(jumin1+jumin2);
		guest.setBirth(java.sql.Timestamp.valueOf(birth+" 00:00:00"));
		guest.setSolar(solar); 
		guest.setGender(gender);
		guest.setEmail(email1+"@"+email2);
		guest.setPhone(phone1+"-"+phone2+"-"+phone3);
		guest.setEmailCheck(emailCheck);
		guest.setSmsCheck(smsCheck);
		
		guest.setAddress1(address1);
		guest.setAddress2(address2);
		guest.setAddress3(address3);
		
		admitCnt = guestDAO.addGuest(guest);
		
		if(admitCnt ==1) {
			String message = id + "님이 회원가입하셨습니다";
			extraDAO.addMessage(message);
		}
		
		model.addAttribute("admitCnt", admitCnt);
	}
	
	@Override
    public void confirmId(@RequestParam String id, Model model) {
        //3단계, 화면으로부터 입력받은 값을 받아온다.
        System.out.println("여기까지?");
        //5단계 - 중복된 id가 있는지 확인
        int selectCnt = guestDAO.idCheck(id);
        
        //6단계 - request 객체나 session 객체를 통해 jsp에 값 전달
        model.addAttribute("selectCnt", selectCnt);
        model.addAttribute("id", id);
	 }
	
	@Override
	public void login(HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++) {
			String cookieName= cookies[i].getName();
			if(cookieName.equals("idsave")) {
				String idsave = cookies[i].getValue();
				model.addAttribute("idsave",idsave);
			}
		}
	}
	 
	@Override
	public void rememberId(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String email =request.getParameter("email");
		
		if(name != null && email != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("name", name);
			map.put("email", email);
			
			String id = guestDAO.rememberId(map);
			System.out.println("id : "+id);
			
			int selectCnt = (id.length()>=1) ? 1 : 0;
			model.addAttribute("selectCnt", selectCnt);
			model.addAttribute("id", id);
		}
	}
	
	@Override
	public void rememberPwd(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email =request.getParameter("email");
		
		if(id != null && name != null && email != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("name", name);
			map.put("email", email);
			
			int selectCnt = guestDAO.rememberPwd(map);
			
			if(selectCnt==1) {
				String pwd =this.makePassword(8);
				System.out.println("pwd :"+pwd);
				
				String Epwd = passwordEncoder.encode(pwd);
				System.out.println("암호화된 pwd "+Epwd);
				
				
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("id", id);
				map2.put("pwd", Epwd);
				
				int updateCnt = guestDAO.updatePwd(map2);
				System.out.println("update 는 됫습니다 "+updateCnt);
				
				int success = guestDAO.sendmail(email, pwd);
				System.out.println("메일 보내기 는 됫습니다 "+success);
				
				model.addAttribute("success", success);
				model.addAttribute("pwd", pwd);
			}
			model.addAttribute("selectCnt", selectCnt);
		}
	}
	
	public String makePassword(int size) {//임시 비밀번호 생성
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
		String chars[] = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
		for (int i = 0; i < size; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	
	@Override
	public void bookDetail(HttpServletRequest request, Model model) {
		String ISBN = request.getParameter("ISBN");
		
		BookVO book = bookDAO.searchStockBook(ISBN);
		
		model.addAttribute("book", book);
	}
	
	@Override
	public void searchList(HttpServletRequest request, Model model) {
		String category = "";
				
		if(request.getParameter("category")!=null) {
			category = request.getParameter("category");
		}else if(request.getParameter("category")!=null) {
			category = request.getParameter("gc");
		}
		
		String search = "";
		if(request.getParameter("d_s")!=null) {
			search = request.getParameter("d_s");
		}else if(request.getParameter("search")!=null||request.getParameter("search")!=""){
			search = request.getParameter("search");
		}
		
		String array="basic";
		if(request.getParameter("array")!=null) {
			array = request.getParameter("array");
		}
		
		int pageSize = 20;     //한페이지당 출력할 글 갯수
        int pageBlock = 8;     //한 블럭당 페이지 갯수
        
        int cnt = 0;        //글 갯수
        int start = 0;         //현재글 시작번호
        int end = 0;         //현재 페이지 마지막 글 번호
        int currentPage=0;    //현재페이지
        
        int pageCount = 0;    //페이지 갯수
        int startPage = 0;    //시작페이지
        int endPage = 0;    //마지막페이지
        
        List<BookVO> books=null;
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        
        	//5. dao 인스턴스 
		if(category.equals("")) {cnt = bookDAO.bookSearchCnt1(search);}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			map.put("category", category);
			cnt = bookDAO.bookSearchCnt2(map);
			}
		
        	//페이지 갯수
        pageCount = cnt/pageSize +(cnt%pageSize>0 ? 1 : 0);
        	//현재 페이지 시작 글번호(페이지별)
        start=(currentPage-1)*pageSize +1;
        startPage = (currentPage / pageBlock) * pageBlock +1;
        if(currentPage % pageBlock==0) startPage -=pageBlock;
            //현재 페이지 마지막 글번호(페이지별)
        end=start+pageSize-1;
        endPage = startPage + pageBlock-1;
        if(endPage > pageCount) endPage = pageCount;
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("search", search);
        map.put("category", category);
        
        if(array.equals("basic")) {
	        if(category.equals("")) {books= bookDAO.bookSearch1(map);}
	        else {books =bookDAO.bookSearch2(map);}
        }else if(array.equals("recent")) {
        	if(category.equals("")) {books= bookDAO.bookSearchRecent1(map);}
	        else {books =bookDAO.bookSearchRecent2(map);}
        }else if(array.equals("low")) {
        	if(category.equals("")) {books= bookDAO.bookSearchLow1(map);}
	        else {books =bookDAO.bookSearchLow2(map);}
        }else if(array.equals("high")) {
        	if(category.equals("")) {books= bookDAO.bookSearchHigh1(map);}
	        else {books =bookDAO.bookSearchHigh2(map);}
        }
		
        String category_cash = "";
        if(category.length()>=2) {
        	category_cash=category.substring(0,2);
        }else {
        	category_cash=request.getParameter("category");
        }
        
        //5. 자료값으로 정리
		model.addAttribute("books", books);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    model.addAttribute("pageSize",pageSize);
	    model.addAttribute("category",category_cash);
	    model.addAttribute("search", request.getParameter("search"));
	    model.addAttribute("array", array);
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}
	
	@Override
	public void buybookList(HttpServletRequest request, Model model) {
		String[] selected = request.getParameterValues("check");
		String[] totalISBN = request.getParameterValues("ISBN");
		String[] totalCount = request.getParameterValues("chk_cnt");
		
		ArrayList<String> ISBNs = new ArrayList<String>();
		ArrayList<Integer> counts = new ArrayList<Integer>();
		
		for(String i : selected) {
			ISBNs.add(totalISBN[Integer.parseInt(i)]);
			counts.add(Integer.parseInt(totalCount[Integer.parseInt(i)]));
		}
		
		String id = (String)request.getSession().getAttribute("id");
		ArrayList<BookVO> books = new ArrayList<BookVO>();
		
		for(int i=0; i<ISBNs.size(); i++) {
			String ISBN = ISBNs.get(i);
			int count = counts.get(i);
			
			BookVO book = bookDAO.searchStockBook(ISBN);
			book.setBookCount(count);
			books.add(book);
		}
		
		GuestVO guest = guestDAO.searchGuest(id);
		
		model.addAttribute("books", books);
		model.addAttribute("guest", guest);
	}
	
	@Override
	public void buyBook(HttpServletRequest request, Model model) {
		String ISBN = request.getParameter("ISBN");
		String id = (String)request.getSession().getAttribute("id");
		ArrayList<BookVO> books = new ArrayList<BookVO>();
		String count = request.getParameter("count");
		System.out.println("count : "+count);
		
		BookVO book = bookDAO.searchStockBook(ISBN);
		book.setBookCount(Integer.parseInt(count));
		
		GuestVO guest = guestDAO.searchGuest(id);
		
		books.add(book);
		model.addAttribute("books", books);
		model.addAttribute("guest", guest);
	}
	
	@Override
	public void shoppingCartAdd(HttpServletRequest request, Model model) {
		String id = (String)request.getSession().getAttribute("id");
		String ISBN = request.getParameter("ISBN");
		
		int count = Integer.parseInt(request.getParameter("count"));
		StringBuilder strISBNs = new StringBuilder();
		
		ArrayList<String> successISBN = new ArrayList<String>();
		int updateCnt = 0;
		
		
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ISBN",ISBN);
		map.put("id",id);
		map.put("count",count);
		mapList.add(map);
		
		int existCheck = orderDAO.shoppingCartCheck(map);
		if(existCheck == 0) {
			int insertCnt=0;
			
			for(HashMap<String, Object> map2 : mapList) {
				insertCnt = orderDAO.shoppingCartAdd(map2);
				if(insertCnt==1) {
					successISBN.add((String)map2.get("ISBN"));
				}
			}
			
			updateCnt = successISBN.size();
			for(String str : successISBN) {
				if(strISBNs.length()==0) {
					strISBNs.append(str);
				}else {
					strISBNs.append(", "+str);
				}
			}
		}
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("ISBNs", strISBNs);
		model.addAttribute("existCheck", existCheck);
	};
	
	@Override
	public void shoppingCartListPro(HttpServletRequest request, Model model) {
		String[] selected = request.getParameterValues("check");
		String[] totalISBN = request.getParameterValues("ISBN");
		String[] totalCount = request.getParameterValues("chk_cnt");
		
		ArrayList<String> ISBNs = new ArrayList<String>();
		ArrayList<Integer> counts = new ArrayList<Integer>();
		
		for(String i : selected) {
			ISBNs.add(totalISBN[Integer.parseInt(i)]);
			counts.add(Integer.parseInt(totalCount[Integer.parseInt(i)]));
		}
		
		String id = (String)request.getSession().getAttribute("id");
		ArrayList<BookVO> books = new ArrayList<BookVO>();
		
		ArrayList<HashMap<String, Object>> mapList = new ArrayList<HashMap<String, Object>>();
		for(int i=0; i<ISBNs.size(); i++) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("ISBN",ISBNs.get(i));
			map.put("id",id);
			map.put("count",counts.get(i));
			mapList.add(map);
		}
		
		StringBuilder strISBNs = new StringBuilder();
		
		ArrayList<String> successISBN = new ArrayList<String>();
		int updateCnt = 0;
		for(HashMap<String, Object> map : mapList) {
			int existCheck = orderDAO.shoppingCartCheck(map);
			if(existCheck == 0) {
				int insertCnt=0;
				
				for(HashMap<String, Object> map2 : mapList) {
					insertCnt = orderDAO.shoppingCartAdd(map2);
					if(insertCnt==1) {
						successISBN.add((String)map2.get("ISBN"));
					}
				}
			}
		}
		
		updateCnt = successISBN.size();
		for(String str : successISBN) {
			if(strISBNs.length()==0) {
				strISBNs.append(str);
			}else {
				strISBNs.append(", "+str);
			}
		}
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("ISBNs", strISBNs);
		model.addAttribute("existCheck", 0);
	};
	
	@Override
	public void buyBookPro(HttpServletRequest request, Model model) {
		String[] ISBNs = request.getParameterValues("ISBNs[]");
		String[] counts = request.getParameterValues("counts[]");
		String[] price = request.getParameterValues("price[]");
		String id = (String)request.getSession().getAttribute("id");
		int orderCnt = ISBNs.length;
		int insertCnt=0;
		int deleteCnt =0;
		
		for(int i=0; i<ISBNs.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ISBN", ISBNs[i]);
			map.put("count", Integer.parseInt(counts[i]));
			map.put("price", Integer.parseInt(price[i]));
			map.put("id", id);
			
			int insertCntCheck=orderDAO.buyBookPro(map);
			if(insertCntCheck==1) {
				String message = id+"님이 "+ISBNs[i]+"책을 구매신청하셨습니다";
				System.out.println(map.get("ISBN")+"의 책 구매가 처리되었습니다");
				insertCnt++;
				extraDAO.addMessage(message);
			}
			deleteCnt=bookDAO.buybook(map);
			if(deleteCnt==1) {
				System.out.println(map.get("ISBN")+"주문이 재고에서 줄었습니다");
			}
			deleteCnt=orderDAO.deleteFromCart(map);
			if(deleteCnt==1) {
				System.out.println(map.get("ISBN")+"손님의 장바구니에서 삭제되었습니다");
			}
		}
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void myPage(HttpServletRequest request, Model model) {
		String id = (String)request.getSession().getAttribute("id");
		
		List<OrderVO> orderList = null;
		List<OrderVO> shoppingCart = null;
		
		int shoppingCartCnt = 0;
		int orderListCnt =0;
		
		shoppingCart =orderDAO.getShoppingCartList(id);
		if(shoppingCart != null) {
			shoppingCartCnt= shoppingCart.size();
		}
		
		orderList = orderDAO.getOrderList(id);
		if(orderList != null) {
			orderListCnt= orderList.size();
		}
		
		model.addAttribute("shoppingCart", shoppingCart);
		model.addAttribute("shoppingCartCnt", shoppingCartCnt);
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderListCnt", orderListCnt);
		
		System.out.println("orderListCnt : " + orderListCnt);
		System.out.println("shoppingCartCnt : "+ shoppingCartCnt);
	}
	
	@Override
	public void buyBookForCart(HttpServletRequest request, Model model) {
		String id = (String)request.getSession().getAttribute("id");
		
		String[] select = request.getParameterValues("select");
		String[] totalISBN = request.getParameterValues("ISBN");
		String[] totalCount = request.getParameterValues("count");
		
		ArrayList<String>ISBNs = new ArrayList<String>();
		ArrayList<Integer>counts = new ArrayList<Integer>();
		for(String idx: select) {
			ISBNs.add(totalISBN[Integer.parseInt(idx)]);
			counts.add(Integer.parseInt(totalCount[Integer.parseInt(idx)]));
		}
		
		ArrayList<BookVO> books = new ArrayList<BookVO>();
		
		for(int i=0; i<ISBNs.size(); i++) {
			BookVO book = bookDAO.searchStockBook(ISBNs.get(i));
			book.setBookCount(counts.get(i));
			books.add(book);
		}
		
		GuestVO guest = guestDAO.searchGuest(id);
		
		model.addAttribute("books", books);
		model.addAttribute("guest", guest);
	}

	@Override
	public void boardList(HttpServletRequest request, Model model) {
		//3.변수선언
		int pageSize = 10;     //한페이지당 출력할 글 갯수
        int pageBlock = 5;     //한 블럭당 페이지 갯수
        
        int cnt = 0;        //글 갯수
        int start = 0;         //현재글 시작번호
        int end = 0;         //현재 페이지 마지막 글 번호
        int currentPage=0;    //현재페이지
        
        int pageCount = 0;    //페이지 갯수
        int startPage = 0;    //시작페이지
        int endPage = 0;    //마지막페이지
        
        String search="";
        List<BoardVO> boards=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
		if(search=="") {cnt = boardDAO.boardCnt();}
		else {cnt = boardDAO.searchBoardCnt(search);}
		
        	//페이지 갯수
        pageCount = cnt/pageSize +(cnt%pageSize>0 ? 1 : 0);
        	//현재 페이지 시작 글번호(페이지별)
        start=(currentPage-1)*pageSize +1;
        startPage = (currentPage / pageBlock) * pageBlock +1;
        if(currentPage % pageBlock==0) startPage -=pageBlock;
            //현재 페이지 마지막 글번호(페이지별)
        end=start+pageSize-1;
        endPage = startPage + pageBlock-1;
        if(endPage > pageCount) endPage = pageCount;
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("search", search);

        
        if(search=="") {boards= boardDAO.getBoardList(map);}
        else {boards =boardDAO.searchBoardList(map);}
		//5. 자료값으로 정리
		model.addAttribute("boards", boards);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	@Override
	public void board(HttpServletRequest request, Model model) {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		BoardVO board = boardDAO.getBoard(boardNum);
		
		model.addAttribute("board", board);
		
	}
}
