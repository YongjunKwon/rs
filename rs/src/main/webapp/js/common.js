// 전역 변수
var errmsg = "";
var errfld = null;

// 필드 검사
function check_field(fld, msg) {
  if ((fld.value = trim(fld.value)) == "")
    error_field(fld, msg);
  else
    clear_field(fld);
  return;
}

// 필드 오류 표시
function error_field(fld, msg) {
  if (msg != "")
    errmsg += msg + "\n";
  if (!errfld) errfld = fld;
  fld.style.background = "#BDDEF7";
}

// 필드를 깨끗하게
function clear_field(fld) {
  fld.style.background = "#FFFFFF";
}

function trim(s) {
  if (s.length < 1) return s;
  var t = "";
  var from_pos = to_pos = 0;

  for (i = 0; i < s.length; i++) {
    if (s.charAt(i) == ' ')
      continue;
    else {
      from_pos = i;
      break;
    }
  }

  for (i = s.length; i >= 0; i--) {
    if (s.charAt(i - 1) == ' ')
      continue;
    else {
      to_pos = i;
      break;
    }
  }

  t = s.substring(from_pos, to_pos);
  //				alert(from_pos + ',' + to_pos + ',' + t+'.');
  return t;
}

// 자바스크립트로 PHP의 number_format 흉내를 냄
// 숫자에 , 를 출력
function number_format(data) {

  var tmp = '';
  var number = '';
  var cutlen = 3;
  var comma = ',';
  var i;

  var sign = data.match(/^[\+\-]/);
  if (sign) {
    data = data.replace(/^[\+\-]/, "");
  }

  len = data.length;
  mod = (len % cutlen);
  k = cutlen - mod;
  for (i = 0; i < data.length; i++) {
    number = number + data.charAt(i);

    if (i < data.length - 1) {
      k++;
      if ((k % cutlen) == 0) {
        number = number + comma;
        k = 0;
      }
    }
  }

  if (sign != null)
    number = sign + number;

  return number;
}

// 새 창
function popup_window(url, winname, opt) {
  window.open(url, winname, opt);
}


// 폼메일 창
function popup_formmail(url) {
  opt = 'scrollbars=yes,width=417,height=385,top=10,left=20';
  popup_window(url, "wformmail", opt);
}

// , 를 없앤다.
function no_comma(data) {
  var tmp = '';
  var comma = ',';
  var i;

  for (i = 0; i < data.length; i++) {
    if (data.charAt(i) != comma)
      tmp += data.charAt(i);
  }
  return tmp;
}

// 삭제 검사 확인
function del(href) {
  if (confirm(aslang[19])) { //한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?
    var iev = -1;
    if (navigator.appName == 'Microsoft Internet Explorer') {
      var ua = navigator.userAgent;
      var re = new pattern("MSIE ([0-9]{1,}[\.0-9]{0,})");
      if (re.exec(ua) != null)
        iev = parseFloat(pattern.$1);
    }

    // IE6 이하에서 한글깨짐 방지
    if (iev != -1 && iev < 7) {
      document.location.href = encodeURI(href);
    } else {
      document.location.href = href;
    }
  }
}

// 쿠키 입력
function set_cookie(name, value, expirehours, domain) {
  var today = new Date();
  today.setTime(today.getTime() + (60 * 60 * 1000 * expirehours));
  document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";";
  if (domain) {
    document.cookie += "domain=" + domain + ";";
  }
}

// 쿠키 얻음
function get_cookie(name) {
  var find_sw = false;
  var start, end;
  var i = 0;

  for (i = 0; i <= document.cookie.length; i++) {
    start = i;
    end = start + name.length;

    if (document.cookie.substring(start, end) == name) {
      find_sw = true
      break
    }
  }

  if (find_sw == true) {
    start = end + 1;
    end = document.cookie.indexOf(";", start);

    if (end < start)
      end = document.cookie.length;

    return unescape(document.cookie.substring(start, end));
  }
  return "";
}

// 쿠키 지움
function delete_cookie(name) {
  var today = new Date();

  today.setTime(today.getTime() - 1);
  var value = get_cookie(name);
  if (value != "")
    document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
}

var last_id = null;

function menu(id) {
  if (id != last_id) {
    if (last_id != null)
      document.getElementById(last_id).style.display = "none";
    document.getElementById(id).style.display = "block";
    last_id = id;
  } else {
    document.getElementById(id).style.display = "none";
    last_id = null;
  }
}

