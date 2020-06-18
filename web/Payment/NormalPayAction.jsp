<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DB.*" %>
<%@ page language="java" contentType="text/html; charset=euc-kr"
         pageEncoding="euc-kr" %>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
    <!-- 뷰포트 -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>일반결제처리</title>
</head>
<body>
<%
    String OrderNo = null;
    if (request.getParameter("OrderNo") != null) {
        OrderNo = request.getParameter("OrderNo");
    }
    if (OrderNo == null) {
%>
<script>
    alert("유효한 주문번호가 아닙니다!!")
    location.href = 'StoreManagementView.jsp'
</script>
<%
    }
    ArrayList<OrderState> list = OrderDAO.OrderStateDetail(OrderNo);
    UserDetail userDetail = UserDAO.GetUserDetail(list.get(0).getUserNo());
    if (request.getParameter("SaleCoupon") == null || request.getParameter("UsingPoint") == null
            || request.getParameter("InstallMonth") == null) {
%>
<script>
    alert("결제내용을 입력해주세요.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
} else {
    int SaleCoupon = PayDAO.NullToZero(request.getParameter("SaleCoupon"));
    int UsingPoint = PayDAO.NullToZero(request.getParameter("UsingPoint"));
    int InstallMonth = PayDAO.NullToZero(request.getParameter("InstallMonth"));
    if (!(SaleCoupon == 3 || SaleCoupon == 7 || SaleCoupon == 10 || SaleCoupon == 0)) {
%>
<script>
    alert("사용가능한 쿠폰을 입력해주세요.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }else if (SaleCoupon ==3 && userDetail.getCoupon3()<1) {
%>
<script>
    alert("사용가능한 3%쿠폰이 없습니다.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }
    else if (SaleCoupon ==7 && userDetail.getCoupon7()<1) {
%>
<script>
    alert("사용가능한 7%쿠폰이 없습니다.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }
    else if (SaleCoupon == 10 && userDetail.getCoupon10()<1) {
%>
<script>
    alert("사용가능한 10%쿠폰이 없습니다.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }
    else if (UsingPoint > userDetail.getACPoint()) {
%>
<script>
    alert("사용가능한 고객의 포인트를 초과하셨습니다.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }

    else if (InstallMonth > 6 || InstallMonth < 0) {
%>
<script>
    alert("할부범위에 맞게 입력해주세요.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
    }else{

    int Amount = list.get(0).getTOTAL_ORDER_AMOUNT();
    int result_1 = PayDAO.PaymentInsert(OrderNo, SaleCoupon, Amount, InstallMonth,UsingPoint); // 결제 테이블 (쿠폰 할인, 포인트사용)
    int result_2 = PayDAO.UserUpdateAboutPay(userDetail.getUserNo(),SaleCoupon,UsingPoint); // USER_DETAIL 갱신 -> 주문 수 +1, AC_POINT +1000, YEAR_AC_POINT +1000, 쿠폰수 -1, AC_Point 차감
    int result_3 = PayDAO.FinishPaymentProcessing(OrderNo); // 결제처리 완료 후 주문 테이블에 결제완료처리
    if (result_1 == -1 || result_2 == -1 || result_3 == -1) {
%>
<script>
    alert("결제 실패")
    location.href = 'PaymentSelectStore.jsp';
</script>
<%
} else {
%>
<script>
    alert("결제 완료!!")
    location.href = 'PaymentStateView.jsp';
</script>
<%
    }

    }
    }
    %>
</body>
</html>
