<%--
  Created by IntelliJ IDEA.
  User: ParkWonRo
  Date: 2020-05-25
  Time: ���� 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- ����Ʈ -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- ��Ÿ�Ͻ�Ʈ ����  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>������� ������Ʈ</title>
</head>
<body>
<!-- �׺���̼�  -->
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expaned="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand">������� ���� �ý���</a>
    </div>
    <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="StoreManagementView.jsp">�������</a></li>
            <li><a href="../Menu/MenuManageView.jsp">�޴�����</a></li>
            <li><a href=".jsp">ȸ������</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="../loginView.jsp">�α׾ƿ�</a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px;">
            <form method="post" action="insertStoreInfoAction.jsp">
                <h3 style="text-align: center;">���� �߰�</h3>
                <small style="text-align: center;">*�ʼ� �׸��� ��� �Է����ּ���.</small>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*�����ȣ" name="storeNo" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*�ּ�" name="addr" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*��ȭ��ȣ" name="phone" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*���̺���" name="table" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*���½ð�" name="openTime" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*�����ð�" name="closeTime" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="*�����" name="storeName" maxlength="50">
                </div>
                <input type="submit" class="btn btn-primary form-control" value="Ȯ��">
            </form>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- ��Ʈ��Ʈ�� JS  -->
<script src="../js/bootstrap.js"></script>
<script src="../js/alter.js"></script>
</body>
</html>