function textarea_decrease(id, row) {
  if (document.getElementById(id).rows - row > 0)
    document.getElementById(id).rows -= row;
}

function textarea_original(id, row) {
  document.getElementById(id).rows = row;
}

function textarea_increase(id, row) {
  document.getElementById(id).rows += row;
}

// 글숫자 검사
function check_byte(content, target) {
  var i = 0;
  var cnt = 0;
  var ch = '';
  var cont = document.getElementById(content).value;

  for (i = 0; i < cont.length; i++) {
    ch = cont.charAt(i);
    if (escape(ch).length > 4) {
      cnt += 2;
    } else {
      cnt += 1;
    }
  }
  // 숫자를 출력
  document.getElementById(target).innerHTML = cnt;

  return cnt;
}

// 브라우저에서 오브젝트의 왼쪽 좌표
function get_left_pos(obj) {
  var parentObj = null;
  var clientObj = obj;
  //var left = obj.offsetLeft + document.body.clientLeft;
  var left = obj.offsetLeft;

  while ((parentObj = clientObj.offsetParent) != null) {
    left = left + parentObj.offsetLeft;
    clientObj = parentObj;
  }

  return left;
}

// 브라우저에서 오브젝트의 상단 좌표
function get_top_pos(obj) {
  var parentObj = null;
  var clientObj = obj;
  //var top = obj.offsetTop + document.body.clientTop;
  var top = obj.offsetTop;

  while ((parentObj = clientObj.offsetParent) != null) {
    top = top + parentObj.offsetTop;
    clientObj = parentObj;
  }

  return top;
}

function flash_movie(src, ids, width, height, wmode) {
  var wh = "";
  if (parseInt(width) && parseInt(height))
    wh = " width='" + width + "' height='" + height + "' ";
  return "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' " + wh + " id=" + ids + "><param name=wmode value=" + wmode + "><param name=movie value=" + src + "><param name=quality value=high><embed src=" + src + " quality=high wmode=" + wmode + " type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash' " + wh + "></embed></object>";
}

function obj_movie(src, ids, width, height, autostart) {
  var wh = "";
  if (parseInt(width) && parseInt(height))
    wh = " width='" + width + "' height='" + height + "' ";
  if (!autostart) autostart = false;
  return "<embed src='" + src + "' " + wh + " autostart='" + autostart + "'></embed>";
}

function doc_write(cont) {
  document.write(cont);
}

var win_password_lost = function(href) {
  window.open(href, "win_password_lost", "left=50, top=50, width=617, height=330, scrollbars=1");
}

$(document).ready(function() {
  $("#login_password_lost, #ol_password_lost").click(function() {
    win_password_lost(this.href);
    return false;
  });
});

/**
 * 포인트 창
 **/
var win_point = function(href) {
  var new_win = window.open(href, 'win_point', 'left=100,top=100,width=600, height=600, scrollbars=1');
  new_win.focus();
}

/**
 * 쪽지 창
 **/
var win_memo = function(href) {
  var new_win = window.open(href, 'win_memo', 'left=100,top=100,width=620,height=500,scrollbars=1');
  new_win.focus();
}

/**
 * 메일 창
 **/
var win_email = function(href) {
  var new_win = window.open(href, 'win_email', 'left=100,top=100,width=600,height=580,scrollbars=0');
  new_win.focus();
}

/**
 * 자기소개 창
 **/
var win_profile = function(href) {
  var new_win = window.open(href, 'win_profile', 'left=100,top=100,width=620,height=510,scrollbars=1');
  new_win.focus();
}

/**
 * 스크랩 창
 **/
var win_scrap = function(href) {
  var new_win = window.open(href, 'win_scrap', 'left=100,top=100,width=600,height=600,scrollbars=1');
  new_win.focus();
}

/**
 * 홈페이지 창
 **/
var win_homepage = function(href) {
  var new_win = window.open(href, 'win_homepage', '');
  new_win.focus();
}

/**
 * 우편번호 창
 **/
