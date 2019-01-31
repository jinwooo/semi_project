package com.paging;

import com.board.dao.BoardDao;
import com.plan.dao.planDao;

public class Paging {
	
	 private static int pageCount = 5;
	 private int blockStartNum=0;
	 private int blockLastNum=0;
	 private int lastPageNum=0;
	 private int curPageNum;
	 private int pageNo;
	 
	 public Paging(){
		 
	 }
	 
	public static int getPagecount() {
		return pageCount;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getCurPageNum() {
		return curPageNum;
	}

	public void setCurPageNum(int curPageNum) {
		this.curPageNum = curPageNum;
	}
	public int getBlockStartNum() {
		return blockStartNum;
	}

	public void setBlockStartNum(int blockStartNum) {
		this.blockStartNum = blockStartNum;
	}

	public int getBlockLastNum() {
		return blockLastNum;
	}

	public void setBlockLastNum(int blockLastNum) {
		this.blockLastNum = blockLastNum;
	}

	public int getLastPageNum() {
		return lastPageNum;
	}

	public void setLastPageNum(int lastPageNum) {
		this.lastPageNum = lastPageNum;
	}
	 
	// 블럭단위
	public void makeBlock(int curPage) {
		int blockNum=0;
		// blockNum 은 0,1,2,3...
		blockNum=(int)Math.floor((curPage-1)/pageCount)+1;
		this.setPageNo(blockNum);
		blockStartNum=(pageCount*(blockNum-1))+1;
		blockLastNum=blockStartNum+(pageCount-1);
		
	} 
	
	public void makeLastPageNum() {
		BoardDao dao=new BoardDao();
		int total=dao.countAll();
		
		if(total%pageCount==0) {
			lastPageNum=(int)Math.floor(total/pageCount);
		}else {
			lastPageNum=(int)Math.floor(total/pageCount)+1;
		}	
	}
	
	public void makeLastDPageNum() {
		planDao Pdao=new planDao();
		int total=Pdao.countAll();
		
		if(total%pageCount==0) {
			lastPageNum=(int)Math.floor(total/pageCount);
		}else {
			lastPageNum=(int)Math.floor(total/pageCount)+1;
		}	
	}

}






















