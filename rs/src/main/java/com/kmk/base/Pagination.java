package com.kmk.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Pagination implements Serializable {
    private static final long serialVersionUID = 1L;

    private int currentPageNo = 1; // 현재 페이지 번호
    private int recordCountPerPage = 10; // 한 페이지당 게시되는 게시물 건 수
    private int pageSize = 10; // 페이지 리스트에 게시되는 페이지 건수
    private int totalRecordCount; // 전체 게시물 건 수
    private List<Integer> pageNumbering = new ArrayList<Integer>();

    public Pagination() {
        calculatePageNumbering();
    }

    public Pagination(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
    }

    public int getRecordCountPerPage() {
        return recordCountPerPage;
    }

    public void setRecordCountPerPage(int recordCountPerPage) {
        this.recordCountPerPage = recordCountPerPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPageNo() {
        return currentPageNo;
    }

    public void setCurrentPageNo(int currentPageNo) {
        this.currentPageNo = currentPageNo;
        calculatePageNumbering();
    }

    public void setTotalRecordCount(int totalRecordCount) {
        this.totalRecordCount = totalRecordCount;
    }

    public int getTotalRecordCount() {
        return totalRecordCount;
    }

    /**
     * @return 페이지 개수
     */
    public int getTotalPageCount() {
        return (getTotalRecordCount() - 1) / getRecordCountPerPage() + 1;
    }

    public int getFirstPageNo() {
        return 1;
    }

    public int getLastPageNo() {
        return getTotalPageCount();
    }

    /**
     * @return 페이지 리스트의 첫 페이지 번호
     */
    public int getFirstPageNoOnPageList() {
        return ((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
    }

    /**
     * @return 페이지 리스트의 마지막 페이지 번호
     */
    public int getLastPageNoOnPageList() {
        int lastPageNoOnPageList = (getFirstPageNoOnPageList() + getPageSize()) - 1;
        return lastPageNoOnPageList > getTotalPageCount() ? getTotalPageCount() : lastPageNoOnPageList;
    }

    /**
     * @return 페이징 SQL의 조건절에 사용되는 시작 rownum
     */
    public int getFirstRecordIndex() {
        return (getCurrentPageNo() - 1) * getRecordCountPerPage();
    }

    /**
     * @return 페이징 SQL의 조건절에 사용되는 마지막 rownum
     */
    public int getLastRecordIndex() {
        return getCurrentPageNo() * getRecordCountPerPage();
    }

    public int getPageNumbering(int index) {
        return pageNumbering.get(index);
    }

    private void calculatePageNumbering() {
        int numbering = (getCurrentPageNo() - 1) * getRecordCountPerPage() + 1;
        pageNumbering.clear();

        for (int i = 0; i < getPageSize(); i++) {
            pageNumbering.add(numbering++);
        }
    }
}

