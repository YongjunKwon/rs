<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <%@include file="../../include/header.jsp"%>

        <body class="hold-transition skin-blue sidebar-mini">
            <div class="wrapper">
                <%@include file="../../include/top.jsp"%>
                    <%@include file="../../include/sideMenu.jsp"%>



                        <!-- Content Wrapper. Contains page content -->
                        <div class="content-wrapper">

                            <!-- Main content -->
                            <section class="content">


                                <!-- Content Header (Page header) -->
                                <form id="frm" name="frm" method="post" class="form-inline" action="/board/sample/saveBoard">
                                    제목<input type="text" name="title" id="title" value="0" /> 조회수
                                    <input type="text" name="cnt" id="cnt" value="" /> 카테고리
                                    <input type="text" name="category" id="category" value="CG0101" /> 지역코드
                                    <input type="text" name="areaCd" id="areaCd" value="AA30" /> 업체명
                                    <input type="text" name="bizNm" id="bizNm" value="" />
                                    </br>
                                    추천수<input type="text" name="recommCnt" id="recommCnt" value="" /> 삭제여부
                                    <input type="text" name="delFlag" id="delFlag" value="N" /> 이미지URL
                                    <input type="text" name="imgUrl" id="imgUrl" value="" />
                                    </br>
                                    내용<textarea name="content" id="content" rows="10" cols="100" style="width:100%"></textarea>
                                    <input type="submit" value="저장" />
                                </form>

                                <!-- Main content -->
                                <!-- /.content-wrapper -->
                            </section>
                            <!-- /.content -->
                        </div>
                        <%@include file="../../include/bottom.jsp"%>
            </div>
            <!-- ./wrapper -->
        </body>


        <script type="text/javascript">
            // Editor Setting
            var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
            $(document).ready(function() {

                // 전송버튼 클릭이벤트
                // $("#savebutton").click(function() {
                //     console.log("111121212");


                // $.validator.setDefaults({
                //     onkeyup: false,
                //     onclick: false,
                //     onfocusout: false,
                //     showErrors: function(errorMap, errorList) {
                //         if (this.numberOfInvalids()) { // 에러가 있을 때만..
                //             alert(errorList[0].message);
                //         }
                //     }
                // });

                $("#frm").validate({
                    rules: {
                        category: {
                            required: true
                        },
                        title: {
                            required: true
                        },
                        content: {
                            required: true
                        }
                    },
                    messages: {
                        category: {
                            required: "카테고리는 필수입력값입니다."
                        },
                        title: {
                            required: "제목은 필수입력값입니다."
                        },
                        content: {
                            required: "내용은 필수입력값입니다."
                        }
                    },
                    submitHandler: function(form) {
                        if (!confirm(aslang[4]))
                            return false;
                        else {
                            form.submit();
                        }
                    }
                });
                // });
            });
        </script>

    </html>