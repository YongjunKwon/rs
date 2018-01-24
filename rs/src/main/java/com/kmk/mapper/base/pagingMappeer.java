package com.kmk.mapper.base;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kmk.domain.common.CommCode;


public class pagingMappeer {
	public String getHeader() {
		String header ="";
		header = "SELECT * FROM ( SELECT ROWNUM rnum, a.* FROM ( ";
		return header;
	}
	public String getFooter() {
		String footer ="";
		footer = " ) a WHERE ROWNUM &lt;=  ";
		
		return footer;
		
//    ) a
//WHERE ROWNUM &lt;= #{pagination.lastRecordIndex} )
//WHERE rnum &gt; #{pagination.firstRecordIndex}
		
	}
}
