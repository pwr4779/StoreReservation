<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-05-23
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>레스토랑 웹사이트</title>
</head>
<body>
<!-- 네비게이션  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expaned="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">레스토랑 예약 시스템</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">

        <ul class="nav navbar-nav navbar-right">
            <li><a href="loginView.jsp">로그인</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="signUpAction.jsp">
                <h3 style="text-align: center;">회원가입</h3>
                <small style="text-align: center;">*필수 항목을 모두 입력해주세요.</small>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*이름" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*아이디" name="userID" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="*비밀번호(YYYYMMDD ex)19960101)" name="userPassword" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*주소" name="userAddr" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*휴대폰번호" name="userPhone" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*생일" name="userBirth" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="취미" name="userHobby" maxlength="50">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="선호매장" name="userPreferenceStore" maxlength="50">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="회원가입">
            </form>

        </div>
    </div>
</div>
<!-- 애니매이션 담당 JQUERY -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="js/bootstrap.js"></script>
</body>
</html>
