package com.kmk.base;

import java.util.List;
import org.apache.commons.beanutils.BeanUtils;

/**
 * 페이징을 위해 데이터베이스 select한 결과 중 전체 row 카운트를
 * Reflection을 통해 Pagination 객체내 totalRecordCount 변수에 바인딩한다.
 * 
 * @author 
 * @version 1.0
 * <pre>
 * 수정일                수정자         수정내용
 * ---------------------------------------------------------------------
 * </pre>
 */
public class PaginationUtils {
    /**
     * 페이징 서비스를 위해 검색된 전체 로우 카운트를
     * Pagination 객체내 totalRecordCount에 바인딩한다. 
     * 
     * @param pagination 페이징 객체
     * @param object 조회결과 객체
     * @param propertyName 로우 카운트를 가지고있는 변수 명
     */
    public static void bindTotalRecordCount(Pagination pagination, Object object, String propertyName) {
        String value = "0";

        try {
            if (object instanceof List) {
                List<?> list = (List<?>)object;
                if (list != null && list.size() > 0) {
                    value = BeanUtils.getProperty(((List<?>)object).get(0), propertyName);
                }
            } else {
                value = BeanUtils.getProperty(object, propertyName);
            }
            pagination.setTotalRecordCount(Integer.parseInt(value));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}