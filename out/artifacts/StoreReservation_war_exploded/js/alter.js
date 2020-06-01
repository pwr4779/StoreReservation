// 테이블의 Row 클릭시 값 가져오기
$("#alterbtn").click(function(){

    var str = ""
    var tdArr = new Array();	// 배열 선언

    // 현재 클릭된 Row(<tr>)
    var tr = $(this);
    var td = tr.children();

    // tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
    console.log("클릭한 Row의 모든 데이터 : "+tr.text());

    // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
    td.each(function(i){
        tdArr.push(td.eq(i).text());
    });

    console.log("배열에 담긴 값 : "+tdArr);

    // td.eq(index)를 통해 값을 가져올 수도 있다.
    var StoreNo = td.eq(2).text();
    var StoreName = td.eq(8).text();
    var StoreAddr = td.eq(3).text();
    var StorePhone = td.eq(4).text();
    var StoreTable = td.eq(5).text();
    var StoreOpen = td.eq(6).text();
    var StoreClose = td.eq(7).text();
    $("#ex1").html("<div class=\"jumbotron\" style=\"padding-top: 20px;\">\n"+
        "            <form method=\"post\" accept-charset=\"euc-kr\" onsubmit=\"document.charset='euc=kr';\"  action=\"alterStoreInfoAction.jsp?StoreNo=<%=" +StoreNo +"%>\">\n" +
        "                <h3 style=\"text-align: center;\">매장정보수정</h3>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"매장명\" name=\"StoreName\" maxlength=\"20\" value="+StoreName +">\n" +
        "                </div>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"주소\" name=\"StoreAddr\" maxlength=\"20\" value="+StoreAddr+" >\n" +
        "                </div>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"전화번호\" name=\"StorePhone\" maxlength=\"20\" value="+StorePhone +">\n" +
        "                </div>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"테이블수\" name=\"StoreTable\" maxlength=\"20\" value="+ StoreTable+" >\n" +
        "                </div>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"오픈시간\" name=\"StoreOpen\" maxlength=\"20\" value="+StoreOpen+">\n" +
        "                </div>\n" +
        "                <div class=\"form-group\">\n" +
        "                    <input type=\"text\" class=\"form-control\" placeholder=\"마감시간\" name=\"StoreClose\" maxlength=\"20\" value="+StoreClose+">\n" +
        "                </div>\n" +
        "                <input type=\"submit\" class=\"btn btn-primary form-control\" value=\"수정\">\n" +
        "            </form>\n"+
        "           </div>\n");
});