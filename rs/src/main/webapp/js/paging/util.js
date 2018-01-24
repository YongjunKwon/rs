/**
 * 페이징 처리
 * ex : page.set(data, target-div-id, page-click-function)
 * data의 페이지 인데스는 0부터 시작, 화면의 페이지번호는 1부터 시작.
 * 페이지번호 클릭시 리턴되는 값은 data용 페이지인덱스
 */
//RS.util = util;
var util = {};

util.page = {
    init: function() {
        this.sz = 10;
        this.currpage = 0;
        this.datamap = new Map();
    },
    sz: 10,
    currpage: 0,
    datamap: null,
    /*
     * data		페이징처리를 위한 데이타
     * targetid 페이징타겟 div 아이디
     * click_fn 페이징번호 클릭시 콜백함수
     */
    set: function(data, targetid, click_fn) {

        var _tot = data.get("TOTPAGE");
        var _cur = data.get("CURRPAGE");

        var _page_sz = Math.floor(parseInt(_tot) / 10);
        var _curr_sz = Math.floor(parseInt(_cur) / 10);

        var stnum = (_curr_sz < 1) ? 1 : parseInt((_curr_sz * 10)) + 1;
        var ennum = (_page_sz == _curr_sz) ? parseInt(_tot) + 1 : (eval(stnum) + 10);

        var tmpstr = "<ul class=\"pagination pagination-sm no-margin\">";
        tmpstr += "<li id=\"prev_move_page\"><a href=\"#\">&laquo;</a></li>";

        //페이징 번호처리
        for (var i = eval(stnum); i <= ennum - 1; i++) {
            //var j=eval(i-1);
            var j = eval(i);

            if (j == _cur) {
                tmpstr += "<li class=\"page-item active\"><a href=\"#\">" + i + "</a></li>";

            } else {
                tmpstr += "<li><a href='javascript:" + click_fn + "(" + j + ")'>" + i + "</a></li>";
            }
        }

        tmpstr += "<li id=\"next_move_page\"><a href=\"#\">&raquo;</a></li>";

        //페이징 번호 랜더링
        $('#' + targetid).html(tmpstr);

        //페이징 이동버튼 설정처리 시작
        var arrow_prev = $('#prev_move_page'); //이전10개목록으로 이동
        var arrow_next = $('#next_move_page'); //다음10개목록으로 이동

        //전체페이지수가 10개 미만은 화살표 숨김처리
        if (_page_sz == 0) {
            //arrow_first.hide();
            //arrow_prev.hide();
            //arrow_next.hide();
            //arrow_last.hide();
        } else {

            if (_curr_sz == _page_sz) {
                //arrow_next.hide();
                //arrow_last.hide();
            } else {
                //arrow_next.show();
                //arrow_last.show();
            }

            if (_curr_sz == 0) {
                //arrow_first.hide();
                //arrow_prev.hide();
            } else {
                //arrow_first.show();
                //arrow_prev.show();
            }

            //할당된 이벤트 모두삭제
            //arrow_first.unbind("click");
            arrow_prev.unbind("click");
            arrow_next.unbind("click");
            //arrow_last.unbind("click");

            /*arrow_first.click(function(){
            	eval(click_fn)(0);
            });*/

            arrow_prev.click(function() {
                console.log("arrow_prev ------------ " + stnum);
                if (eval(stnum) - 10 >= 0) {
                    eval(click_fn)(eval(stnum) - 10);
                }
            });

            arrow_next.click(function() {
                console.log(" arrow_next ------------ " + stnum);
                console.log(" arrow_next _tot------------ " + _tot);
                if (eval(stnum) + 10 <= _tot) {
                    eval(click_fn)(eval(stnum) + 10);
                }
            });

            /*arrow_last.click(function(){
            	eval(click_fn)(_tot);
            });*/
        }
    }
};
//화면로딩시 초기화
util.page.init();