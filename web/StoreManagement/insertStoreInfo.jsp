<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-25
  Time: 오전 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
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
        <ul class="nav navbar-nav">
            <li><a href="StoreManagementView.jsp">매장관리</a></li>
            <li><a href="../Menu/MenuManageView.jsp">메뉴관리</a></li>
            <li><a href="../Payment/SelectStore.jsp">결제처리</a></li>
            <li><a href="../UserManagerment/UserManagementView.jsp">회원관리</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">로그아웃</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="insertStoreInfoAction.jsp">
                <h3 style="text-align: center;">매장 추가</h3>
                <small style="text-align: center;">*필수 항목을 모두 입력해주세요.</small>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*매장번호" name="storeNo" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*주소" name="addr" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*전화번호" name="phone" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*테이블수" name="table" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*오픈시간" name="openTime" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*마감시간" name="closeTime" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*매장명" name="storeName" maxlength="50">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="확인">
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS  -->
<script src="../js/bootstrap.js"></script>
<script src="../js/alter.js"></script>
</body>
</html>