var win_zip = function(frm_name, frm_zip, frm_addr1, frm_addr2, frm_addr3, frm_jibeon) {
  if (typeof daum === 'undefined') {
    alert(aslang[20]); //다음 우편번호 postcode.v2.js 파일이 로드되지 않았습니다.
    return false;
  }

  var zip_case = 1; //0이면 레이어, 1이면 페이지에 끼워 넣기, 2이면 새창

  var complete_fn = function(data) {
    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    var fullAddr = ''; // 최종 주소 변수
    var extraAddr = ''; // 조합형 주소 변수

    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
      fullAddr = data.roadAddress;

    } else { // 사용자가 지번 주소를 선택했을 경우(J)
      fullAddr = data.jibunAddress;
    }

    // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
    if (data.userSelectedType === 'R') {
      //법정동명이 있을 경우 추가한다.
      if (data.bname !== '') {
        extraAddr += data.bname;
      }
      // 건물명이 있을 경우 추가한다.
      if (data.buildingName !== '') {
        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
      extraAddr = (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
    }

    // 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
    var of = document[frm_name];

    of [frm_zip].value = data.zonecode;

    of [frm_addr1].value = fullAddr; of [frm_addr3].value = extraAddr;

    if ( of [frm_jibeon] !== undefined) { of [frm_jibeon].value = data.userSelectedType;
    }

    of [frm_addr2].focus();
  };

  switch (zip_case) {
    case 1: //iframe을 이용하여 페이지에 끼워 넣기
      var daum_pape_id = 'daum_juso_page' + frm_zip,
        element_wrap = document.getElementById(daum_pape_id),
        currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
      if (element_wrap == null) {
        element_wrap = document.createElement("div");
        element_wrap.setAttribute("id", daum_pape_id);
        element_wrap.style.cssText = 'display:none;border:1px solid;left:0;width:100%;height:300px;margin:5px 0;position:relative;-webkit-overflow-scrolling:touch;';
        element_wrap.innerHTML = '<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-21px;z-index:1" class="close_daum_juso" alt="접기 버튼">';
        jQuery('form[name="' + frm_name + '"]').find('input[name="' + frm_addr1 + '"]').before(element_wrap);
        jQuery("#" + daum_pape_id).off("click", ".close_daum_juso").on("click", ".close_daum_juso", function(e) {
          e.preventDefault();
          jQuery(this).parent().hide();
        });
      }

      new daum.Postcode({
        oncomplete: function(data) {
          complete_fn(data);
          // iframe을 넣은 element를 안보이게 한다.
          element_wrap.style.display = 'none';
          // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
          document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분.
        // iframe을 넣은 element의 높이값을 조정한다.
        onresize: function(size) {
          element_wrap.style.height = size.height + "px";
        },
        width: '100%',
        height: '100%'
      }).embed(element_wrap);

      // iframe을 넣은 element를 보이게 한다.
      element_wrap.style.display = 'block';
      break;
    case 2: //새창으로 띄우기
      new daum.Postcode({
        oncomplete: function(data) {
          complete_fn(data);
        }
      }).open();
      break;
    default: //iframe을 이용하여 레이어 띄우기
      var rayer_id = 'daum_juso_rayer' + frm_zip,
        element_layer = document.getElementById(rayer_id);
      if (element_layer == null) {
        element_layer = document.createElement("div");
        element_layer.setAttribute("id", rayer_id);
        element_layer.style.cssText = 'display:none;border:5px solid;position:fixed;width:300px;height:460px;left:50%;margin-left:-155px;top:50%;margin-top:-235px;overflow:hidden;-webkit-overflow-scrolling:touch;z-index:10000';
        element_layer.innerHTML = '<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" class="close_daum_juso" alt="닫기 버튼">';
        document.body.appendChild(element_layer);
        jQuery("#" + rayer_id).off("click", ".close_daum_juso").on("click", ".close_daum_juso", function(e) {
          e.preventDefault();
          jQuery(this).parent().hide();
        });
      }

      new daum.Postcode({
        oncomplete: function(data) {
          complete_fn(data);
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
        },
        width: '100%',
        height: '100%'
      }).embed(element_layer);

      // iframe을 넣은 element를 보이게 한다.
      element_layer.style.display = 'block';
  }
}

/**
 * 새로운 비밀번호 분실 창 : 101123
 **/
win_password_lost = function(href) {
  var new_win = window.open(href, 'win_password_lost', 'width=617, height=330, scrollbars=1');
  new_win.focus();
}

/**
 * 설문조사 결과
 **/
var win_poll = function(href) {
  var new_win = window.open(href, 'win_poll', 'width=616, height=500, scrollbars=1');
  new_win.focus();
}

/**
 * 스크린리더 미사용자를 위한 스크립트 - 지운아빠 2013-04-22
 * alt 값만 갖는 그래픽 링크에 마우스오버 시 title 값 부여, 마우스아웃 시 title 값 제거
 **/
$(function() {
  $('a img').mouseover(function() {
    $a_img_title = $(this).attr('alt');
    $(this).attr('title', $a_img_title);
  }).mouseout(function() {
    $(this).attr('title', '');
  });
});

/**
 * 텍스트 리사이즈
 **/
function font_resize(id, rmv_class, add_class) {
  var $el = $("#" + id);

  $el.removeClass(rmv_class).addClass(add_class);

  set_cookie("ck_font_resize_rmv_class", rmv_class, 1, g5_cookie_domain);
  set_cookie("ck_font_resize_add_class", add_class, 1, g5_cookie_domain);
}

/**
 * 댓글 수정 토큰
 **/
function set_comment_token(f) {
  if (typeof f.token === "undefined")
    $(f).prepend('<input type="hidden" name="token" value="">');

  $.ajax({
    url: g5_bbs_url + "/ajax.comment_token.php",
    type: "GET",
    dataType: "json",
    async: false,
    cache: false,
    success: function(data, textStatus) {
      f.token.value = data.token;
    }
  });
}

$(function() {
  $(".win_point").click(function() {
    win_point(this.href);
    return false;
  });

  $(".win_memo").click(function() {
    win_memo(this.href);
    return false;
  });

  $(".win_email").click(function() {
    win_email(this.href);
    return false;
  });

  $(".win_scrap").click(function() {
    win_scrap(this.href);
    return false;
  });

  $(".win_profile").click(function() {
    win_profile(this.href);
    return false;
  });

  $(".win_homepage").click(function() {
    win_homepage(this.href);
    return false;
  });

  $(".win_password_lost").click(function() {
    win_password_lost(this.href);
    return false;
  });

  /*
  $(".win_poll").click(function() {
      win_poll(this.href);
      return false;
  });
  */

  // 사이드뷰
  var sv_hide = false;
  $(".sv_member, .sv_guest").click(function() {
    $(".sv").removeClass("sv_on");
    $(this).closest(".sv_wrap").find(".sv").addClass("sv_on");
  });

  $(".sv, .sv_wrap").hover(
    function() {
      sv_hide = false;
    },
    function() {
      sv_hide = true;
    }
  );

  $(".sv_member, .sv_guest").focusin(function() {
    sv_hide = false;
    $(".sv").removeClass("sv_on");
    $(this).closest(".sv_wrap").find(".sv").addClass("sv_on");
  });

  $(".sv a").focusin(function() {
    sv_hide = false;
  });

  $(".sv a").focusout(function() {
    sv_hide = true;
  });

  // 셀렉트 ul
  var sel_hide = false;
  $('.sel_btn').click(function() {
    $('.sel_ul').removeClass('sel_on');
    $(this).siblings('.sel_ul').addClass('sel_on');
  });

  $(".sel_wrap").hover(
    function() {
      sel_hide = false;
    },
    function() {
      sel_hide = true;
    }
  );

  $('.sel_a').focusin(function() {
    sel_hide = false;
  });

  $('.sel_a').focusout(function() {
    sel_hide = true;
  });

  $(document).click(function() {
    if (sv_hide) { // 사이드뷰 해제
      $(".sv").removeClass("sv_on");
    }
    if (sel_hide) { // 셀렉트 ul 해제
      $('.sel_ul').removeClass('sel_on');
    }
  });

  $(document).focusin(function() {
    if (sv_hide) { // 사이드뷰 해제
      $(".sv").removeClass("sv_on");
    }
    if (sel_hide) { // 셀렉트 ul 해제
      $('.sel_ul').removeClass('sel_on');
    }
  });

  $(document).on("keyup change", "textarea#wr_content[maxlength]", function() {
    var str = $(this).val();
    var mx = parseInt($(this).attr("maxlength"));
    if (str.length > mx) {
      $(this).val(str.substr(0, mx));
      return false;
    }
  });
});

function get_write_token(bo_table) {
  var token = "";

  $.ajax({
    type: "POST",
    url: g5_bbs_url + "/write_token.php",
    data: {
      bo_table: bo_table
    },
    cache: false,
    async: false,
    dataType: "json",
    success: function(data) {
      if (data.error) {
        alert(data.error);
        if (data.url)
          document.location.href = data.url;

        return false;
      }

      token = data.token;
    }
  });

  return token;
}

function set_write_token(f) {
  var bo_table = f.bo_table.value;
  var token = get_write_token(bo_table);

  if (token) {

    var $f = $(f);

    if (typeof f.token === "undefined")
      $f.prepend('<input type="hidden" name="token" value="">');

    $f.find("input[name=token]").val(token);
  }
}

$(function() {
  $(document).on("click", "form[name=fwrite] input:submit, form[name=fwrite] button:submit", function() {
    var f = this.form;
    set_write_token(f);
    var bo_table = f.bo_table.value;
    var token = get_write_token(bo_table);

    if (!token) {
      alert(aslang[41]); //토큰 정보가 올바르지 않습니다.
      return false;
    }

    var $f = $(f);

    if (typeof f.token === "undefined")
      $f.prepend('<input type="hidden" name="token" value="">');

    $f.find("input[name=token]").val(token);

    return true;
  });
});


function objectifyForm(formArray) { //serialize data function

  var returnArray = {};
  for (var i = 0; i < formArray.length; i++) {
    returnArray[formArray[i]['name']] = formArray[i]['value'];
  }
  return returnArray;
}

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}

//특수문자 검증
function pattern(str) {

  //특수문자 검증 start
  var pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi

  if (pattern.test(str)) {
    alert("특수문자는 사용하실수 없습니다.");
    return false;
  } else {
    return true;
  }
  //특수문자 검증 end
}

//쿠키 설정
function setCookie(cookieName, value, exdays) {
  var exdate = new Date();
  exdate.setDate(exdate.getDate() + exdays);
  var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
  document.cookie = cookieName + "=" + cookieValue;
}
//쿠키 삭제
function deleteCookie(cookieName) {
  var expireDate = new Date();
  expireDate.setDate(expireDate.getDate() - 1);
  document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
//쿠키 가져오기
function getCookie(cookieName) {
  cookieName = cookieName + '=';
  var cookieData = document.cookie;
  var start = cookieData.indexOf(cookieName);
  var cookieValue = '';
  if (start != -1) {
    start += cookieName.length;
    var end = cookieData.indexOf(';', start);
    if (end == -1) end = cookieData.length;
    cookieValue = cookieData.substring(start, end);
  }
  return unescape(cookieValue);
}

//특수문자 입력 방지
function checkMark(obj) {
  var val = $(obj).val();
  var pattern = /^[가-힣|a-z|A-Z|0-9|\*]+$/;
  var placeholder = $(obj).attr('label');
  var alertMsg = placeholder ? placeholder + "은(는) 공백 및 특수문자는 입력 할 수 없습니다." :
    "공백 및 특수문자는 입력 할 수 없습니다."
  if (!pattern.test(val)) {
    alert(alertMsg);
    $(obj).val("");
    $(obj).focus();
    return false;
  }
  return true;
}

//공백 입력 방지
function checkSpace(obj) {
  var val = $(obj).val();
  var pattern = /\s/g;
  var placeholder = $(obj).attr('label');
  var alertMsg = placeholder ? placeholder + "은(는) 공백을 입력 할 수 없습니다." :
    "공백을 입력 할 수 없습니다."
  if (!pattern.test(val)) {
    alert(alertMsg);
    $(obj).val("");
    $(obj).focus();
    return false;
  }
  return true;
}

//핸드폰번호 형식 체크 
function checkMobile(obj) {
  var val = $(obj).val();
  var pattern = /(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;

  if (!pattern.test(obj)) {
    alert("전화번호 형식이 맞지 않습니다.");
    $(obj).focus();
    return false;
  }
  return true;
}

function isEmpty(obj) {
  if (trim(obj).length < 1 || obj == "")
    return true;
  else
    return false;
}

$(function() {
  $(".phone-number-check").on('keydown', function(e) {
    // 숫자만 입력받기
    var trans_num = $(this).val().replace(/-/gi, '');
    var k = e.keyCode;

  }).on('blur', function() { // 포커스를 잃었을때 실행합니다.
    if ($(this).val() == '') return;

    // 기존 번호에서 - 를 삭제합니다.
    var trans_num = $(this).val().replace(/-/gi, '');

    // 입력값이 있을때만 실행합니다.
    if (trans_num != null && trans_num != '') {
      // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
      if (trans_num.length == 11 || trans_num.length == 10) {
        // 유효성 체크
        var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
        if (regExp_ctn.test(trans_num)) {
          // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
          trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");
          $(this).val(trans_num);
        } else {
          alert("유효하지 않은 전화번호 입니다.");
          $(this).val("");
          $(this).focus();
        }
      } else {
        alert("유효하지 않은 전화번호 입니다.");
        $(this).val("");
        $(this).focus();
      }
    }
  });

})

//특수문자 검증
function regExp(str) {

  //특수문자 검증 start
  var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi

  if (regExp.test(str)) {
    alert("특수문자는 사용하실수 없습니다.");
    return false;
  } else {
    return true;
  }
  //특수문자 검증 end
}

//rolling-banner
$(function() {
  // 인스턴스 생성
  var rolling1 = new RollingBanner();
});

// 메서드와 프로퍼티를 담을 생성자(클래스)를 생성
function RollingBanner() {
  // 프로퍼티 생성 및 초기화

  // 배너 목록을 담을 프로퍼티 생성
  // (객체 내부에서만 사용할 프로퍼티이기 때문에 private이라는 의미로 언더바(_)를 사용)
  this._$banners = null;
  // 초기 활성화된 인덱스 정보를 담을 프로퍼티 생성
  this._currentIndex = 0;
  this._timerID = -1;

  this._init();
  this._initBannerPos();
  this.startAutoPlay();
}

RollingBanner.prototype = {
  // 요소 초기화
  '_init': function() {
    this._$banners = $('#banner1 img');

  },
  '_initBannerPos': function() {
    // 배너 위치 화면에서 모두 숨기기
    this._$banners.css({
      top: 200
    });
    // 0번째 배너 활성화
    this._$banners.eq(this._currentIndex).css({
      top: 0
    });
  },
  'startAutoPlay': function() {
    var _self = this;

    // 타이머가 두 번이상 실행되지 않도록 조건 처리    
    this._timerID = setInterval(function() {
      _self.nextBanner();
    }, 2000)
  },
  'nextBanner': function() {
    // 현재 인덱스값 구하기
    var outIndex = this._currentIndex;

    // 다음 배너 인덱스값 구하기
    this._currentIndex++;

    // 마지막 배너까지 롤링되면 다시 0번째부터 롤링되도록 인덱스값 설정하기
    if (this._currentIndex >= this._$banners.length) {
      this._currentIndex = 0;
    }

    // 현재 배너 구하기
    var $outBanner = this._$banners.eq(outIndex);

    // 다음 배너 구하기
    var $inBanner = this._$banners.eq(this._currentIndex);

    // 롤링 준비 - 나타날 다음 배너 위치 초기화
    $inBanner.css({
      top: 200,
      opacity: 0
    });

    // 현재 배너 사라지게 하기
    $outBanner.stop().animate({
      top: -200,
      opacity: 0
    }, 600);

    // 다음 배너 나타나게 하기
    $inBanner.stop().animate({
      top: 0,
      opacity: 1
    }, 600);
  }
}


function getMobileCookie(name) {
  var cookies = document.cookie.split(";");
  for (var i = 0; i < cookies.length; i++) {
    if (cookies[i].indexOf("=") == -1) {
      if (name == cookies[i])
        return "";
    } else {
      var crumb = cookies[i].split("=");
      if (name == crumb[0].trim())
        return unescape(crumb[1].trim());
    }
  }
};
var desktopModeTF = getMobileCookie("DesktopMode");
var Scale = getMobileCookie("DesktopModeScale");
var defWidth = 1170;
if (desktopModeTF == "true") {
  document
    .write('<meta name="viewport" content="width=' + defWidth + ', user-scalable=yes, initial-scale=' + Scale + '">');
} else {
  document
    .write('<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">');
}


function desktopMode() {
  if (getMobileCookie("DesktopMode") == "true") {
    setModeCookie(false);
  } else {
    setModeCookie(true);
    window.scrollTo(0, 0);
  }
  location.reload();
  $("body").scrollTop(0);
}


function setModeCookie(switchOn) {
  var now = new Date();
  var time = now.getTime();
  time += 3600 * 1000;
  now.setTime(time);
  document.cookie = 'DesktopMode=' + switchOn + '; expires=' + now.toUTCString();
  if (switchOn) {
    document.cookie = "DesktopModeScale=" + $('html').width() / defWidth + '; expires=' + now.toUTCString();;
  }
}


function checkReplyEmpty(obj) {
  if (trim(obj) == "" || trim(obj).length < 1) {
    alert("댓글을 입력해 주세요.");
    return true;
  } else {
    return false;
  }
}