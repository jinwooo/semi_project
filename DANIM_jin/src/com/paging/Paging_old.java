package com.paging;

public class Paging_old {

	private int pageSize; // 게시글 수
	private int firstPageNo;//첫번째 페이지 번호
	private int prevPageNo;// 이전페이지번호
	private int startPageNo;// (페이지기준) 시작페이지
	private int pageNo;// 페이지 번호
	private int endPageNo;// 페이징기준 끝페이지
	private int nextPageNo;// (다음페이지) 번호
	private int finalPageNo; // 마지막 페이지 번호
	private int totalCount; // 게시글 전체 수 
	
	Paging_old(){
		
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	// 페이징 생성
	
	private void makePaging() {
		if(this.totalCount==0) {
			return;
		}
		// 기본값 설정
		if(this.pageNo==0) {
			this.setPageNo(1);
		}
		if(this.pageSize==0) {
			this.setPageSize(4);
		}
		// 총게시글의 마지막 페이지가 있을 페이지 설정
		int finalPage=(totalCount+(pageSize-1))/pageSize;
		
		if(this.pageNo>finalPage) {
			this.setPageNo(finalPage);
		}
		// 현재페이지 유효성 체크 ?? 
		if(this.pageNo<0) {
			this.pageNo=1;
		}
		boolean isNowFirst = (pageNo==1) ?true:false;
		boolean isNowFinal = (pageNo==finalPage) ? true:false;
		
		// 페이지 기준 시작과 끝ㄴ
		int startPage=(pageNo*pageSize)+1;
		int endPage= (startPage+pageSize)-1;
		
		if(endPage>finalPageNo) {
			
		}
		
	}

	
	
	
   

    
    
	
}






















