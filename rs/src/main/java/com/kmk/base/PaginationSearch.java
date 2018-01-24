package com.kmk.base;

public interface PaginationSearch extends Search {
	/**
	 * @return 페이징 정보
	 */
	Pagination getPagination();							
	
	/**
	 * @param pagination 페이징 정보
	 */
	void setPagination(Pagination pagination);
}