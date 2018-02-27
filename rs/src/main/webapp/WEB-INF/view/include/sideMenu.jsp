<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <c:if test="${loginUser.user_id eq '' || loginUser.user_id eq null}">
        <!-- 로그인//시작 -->
        <form id="login" name="login" method="POST" action="login" autocomplete="off" class="form">
          <div class="media no-margin en">
            <div class="sidebar-form pull-right" style="width:60px; margin:10px 10px 0px 0px; padding-left: 0px;">
              <button type="submit" class="btn btn-flat btn-block" tabindex="43" style="height:81px;">
                <i class="fa fa-power-off fa-2x"></i>
              </button>
            </div>
            <div class="media-body">
              <div class="sidebar-form" style="margin:10px 5px 0px 10px;">
                <div class="input-group">
                  <input type="email" name="user_id" id="user_id" class="form-control sidebar-input" placeholder="Email" tabindex="41">
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-flat sidebar-input-text text-white pull-right" style="height: 34px; width:35px;">
                      <i class="fa fa-user"></i>
                    </button>
                  </span>
                </div>
              </div>
              <div class="sidebar-form" style="margin:10px 5px 0px 10px;">
                <div class="input-group">
                  <input type="password" name="pwd" id="pwd" class="form-control sidebar-input text-white" placeholder="Password" tabindex="41">
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-flat sidebar-input-text" style="height: 34px; width:35px;">
                      <i class="fa fa-lock"></i>
                    </button>
                  </span>
                </div>
              </div>
            </div>
          </div>
          <ul class="sidebar-list" style="padding:0px; margin:10px 10px 5px; letter-spacing:-1px;">
            <li class="sidebar-text">
              <label class="cursor pull-left">
                <!-- TODO: 자동접속 추가 -->
                <!-- <input type="checkbox" name="auto_login" value="1" id="remember_me" class="remember-me"> &nbsp;자동접속 -->
              </label>
              <span class="pull-right">
                <a href="/register">
                  <span class="sidebar-text">회원가입</span>
                </a>
                &nbsp;|&nbsp;
                <a href="/findPassword" class="win_password_lost">
                  <span class="sidebar-text">비번찾기</span>
                </a>
              </span>
              <div class="clearfix"></div>
            </li>
          </ul>
        </form>
      </c:if>
      <!-- 로그인//종료 -->

      <!-- 로그인성공시 //시작 -->
      <c:if test="${loginUser.user_id != '' and loginUser.user_id ne null}">
        <div class="user-panel">
          <div class="pull-left image user_picture" data-toggle="tooltip" title="사용자 정보 수정">
            <img src="/AdminLTE-2.3.11/dist/img/welcome_category_icon_privacy.png" class="img-circle cursor" alt="">
          </div>
          <div class="pull-left info">
            <p>${loginUser.nick_nm}</p>
            <span class="font-12 ko-11">
              <a></a>
              <a href="/logout" data-toggle="tooltip" title="로그아웃">
                <i class="fa fa-circle text-primary"></i> &nbsp;로그아웃
              </a>
            </span>
          </div>

          <div class="clearfix"></div>

          <!-- <div class="progress progress-striped xs cursor" style="margin:10px 0px 0px;" data-original-title="레벨업까지 800점 남았습니다." data-toggle="tooltip"
            data-placement="bottom" data-html="true">
            <div class="progress-bar progress-bar-blue" style="width: 20%;"></div>
          </div> -->

          <ul class="sidebar-list no-margin" style="padding:10px 5px 0px;">
            <li>
              <span class="pull-right">
                <!-- Exp 200 (20%) -->
              </span>
              <!-- 레벨 1 -->
            </li>
            <!-- <li>
              <a href="#" target="_blank" class="win_point">
                <span class="pull-right">
                  1,200 점
                </span>
                MP
              </a>
            </li>
            <li class="msgLabel" style="display:none;">
              <a class="cursor" data-toggle="control-sidebar" onclick="miso_msg();">
                <span class="pull-right">
                  <b class="orangered msgCount">0</b> 개
                </span>
                알림
              </a>
            </li> -->
          </ul>
        </div>
      </c:if>
      <!-- 로그인성공시 //종료 -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">땡땡에 오신걸환영합니다.</li>
        <!-- Optionally, you can add icons to the links -->

        <!-- 업소정보 //시작-->
        <li id="side_bizInfo" class="treeview">
          <a href="#">
            <i class="fa fa-share"></i>
            <span>업소정보</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="menu_op">
              <a href="/board/bizBoardList?categorynm=op">
                <i class="fa fa-circle-o"></i>오피스텔</a>
            </li>
            <li>
              <li id="menu_gunma">
                <a href="/board/bizBoardList?categorynm=gunma">
                  <i class="fa fa-circle-o"></i>건마</a>
              </li>
              <li id="menu_anma">
                <a href="/board/bizBoardList?categorynm=anma">
                  <i class="fa fa-circle-o"></i>안마방</a>
              </li>
              <li id="menu_play">
                <a href="/board/bizBoardList?categorynm=play">
                  <i class="fa fa-circle-o"></i>유흥주점</a>
              </li>
              <li id="menu_tel">
                <a href="/board/bizBoardList?categorynm=tel">
                  <i class="fa fa-circle-o"></i>휴게텔</a>
              </li>
              <li id="menu_lib">
                <a href="/board/bizBoardList?categorynm=lib">
                  <i class="fa fa-circle-o"></i>립카페/핸플/키스</a>
              </li>
          </ul>
          </li>
          <!-- 업소정보 //끝-->

          <!-- 업소후기 //시작-->
          <li id="side_bizComment" class="treeview">
            <a href="#">
              <i class="fa fa-share"></i>
              <span>업소후기</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li id="menu_oph">
                <a href="/board/bizBoardList?categorynm=oph">
                  <i class="fa fa-circle-o"></i>오피스텔 후기</a>
              </li>
              <li>
                <li id="menu_gunmah">
                  <a href="/board/bizBoardList?categorynm=gunmah">
                    <i class="fa fa-circle-o"></i>건마 후기</a>
                </li>
                <li id="menu_anmah">
                  <a href="/board/bizBoardList?categorynm=anmah">
                    <i class="fa fa-circle-o"></i>안마방 후기</a>
                </li>
                <li id="menu_playh">
                  <a href="/board/bizBoardList?categorynm=playh">
                    <i class="fa fa-circle-o"></i>유흥주점 후기</a>
                </li>
                <li id="menu_libh">
                  <a href="/board/bizBoardList?categorynm=libh">
                    <i class="fa fa-circle-o"></i>텔/립/핸플/키스 후기</a>
                </li>
            </ul>
            </li>
            <!-- 업소후기 //끝-->

            <!-- 업소언니정보 //시작-->
            <!-- 언니들 정보 올리는 게시판 -->
            <li id="side_bizWm" class="treeview">
              <a href="/board/bizBoardList?categorynm=bizwm">
                <i class="fa fa-share"></i>
                <span>업소언니정보</span>
              </a>
            </li>
            <!-- 업소언니정보 //끝-->

            <!-- 파트너공유 //시작-->
            <li id="side_partner" class="treeview">
              <a href="/board/bizBoardList?categorynm=partner">
                <i class="fa fa-share"></i>
                <span>파트너공유</span>
              </a>
            </li>
            <!-- 파트너정보 //끝-->

            <!-- 파트너공유 //시작-->
            <li id="side_bizQna" class="treeview">
              <a href="/board/bizBoardList?categorynm=bizqna">
                <i class="fa fa-share"></i>
                <span>업체문의게시판</span>
              </a>
            </li>
            <!-- 파트너정보 //끝-->

      </ul>

      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>


  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active">
        <a href="#control-sidebar-home-tab" data-toggle="tab">
          <i class="fa fa-home"></i>
        </a>
      </li>
      <li>
        <a href="#control-sidebar-settings-tab" data-toggle="tab">
          <i class="fa fa-gears"></i>
        </a>
      </li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript::;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript::;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                  <span class="label label-danger pull-right">70%</span>
                </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

  <!-- Modal -->
  <div class="modal fade" id="pictureModal" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="myModalLabel">사용자 정보 수정</h4>
        </div>
        <div class="modal-body">
          <form id="registerForm" action="/register/set" method="post">

            <div class="form-group has-feedback">
              <input type="email" id="m_user_id" name="user_id" value="${loginUser.user_id}" maxlength="50" class="form-control" disabled="true">
            </div>

            <div class="form-group has-feedback">
              <div class="input-group">
                <input type="text" class="form-control" id="m_nick_nm" value="${loginUser.nick_nm}" name="nick_nm" maxlength="10" placeholder="닉네임">
                <div class="input-group-btn">
                  <button type="button" id='checkNickNm' class="btn btn-primary">중복확인</button>
                </div>
              </div>
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" id="m_before_pwd" name="before_pwd" placeholder="현재 비밀번호" />
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" id="m_pwd" name="pwd" placeholder="변경 비밀번호" />
              <font name="check2" size="2" color="red"></font>
            </div>

            <div class="form-group has-feedback">
              <input type="password" class="form-control" id="m_pwd_again" name="pwd_again" placeholder="비밀번호 확인" />
              <font name="check" size="2" color="red"></font>
            </div>

          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
          <button type="button" id='setUserInfo' class="btn btn-primary">저장</button>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    $(document).ready(function () {});

    /**
     * sidemenu actiove
     *
     * @author 
     * @version 1.0, 2018.2.5 소스 수정
     */
    $('.treeview').removeClass('active');
    if ("${board.categorynm}" == "op") {
      $('#menu_op').parents('li').addClass('active');
      $('#menu_op').addClass('active');
    } else if ("${board.categorynm}" == "gunma") {
      $('#menu_gunma').parents('li').addClass('active');
      $('#menu_gunma').addClass('active');
    } else if ("${board.categorynm}" == "anma") {
      $('#menu_anma').parents('li').addClass('active');
      $('#menu_anma').addClass('active');
    } else if ("${board.categorynm}" == "play") {
      $('#menu_play').parents('li').addClass('active');
      $('#menu_play').addClass('active');
    } else if ("${board.categorynm}" == "tel") {
      $('#menu_tel').parents('li').addClass('active');
      $('#menu_tel').addClass('active');
    } else if ("${board.categorynm}" == "lib") {
      $('#menu_lib').parents('li').addClass('active');
      $('#menu_lib').addClass('active');
    } else if ("${board.categorynm}" == "oph") {
      $('#menu_oph').parents('li').addClass('active');
      $('#menu_oph').addClass('active');
    } else if ("${board.categorynm}" == "gunmah") {
      $('#menu_gunmah').parents('li').addClass('active');
      $('#menu_gunmah').addClass('active');
    } else if ("${board.categorynm}" == "anmah") {
      $('#menu_anmah').parents('li').addClass('active');
      $('#menu_anmah').addClass('active');
    } else if ("${board.categorynm}" == "playh") {
      $('#menu_playh').parents('li').addClass('active');
      $('#menu_playh').addClass('active');
    } else if ("${board.categorynm}" == "telh") {
      $('#menu_telh').parents('li').addClass('active');
      $('#menu_telh').addClass('active');
    } else if ("${board.categorynm}" == "libh") {
      $('#menu_libh').parents('li').addClass('active');
      $('#menu_libh').addClass('active');
    } else if ("${board.categorynm}" == "bizwm") {
      $('#side_bizWm').addClass('active');
    } else if ("${board.categorynm}" == "partner") {
      $('#side_partner').addClass('active');
    } else if ("${board.categorynm}" == "bizqna") {
      $('#side_bizQna').addClass('active');
    }



    /**
     * Open Modal
     *
     * @author 
     * @version 1.0, 2017.12.16 소스 수정
     */
    $('.user_picture').click((e) => {
      $('#pictureModal').modal();
    });


    //중복체크 및 약관 동의
    var isCheckedNickNmDupl = true;

    /**
     * Modal
     * Email, 닉네임 수정시 중복체크 초기화
     *
     * @author 
     * @version 1.0, 2017.12.16 소스 수정
     */
    $('#m_nick_nm').change(function (e) {
      isCheckedNickNmDupl = false;
      e.preventDefault();
    });


    /**
     * Modal
     * 닉네임 중복 체크 버튼 클릭.
     *
     * @author 
     * @version 1.0, 2017.12.16 소스 수정
     * @see    None
     */
    $('#checkNickNm').click((e) => {
      var trimNickNm = trim($('#m_nick_nm').val());

      //nick_nm null check
      if (trimNickNm == "") {
        alert("닉네임을 입력해 주세요.");
        $('#m_nick_nm').val(trimNickNm).focus();
        return;
      }

      //TODO: 특수기호 못쓰게 처리 추가
      if (!regExp(trimNickNm)) {
        $('#m_nick_nm').focus();
        return;
      }

      $.ajax({
        url: "/register/checkNickNm",
        method: "post",
        type: "json",
        data: objectifyForm($('#registerForm').serializeArray()),
        success: function (data) {
          if (!data.isDuplicated) {
            isCheckedNickNmDupl = true;
            alert('"' + $('#m_nick_nm').val() + '" 사용 가능한 닉네임 입니다.');
          } else {
            isCheckedNickNmDupl = false;
            alert('"' + $('#m_nick_nm').val() + '" 중복된 닉네임 입니다.');
            $('#m_nick_nm').focus();
          }
        },
        error: function (error) {
          alert("error : " + eval(error));
        }
      });

    })


    /**
     * 비밀번호 체크
     */
    $('#m_pwd').keyup(function () {
      if ($('#m_before_pwd').val() != $('#m_pwd').val()) {
        $('font[name=check2]').text('');
      } else {
        $('font[name=check2]').text('');
        $('font[name=check2]').html("현재 비밀번호와 변경 비밀번호가 동일합니다.");
      }
    }); //#m_pwd.keyup

    $('#m_pwd_again').keyup(function () {
      if ($('#m_pwd').val() != $('#m_pwd_again').val()) {
        $('font[name=check]').text('');
        $('font[name=check]').html("비밀번호가 다릅니다.");
      } else {
        $('font[name=check]').text('');
        $('font[name=check]').html("비밀번호가 일치합니다.");
      }
    }); //#m_pwd_again.keyup


    /**
     * Modal
     * 삭제
     *
     * @author 
     * @version 1.0, 2017.12.16 소스 수정
     */

    function removeCancleValue() {
      $('#m_nick_nm').val("${loginUser.nick_nm}");
      $('#m_before_pwd').val("");
      $('#m_pwd').val("");
      $('#m_pwd_again').val("");
      $('font[name=check]').text('');
      $('font[name=check2]').text('');
      isCheckedNickNmDupl = true;
    }

    $('#pictureModal').on('hidden.bs.modal', function (e) {
      removeCancleValue();
    })

    /**
     * Modal
     * Save LoginUser
     *
     * @author 
     * @version 1.0, 2017.12.16 소스 수정
     */
    $('#setUserInfo').click((e) => {

      var trimPwd = trim($('#m_pwd').val());

      if (!isCheckedNickNmDupl) {
        alert("닉네임 중복확인을 해주세요.");
        $('#m_nick_nm').focus();
        return;
      } else if ($('#m_pwd').val() != $('#m_pwd_again').val() || trimPwd == "") {
        alert("비밀번호를 확인해주세요.");
        $('#m_pwd').focus();
        return;
      }

      if ($('#m_pwd').val() == $('#m_before_pwd').val()) {
        alert('현재 비밀번호와 변경 비밀번호가 동일합니다.');
        return;
      }


      $.ajax({
        url: "/register/changeLoginUser",
        method: "post",
        type: "json",
        data: objectifyForm($('#registerForm').serializeArray()),
        success: function (data) {
          if (!data.isCheckPassword) {
            alert("비밀번호가 맞지 않습니다.");
            return;
          }

          if (data.isSuccesses) {
            alert("성공적으로 변경되었습니다.");
            removeCancleValue(); //항목삭제
            $('#pictureModal').modal('hide');
          } else {
            alert("변경에 실패했습니다..");
          }
        },
        error: function (error) {
          alert("error : " + eval(error));
        }
      });


    });
  </script>