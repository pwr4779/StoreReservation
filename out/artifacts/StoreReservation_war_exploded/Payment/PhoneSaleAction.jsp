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
    <!-- ����Ʈ -->
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <!-- ��Ÿ�Ͻ�Ʈ ����  -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>�Ϲݰ���ó��</title>
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
    alert("��ȿ�� �ֹ���ȣ�� �ƴմϴ�!!")
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
    alert("���������� �Է����ּ���.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
} else {
    int SaleCoupon = PayDAO.NullToZero(request.getParameter("SaleCoupon"));
    int UsingPoint = PayDAO.NullToZero(request.getParameter("UsingPoint"));
    int InstallMonth = PayDAO.NullToZero(request.getParameter("InstallMonth"));
    String PhoneCom = request.getParameter("PhoneCom");
    String Phone = request.getParameter("Phone");

    if(PhoneCom == null || Phone == null) {
%>
<script>
    alert("ī���ȣ�� ī��� �Է��� �ʼ��Դϴ�.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}else if (!(SaleCoupon == 3 || SaleCoupon == 7 || SaleCoupon == 10 || SaleCoupon == 0)) {
%>
<script>
    alert("��밡���� ������ �Է����ּ���.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}else if (SaleCoupon ==3 && userDetail.getCoupon3()<1) {
%>
<script>
    alert("��밡���� 3%������ �����ϴ�.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}
else if (SaleCoupon ==7 && userDetail.getCoupon7()<1) {
%>
<script>
    alert("��밡���� 7%������ �����ϴ�.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}
else if (SaleCoupon == 10 && userDetail.getCoupon10()<1) {
%>
<script>
    alert("��밡���� 10%������ �����ϴ�.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}
else if (UsingPoint > userDetail.getACPoint()) {
%>
<script>
    alert("��밡���� ������ ����Ʈ�� �ʰ��ϼ̽��ϴ�.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}

else if (InstallMonth > 6 || InstallMonth < 0) {
%>
<script>
    alert("�Һι����� �°� �Է����ּ���.")
    location.href = 'PaymentProcessingView.jsp?OrderNo=<%=OrderNo%>'
</script>
<%
}else{

    int Amount = list.get(0).getTOTAL_ORDER_AMOUNT();
    int result_1 = PayDAO.AffiliatePaymentInsert(OrderNo, 20, SaleCoupon, Amount, InstallMonth,UsingPoint); // ���� ���̺� (���� ����, ����Ʈ���)
    int result_2 = PayDAO.UserUpdateAboutPay(userDetail.getUserNo(),SaleCoupon,UsingPoint); // USER_DETAIL ���� -> �ֹ� �� +1, AC_POINT +1000, YEAR_AC_POINT +1000, ������ ����, AC_Point ����
    int result_3 = PayDAO.PhoneDiscountTableInsert(OrderNo, PhoneCom, Phone); // ��Ż��������̺� ���� ����
    int result_4 = PayDAO.FinishPaymentProcessing(OrderNo); // ����ó�� �Ϸ� �� �ֹ� ���̺��� �����Ϸ�ó��
    if (result_1 == -1 || result_2 == -1 || result_3 == -1 || result_4 == -1) {
%>
<script>
    alert("���� ����")
    location.href = 'PaymentSelectStore.jsp';
</script>
<%
} else {
%>
<script>
    alert("���� �Ϸ�!!")
    location.href = 'PaymentStateView.jsp';
</script>
<%
            }

        }
    }
%>
</body>
</html>