package spring.project.bookshop4.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
public class HostServiceImpl implements HostService{

	@Autowired
	OrderDAO orderDAO;
	@Autowired
	BookDAO bookDAO;
	@Autowired
	GuestDAO guestDAO;
	@Autowired
	BoardDAO boardDAO;
	@Autowired
	ExtraDAO extraDAO;
	
	@Override
	public void result(HttpServletRequest request, Model model) {
		//날짜
		SimpleDateFormat ymd = new SimpleDateFormat("YY/MM/dd");
		SimpleDateFormat ym = new SimpleDateFormat("YY/MM");
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -10);//10개월전
		
		ArrayList<String> month_10 = new ArrayList<String>();
		for(int i=0; i<10; i++) {
			cal.add(Calendar.MONTH, 1);
			month_10.add(ym.format(cal.getTime()));
		}
		
		int resultMonthly=orderDAO.resultMonthly();
		int resultYearly = orderDAO.resultYearly();
		int resultMonthlyCnt= orderDAO.resultMonthlyCnt();
		int resultYearlyCnt = orderDAO.resultYearlyCnt();
		ArrayList<Integer> graphMonthly = new ArrayList<Integer>();
		for(String month : month_10) {
			graphMonthly.add(orderDAO.graphMonthly(month)) ;
		}
		
		JSONArray jsonArray = new JSONArray();
		JSONArray colNameArray = new JSONArray(); // 컬 타이틀 설정
		colNameArray.add("month");
		colNameArray.add("매출액");
		jsonArray.add(colNameArray);
		
		for(int i=0; i<month_10.size(); i++) {
			JSONArray rowArray = new JSONArray();
			rowArray.add(month_10.get(i));
			rowArray.add(graphMonthly.get(i));	
			jsonArray.add(rowArray);
		}
		
