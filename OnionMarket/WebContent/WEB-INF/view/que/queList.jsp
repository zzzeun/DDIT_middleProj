<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<%@page import="kr.or.ddit.vo.QueVO"%>
<%@page import="kr.or.ddit.vo.UsersVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%> 
<%@page import="java.util.Comparator"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="32x32"
    href="${_ctx}/favicon.png">
<title>양파마켓</title>
<script type="text/javascript">
function registered() {
    var currentLocation = window.location; // 현재 URL 정보를 가져옵니다
    var newURL = currentLocation.protocol + '//' + currentLocation.hostname + ':' + currentLocation.port + '/que/QueIns.do';
    window.location.href = newURL; // 새 URL로 이동합니다
}

</script>
<jsp:include page="${_resource}" />
<%
List<QueVO> queList = (List<QueVO>) request.getAttribute("queList");
 
UsersVO userId = (UsersVO) session.getAttribute("loginUser");
%>
</head>

<body>
    <div>
        <jsp:include page="${_header}" />

        <!-- sub-page 시작 -->
        <main class="sub-page">

            <div class="sub-menu">
                <a href="<%=request.getContextPath()%>/que/QueList.do" class="active">1:1문의</a> 
                <a href="<%=request.getContextPath()%>/police/policeList.do">신고하기</a>
            </div>

            <div class="inner">
                <section class="content-area">
                    <h1 class="heading1">1:1 문의</h1>

                    <table class="board-table">
                        <colgroup>
                            <col style="width: auto;">
                            <col style="width: auto;">
                            <col style="width: auto;">
                            <col style="width: auto;">
                            <col style="width: auto;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>아이디</th>
                                <th>등록날짜</th>
                                <th>처리여부</th>
                            </tr>
                        </thead>
                         <tbody>
                        

<%
UsersVO user = (UsersVO) session.getAttribute("loginUser");
String userID = null;
boolean hasQue = false; // 결과가 있는지 여부 확인하는 플래그

if (user != null) {
    userID = user.getUser_id();
 
    if (queList != null && !queList.isEmpty()) {
        Collections.sort(queList, new Comparator<QueVO>() {
            @Override
            public int compare(QueVO que1, QueVO que2) {
                // 내림차순 정렬 (큰 값이 먼저 오도록)
                return Integer.compare(que2.getQue_id(), que1.getQue_id());
            }
        });

        for (QueVO que : queList) {
            if (que.getUp_id() == 0 && que.getIns_id() != null && que.getIns_id().equals(userID)) {
                boolean hasSameId = false; // que_id와 up_id가 같은 경우를 확인하는 플래그

                for (QueVO otherQue : queList) {
                    if (que.getQue_id() != otherQue.getQue_id() && que.getQue_id() == otherQue.getUp_id()) {
                        hasSameId = true; // que_id와 up_id가 같으면 플래그를 true로 변경
                        break; // 일치하는 경우가 있으면 루프 중단
                    }
                }
                // 결과가 있음을 표시하는 플래그 설정
                hasQue = true;
%>
            <!-- 여기에 테이블의 각 행을 나타내는 코드 -->
            <tr onclick="location.href='<%=request.getContextPath()%>/que/queDetail.do?que_id=<%=que.getQue_id()%>'">
                <td><%=que.getQue_id()%></td>
                <td><%=que.getTit()%></td>
                <td><%=que.getIns_id()%></td>
                <td><%=que.getIns_dt()%></td>
                <td><%= hasSameId ? "Y" : "N" %></td>
            </tr>
<%
            }
        }
    }
}

// 결과가 없을 경우 메시지 표시
if (!hasQue) {
%>
    <!-- 결과가 없을 때 표시할 메시지 -->
    <tr>
        <td colspan="5">게시글이 없습니다.</td>
    </tr>
<%
}
%>


 
                    </tbody>
                </table>

<!--                 pager 시작 -->
                <div class="pager">
                    <a href="javascript:void(0);" class="arr prev"></a> <strong
                        class="active">1</strong> 
<!--                         <a href="javascript:void(0);">2</a>  -->
<!--                         <a href="javascript:void(0);">3</a> <a href="javascript:void(0);">4</a>  -->
<!--                     <a href="javascript:void(0);">5</a> <a href="javascript:void(0);">6</a> -->
<!--                     <a href="javascript:void(0);">7</a> <a href="javascript:void(0);">8</a> -->
                    <a href="javascript:void(0);" class="arr next"></a>
                </div>
<!--                 pager 끝 -->

                <div class="btn-area">
                    <input type="button" value="등록하기" class="btn-style4"
                        onclick="registered()">
                </div>
            </section>
        </div>

    </main>
    <!-- sub-page 끝 -->

    <jsp:include page="${_footer}" />
</div>
</body>
</html>
