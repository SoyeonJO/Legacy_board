<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cPath" value="${pageContext.request.contextPath }"></c:set>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Sangwon Hyun">
  <title>BOARD</title>
<!-- 공통으로 쓰이는 css파일을넣는다.-->
<link type="text/css" rel="stylesheet" href="${cPath}/resources/css/default/all.css" />
<link type="text/css" rel="stylesheet" href="${cPath}/resources/css/default/sb-admin.css" />
<!-- ico image -->
<link rel="shortcut icon" href="${cPath}/resources/img/sy.ico" />
<!-- 공통으로 쓰이는 js파일을넣는다.-->
<script type="text/javascript" src="${cPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/sb-admin.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">


  function ajax_submit(){  //버튼에 onclick="ajax_submit" 주기 
	  
	  var title = $('#title').val();  //아이디가 title인 value값을 get해라 !!
	  var content = $('#content').val();
	  
	  var jsonData = {
		  "title" : title,     /*  제이슨데이터를 ajax를 통해서 controller로 보낸다 */
		  "content": content   
	  }
	  
	   $.ajax({
	         type: 'POST', //보낼 메소드 get or post?
	         contentType: "application/json", //보낼 데이터 타입
	         url:'/board/write', // controller url
	         data: JSON.stringify(jsonData), //json 형태로 변환!
	         dataType: 'text', //controller 부터 return 
	         success: function(data){ //ajax가 성공하면!
	         	if(data == 'true'){
	         		alert('게시판을 등록했습니다.');
	         	}else{
	         		alert('게시판 등록 실패!');
	         	}
	         },
	         error:function(xhr,status,error){ //ajax가 실패하면
	            console.log('error:'+error);
	         }
	      });
	  
  }
  
</script>
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">Start Bootstrap</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-bell fa-fw"></i>
          <span class="badge badge-danger">9+</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow mx-1">
        <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-envelope fa-fw"></i>
          <span class="badge badge-danger">7</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          <a class="dropdown-item" href="#">Settings</a>
          <a class="dropdown-item" href="#">Activity Log</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.html">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">Login Screens:</h6>
          <a class="dropdown-item" href="login.html">Login</a>
          <a class="dropdown-item" href="register.html">Register</a>
          <a class="dropdown-item" href="forgot-password.html">Forgot Password</a>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">Other Pages:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="charts.html">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="tables.html">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
          </li>
          <li class="breadcrumb-item active"> 게시판 작성</li>
        </ol>
        
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-pen"></i> Write Board</div>
          <div class="card-body">
            <div class="table-responsive">      
            <div class="form-group">
               <input type="hidden" id="boardNo" name="boardNo">
               <!--title -->
               <label class="control-label col-sm-2" for="id">title :</label>
               <div class="col-md-4">
                  <input autocomplete="off"  type="text" class="form-control" id="title" name="title">
               </div>
               <!--content -->
               <label class="control-label col-sm-2" for="content">content :</label>
               <div class="col-md-4">
                  <textarea cols="35" rows="10" class="form-control" id="content" name="content"></textarea>
               </div>
               <!--submit -->
               <div class="col-sm-offset-2 col-sm-10" style="margin: 10px;">
                  <button class="btn btn-secondary" type="button" style="width: 100px;" onclick ="ajax_submit();">글작성</button>
                  <button class="btn btn-primary" type="button" style="width: 150px;">홈으로</button>
               </div>
            </div>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>
      <!--Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your SOYEON 2019</span>
          </div>
        </div>
      </footer>

      </div>
      <!-- /.container-fluid -->

    </div>
    <!-- /.content-wrapper -->
  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

</body>
</html>>