		model.addAttribute("resultMonthly", resultMonthly);
		model.addAttribute("resultYearly", resultYearly);
		model.addAttribute("resultMonthlyCnt", resultMonthlyCnt);
		model.addAttribute("resultYearlyCnt", resultYearlyCnt);
		model.addAttribute("graphMonthly",graphMonthly);
		model.addAttribute("graphMonths", month_10);
		model.addAttribute("jsonArray",jsonArray);
	}

	@Override
	public void stockList(HttpServletRequest request, Model model) {
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
        List<BookVO> books=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
		if(search=="") {cnt = bookDAO.bookListCnt();}
		else {cnt = bookDAO.searchStockCnt(search);}
		
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
        if(search=="") {books= bookDAO.getList(map);}
        else {books =bookDAO.searchStockList(map);}
		
        //5. 자료값으로 정리
		model.addAttribute("books", books);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    model.addAttribute("pageSize",pageSize);
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	@Transactional(rollbackFor=Exception.class)
	@Override
	public void addStock(MultipartHttpServletRequest req, Model model){
		
		int insertCnt = 0;
			
        String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");  // 업로드할 파일이 위치하게될 실제 경로
        String realDir = "D:\\Dev65\\Workspace\\spring_project4\\src\\main\\webapp\\WEB-INF\\views\\include\\image\\";
        
        MultipartFile file = req.getFile("fileUpload");
        
        String fileType = file.getContentType().split("/")[0]; //image
        String formatType = file.getContentType().split("/")[1];//png
        
		BookVO book = new BookVO();
		try {
			String bookImage="";
			String ISBN = req.getParameter("ISBN");
			if(req.getFile("fileUpload") != null) {
				bookImage= ISBN + '.' + formatType;
			}
			String bookName = req.getParameter("bookName");
			String bookWriter = req.getParameter("bookWriter");
			String bookPublisher = req.getParameter("bookPublisher");
			String bookClass= req.getParameter("bookClass");
			
			int bookPrice = Integer.parseInt(req.getParameter("bookPrice"));
			int sale= Integer.parseInt(req.getParameter("sale"));
			int page = Integer.parseInt(req.getParameter("page"));
			int bookCount = Integer.parseInt(req.getParameter("bookCount"));
			
			//Timestamp publishDate =new Timestamp(System.currentTimeMillis());
			Timestamp publishDate =java.sql.Timestamp.valueOf(req.getParameter("publishDate")+" 00:00:00");
			int vision = 1;
			
			book.setISBN(ISBN);
			book.setBookName(bookName);
			book.setBookWriter(bookWriter);
			book.setBookPublisher(bookPublisher);
			book.setBookClass(bookClass);
			book.setBookImage(bookImage);
			book.setBookPrice(bookPrice);
			book.setSale(sale);
			book.setPage(page);
			book.setBookCount(bookCount);
			book.setPublishDate(publishDate);
			book.setVision(vision);
			
			insertCnt = bookDAO.add(book);
			if(insertCnt!=0) {
				if(req.getFile("fileUpload") != null) {
					file.transferTo(new File(saveDir + bookImage));
					FileInputStream fis = new FileInputStream(saveDir + bookImage);
					System.out.println("fis");
					FileOutputStream fos = new FileOutputStream(realDir + bookImage);
					System.out.println("fos");
					int data = 0;
					// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
					while((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();
				}
			}
			
		}catch(Exception e) {
			
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println(e.getMessage());
			System.out.println("파일 저장 에러");
		}
		req.setAttribute("updateCnt",insertCnt);
	}
	
	@Override
	public void editStock(HttpServletRequest request, Model model) {
		//자료값 가져오기
		String ISBN = request.getParameter("ISBN");
		//자료 가져오기
		BookVO book = bookDAO.searchStockBook(ISBN);
		//저장하기
		model.addAttribute("ISBN", ISBN);
		model.addAttribute("book",book);
	}
	
	@Override
	public void editStockPro(MultipartHttpServletRequest req, Model model) {
		int updateCnt = 0;
		
        String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/");  // 업로드할 파일이 위치하게될 실제 경로
        String realDir = "D:\\Dev65\\Workspace\\spring_project4\\src\\main\\webapp\\WEB-INF\\views\\include\\image\\";
        
        String originFile= req.getParameter("originImg");
        MultipartFile file = req.getFile("fileUpload");
        
        String fileType = file.getContentType().split("/")[0]; //image
        String formatType = file.getContentType().split("/")[1];//png
        
		BookVO book = new BookVO();
		try {
			String bookImage = originFile;
			System.out.println("originFile : "+ bookImage);
			
			String ISBN = req.getParameter("ISBN");
			if(req.getFile("fileUpload") != null) {
				bookImage= ISBN + '.' + formatType;
			}		
			
			
			String bookName = req.getParameter("bookName");
			String bookWriter = req.getParameter("bookWriter");
			String bookPublisher = req.getParameter("bookPublisher");
			String bookClass= req.getParameter("bookClass");
			
			int bookPrice = Integer.parseInt(req.getParameter("bookPrice"));
			int sale= Integer.parseInt(req.getParameter("sale"));
			int page = Integer.parseInt(req.getParameter("page"));
			int bookCount = Integer.parseInt(req.getParameter("bookCount"));
			
			//Timestamp publishDate =new Timestamp(System.currentTimeMillis());
			Timestamp publishDate =java.sql.Timestamp.valueOf(req.getParameter("publishDate")+" 00:00:00");
			int vision = 1;
			
			book.setISBN(ISBN);
			book.setBookName(bookName);
			book.setBookWriter(bookWriter);
			book.setBookPublisher(bookPublisher);
			book.setBookClass(bookClass);
			book.setBookImage(bookImage);
			book.setBookPrice(bookPrice);
			book.setSale(sale);
			book.setPage(page);
			book.setBookCount(bookCount);
			book.setPublishDate(publishDate);
			book.setVision(vision);
			
			updateCnt = bookDAO.updateStock(book);
			if(updateCnt!=0) {
				if(req.getFile("fileUpload") != null) {
					File deleteFile = new File(realDir + originFile);
					 if(deleteFile.exists()) {
			            // 파일을 삭제합니다.
			            deleteFile.delete(); 
			            System.out.println("파일을 삭제하였습니다.");
			        } else {
			            System.out.println("파일이 존재하지 않습니다.");
			        }
					file.transferTo(new File(saveDir + bookImage));
					FileInputStream fis = new FileInputStream(saveDir + bookImage);
					System.out.println("fis");
					FileOutputStream fos = new FileOutputStream(realDir + bookImage);
					System.out.println("fos");
					int data = 0;
					// 논리적인 경로에 저장된 임시 파일을 물리적인 경로로 복사함
					while((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();
				}
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("파일 저장 에러");
		}
		req.setAttribute("updateCnt",updateCnt);
	}

	@Override
	public void deletePro(HttpServletRequest request, Model model) {
		String ISBN = request.getParameter("ISBN");
		
		int deleteCnt = bookDAO.deleteBook(ISBN);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void orderList(HttpServletRequest request, Model model) {
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
        List<OrderVO> orders=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
		if(search=="") {cnt = orderDAO.commonOrderCnt("1");}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			map.put("status", "1");
			cnt = orderDAO.commonSearchOrderCnt(map);
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
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        String[] status =  new String[]{"1"};
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", status);
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
        if(search=="") {orders= orderDAO.commonGetOrderList(map);}
        else {orders =orderDAO.commonSearchOrderList(map);}
		
        //5. 자료값으로 정리
		model.addAttribute("orders", orders);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    //model.addAttribute("pageSize", pageSize);
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	@Override
	public void orderCancel(HttpServletRequest request, Model model) {
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		String status = "7";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNum", orderNum);
		map.put("status", status);

		int deleteCnt = orderDAO.commonOrderUpdate(map);
		
		model.addAttribute("deleteCnt",deleteCnt);
	}

	@Override
	public void manyOrderCancel(HttpServletRequest request, Model model) {
		String[] strOrderNum = request.getParameterValues("select");
		int cancelCnt = strOrderNum.length;
		String status="7";
		int deleteCnts = 0;
		
		ArrayList<Integer> orderNums = new ArrayList<Integer>();
		for(String str : strOrderNum) {
			orderNums.add(Integer.parseInt(str));
		}
		
		
		for(int orderNum : orderNums) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("orderNum", orderNum);
			map.put("status", status);
			
			deleteCnts+= orderDAO.commonOrderUpdate(map);
		}
		
		int deleteCnt=0;//정말 다 지워졌는지 확인용
		if(deleteCnts == cancelCnt) {
			deleteCnt=1;
		}
		
		model.addAttribute("deleteCnt",deleteCnt);
		
	}

	@Override
	public void deliverPro(HttpServletRequest request, Model model) {
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		String deliver = request.getParameter("deliverNum");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orderNum", orderNum);
		map.put("deliver", deliver);
		
		int updateCnt = orderDAO.deliverPro(map);
		
		model.addAttribute("updateCnt",updateCnt);
	}

	@Override
	public void deliverList(HttpServletRequest request, Model model) {
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
        List<OrderVO> orders=null;
        
        //4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        //5. dao 인스턴스 
		if(search=="") {cnt = orderDAO.commonOrderCnt("2");}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("search", search);
			map.put("status", "2");

			cnt = orderDAO.commonSearchOrderCnt(map);
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
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        String[] status =  new String[]{"2"};
        
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		map.put("status", status);
		
        if(search=="") {orders= orderDAO.commonGetOrderList(map);}
        else {orders =orderDAO.commonSearchOrderList(map);}
		//5. 자료값으로 정리
		model.addAttribute("orders", orders);
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
	public void changeOrdered(HttpServletRequest request, Model model) {
		int orderNum = Integer.parseInt(request.getParameter("orderNum"));
		String status="3";
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("orderNum", orderNum);
		map.put("status", status);
		
		int orderedCnt = orderDAO.changeOrdered(map);
		
		model.addAttribute("orderedCnt", orderedCnt);
	}

	@Override
	public void orderedList(HttpServletRequest request, Model model) {
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
        List<OrderVO> orders=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        String[] statuses = new String[]{"3", "4", "6"};
        	//5. dao 인스턴스 
		if(search=="") {
			cnt=0;
			for(String status : statuses) {
				cnt+= orderDAO.commonOrderCnt(status);}
			}
		else {
			cnt =0;

			for(String status : statuses) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("status", status);
				map.put("search", search);
				
				cnt+= orderDAO.commonSearchOrderCnt(map);
			}
			
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
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("start", start);
    	map.put("end", end);
    	map.put("status", statuses);
    	map.put("search", search);
    	System.out.println(map.toString());
    	
        if(search=="") {
        	orders= orderDAO.commonGetOrderList(map);
        }
        else {
        	
        	orders =orderDAO.commonSearchOrderList(map);}
		//5. 자료값으로 정리
		model.addAttribute("orders", orders);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    //model.addAttribute("pageSize",pageSize);
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	@Override
	public void refundList(HttpServletRequest request, Model model) {
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
        List<OrderVO> orders=null;
        String[] statuses = new String[]{"4", "5", "6"};
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
        
        
		if(search=="") {
			cnt=0;
			for(String status : statuses) {
				cnt+= orderDAO.commonOrderCnt(status);}
			}
		else {cnt=0;
			for(String status : statuses) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("status", status);
				map.put("search", search);
				
				cnt+= orderDAO.commonSearchOrderCnt(map);
			}
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
        
        System.out.println("start : "+start);
        System.out.println("end : "+end);
        
        Map<String, Object> map = new HashMap<String, Object>();
    	map.put("start", start);
    	map.put("end", end);
    	map.put("status", statuses);
    	map.put("search", search);
        
        if(search=="") {orders= orderDAO.commonGetOrderList(map);}
        else {orders =orderDAO.commonSearchOrderList(map);}
		//5. 자료값으로 정리
		model.addAttribute("orders", orders);
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
	public void guestList(HttpServletRequest request, Model model) {
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
        List<GuestVO> guests=null;
        
        	//4. 변수 받아오기 및 변수 설정
        if(request.getParameter("pageSize")!=null)pageSize=Integer.parseInt(request.getParameter("pageSize"));
       
        if(request.getParameter("currentPage")!=null)currentPage=Integer.parseInt(request.getParameter("currentPage"));
        else {currentPage=1;}
        if(request.getParameter("search")!=null)search=request.getParameter("search");
        System.out.println("CurrentPage : " + currentPage);
        System.out.println("Search :"+search);
        
        	//5. dao 인스턴스 
		if(search=="") {cnt = guestDAO.guestListCnt();}
		else {cnt = guestDAO.searchGuestCnt(search);}
		
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
        
        if(search=="") {guests= guestDAO.getGuestList(map);}
        else {guests =guestDAO.searchGuestList(map);}
		//5. 자료값으로 정리
		model.addAttribute("guests", guests);
		model.addAttribute("cnt", cnt);    //글갯수
	    model.addAttribute("currentPage", currentPage);//페이지 번호
	    //model.addAttribute("pageSize",pageSize);
        if(cnt > 0 ) {
            model.addAttribute("startPage",startPage);
            model.addAttribute("endPage",endPage);
            model.addAttribute("pageBlock",pageBlock);
            model.addAttribute("pageCount",pageCount);
        }
	}

	@Override
	public void guestEdit(HttpServletRequest request, Model model) {
		//자료값 가져오기
		String id = request.getParameter("id");
		//자료 가져오기
		GuestVO guest = guestDAO.searchGuest(id);
		//저장하기
		model.addAttribute("id", id);
		model.addAttribute("guest",guest);
	}

	@Override
	public void guestEditPro(HttpServletRequest request, Model model) {
		int updateCnt = 0;
		
		GuestVO guest = new GuestVO();
		try {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String jumin = request.getParameter("jumin1")+request.getParameter("jumin2");
			Timestamp birth = java.sql.Timestamp.valueOf(request.getParameter("birth")+" 00:00:00");
			String solar = request.getParameter("solar");
			String gender= request.getParameter("gender");
			String email= request.getParameter("email1")+"@"+request.getParameter("email2");
			String emailCheck =request.getParameter("emailCheck");
			String phone = request.getParameter("phone1")+"-"+ request.getParameter("phone2")+"-"+ request.getParameter("phone3");
			String smsCheck = request.getParameter("smsCheck");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String address3 = request.getParameter("address3");
			
			guest.setId(id);
			guest.setPassword(password);
			guest.setName(name);
			guest.setJumin(jumin);
			guest.setBirth(birth);
			guest.setSolar(solar);
			guest.setGender(gender);
			guest.setEmail(email);
			guest.setEmailCheck(emailCheck);
			guest.setPhone(phone);
			guest.setSmsCheck(smsCheck);
			guest.setAddress1(address1);
			guest.setAddress2(address2);
			guest.setAddress3(address3);
			
			updateCnt = guestDAO.updateGuset(guest);
		}catch(Exception e) {
			System.out.println("guestEditPro service 에러");
		}
		model.addAttribute("updateCnt",updateCnt);
	}

	@Override
	public void guestDeletePro(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		
		int deleteCnt = guestDAO.guestDeletePro(id);
		
		System.out.println("deleteCnt:"+deleteCnt);
		model.addAttribute("deleteCnt", deleteCnt);
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

	@Override
	public void boardUpdate(HttpServletRequest request, Model model) {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String re_content = request.getParameter("re_content");
		int updateCnt = 0;
		String re="";
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("re_content", re_content);
		
		updateCnt=boardDAO.reUpdate(map);
		if(updateCnt==1) {
			re = re_content;
		}
		
		
		model.addAttribute("re",re);
	}

	@Override
	public void boardReDel(HttpServletRequest request, Model model) {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		int deleteCnt = boardDAO.boardReDel(boardNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("re", "F");
		
		if(deleteCnt==1) {boardDAO.updateRe(map);}
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void boardDel(HttpServletRequest request, Model model) {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		int deleteCnt = boardDAO.boardDel(boardNum);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void boardRe(HttpServletRequest request, Model model) {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String re_content = request.getParameter("re_content");
		
		System.out.println("boardNum" + boardNum);
		System.out.println("re_content : " + re_content);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("re_content", re_content);
		map.put("re", "T");
		int makeReCnt=boardDAO.makeRe(map);
		boardDAO.updateRe(map);
		
		//model.addAttribute("makeReCnt",makeReCnt);
		request.setAttribute("makeReCnt",makeReCnt);
	}

	@Override
	public int deleteMessage(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		return extraDAO.deleteMessage(num);
	}

	@Override
	public int deleteMessages(HttpServletRequest request, Model model) {
		String[] nums = request.getParameter("nums").split("-");
		int deleteCnt = 0;
		
		for(String strNum : nums) {
			deleteCnt += extraDAO.deleteMessage(Integer.parseInt(strNum));
		}
		return deleteCnt;
	}
}
