<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <c:if test="${isLogin eq false}">
        <!-- 로그인//시작 -->
        <form id="login" name="login" method="POST" action="login" autocomplete="off" class="form">
          <div class="media no-margin en">
            <div class="sidebar-form pull-right" style="width:60px; margin:10px 10px 0px 0px; padding-left: 0px;">
              <button type="submit" class="btn btn-flat btn-block" tabindex="43" style="height:83px;">
                <i class="fa fa-power-off fa-2x"></i>
              </button>
            </div>
            <div class="media-body">
              <div class="sidebar-form" style="margin:10px 5px 0px 10px;">
                <div class="input-group">
                  <input type="email" name="user_id" id="user_id" class="form-control sidebar-input" placeholder="Email" tabindex="41">
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-flat sidebar-input-text text-white" style="height: 34px; width:35px;">
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
                <a href="findPassword" class="win_password_lost">
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
      <c:if test="${isLogin eq true}">
      <div class="user-panel">
          <div class="pull-left image">
             <img src="http://www.bk0011.com/thema/Miso-LTE/assets/img/photo.png" class="img-circle cursor" alt="" onclick="win_memo('http://www.bk0011.com/bbs/myphoto.php');" title="내사진등록">
          </div>
          <div class="pull-left info">
             <p>칵슈</p>
             <span class="font-12 ko-11">
                <a>실버</a>
                &nbsp;
                <a href="/logout">
                   <i class="fa fa-circle text-primary"></i> &nbsp;로그아웃
                </a>
             </span>
          </div>  
 
          <div class="clearfix"></div>
          
          <div class="progress progress-striped xs cursor" style="margin:10px 0px 0px;" data-original-title="레벨업까지 800점 남았습니다." data-toggle="tooltip" data-placement="bottom" data-html="true">
             <div class="progress-bar progress-bar-blue" style="width: 20%;"></div>
          </div>
 
          <ul class="sidebar-list no-margin" style="padding:10px 5px 0px;">
             <li>
                <span class="pull-right">
                   Exp 200 (20%)
                </span>
                레벨 1 
             </li>
             <li>
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
             </li>
          </ul>
       </div>
      </c:if>
      <!-- 로그인성공시 //종료 -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">게시판목록</li>
        <!-- Optionally, you can add icons to the links -->

        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i>
            <span>업소정보</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active">
              <a href="/board/chicken/list">
                <i class="fa fa-circle-o"></i>치킨집</a>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-circle-o"></i> 피자집
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">

                <li><a href="/board/sample/sampleList"><i class="fa fa-circle-o"></i>샘플리스트</a></li>
                
                <li>
                  <a href="#">
                    <i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="#">
                        <i class="fa fa-circle-o"></i> Level Three</a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-circle-o"></i> Level Three</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-circle-o"></i>
              </a>
            </li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-share"></i>
            <span>후기정보</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active">
              <a href="/board/chicken/list">
                <i class="fa fa-circle-o"></i>치킨집</a>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-circle-o"></i> 피자집
                <span class="pull-right-container">
                  <i class="fa fa-angle-left pull-right"></i>
                </span>
              </a>
              <ul class="treeview-menu">
                <li>
                  <a href="#">
                    <i class="fa fa-circle-o"></i> Level Two</a>
                </li>
                <li>
                  <a href="#">
                    <i class="fa fa-circle-o"></i> Level Two
                    <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                    </span>
                  </a>
                  <ul class="treeview-menu">
                    <li>
                      <a href="#">
                        <i class="fa fa-circle-o"></i> Level Three</a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-circle-o"></i> Level Three</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-circle-o"></i> 중국집</a>
            </li>
          </ul>
        </li>

        <li class="active">
          <a href="#">
            <i class="fa fa-link"></i>
            <span>Link</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa fa-link"></i>
            <span>Another Link</span>
          </a>
        </li>
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

  <script type="text/javascript">
    $(document).ready(function () {
      //     var pathName = $(location).attr('pathname');
      // //    alert("a[href='"+pathName+"']");
      // 	$("a[href='"+pathName+"']").parent().addClass("active");    
      //   });


      //   $('.sidebar-menu > li').click(function(e) {
      //     var $this = $(this);

      //     if($this.has('li')){


      //     }else{
      //       $('.sidebar-menu > li.active').removeClass('active');
      //       if (!$this.hasClass('active')) {
      //           $this.addClass('active');
      //       }

      //     }
      console.log("isLogin:", '${isLogin}');
    });
  </script>