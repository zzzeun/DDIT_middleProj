<%@page import="kr.or.ddit.users.controller.usersList"%>
<%@page import="kr.or.ddit.vo.UsersVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" sizes="32x32" href="${_ctx}/favicon.png">
	<title>양파마켓</title>
	
	<jsp:include page="${_resource}"/>
<%
	List<UsersVO> list = (List<UsersVO>)request.getAttribute("list");
%> 
</head>
<style>
.hidden {
	display: none;
}
</style>
<body>
	<div>
		<jsp:include page="${_header}"/>
		
		<main class="sub-page">

            <div class="login-area">
                <h1 class="heading1">아이디 / 비밀번호 찾기</h1>

                <div class="tab-wrap">
                    <div class="tab-type tab-type2">
                        <div class="tab-menu">
                            <button data-tab="tab1" class="tab-btn active">아이디 찾기</button>
                            <button data-tab="tab2" class="tab-btn">비밀번호 찾기</button>
                            <div class="tab-indicator"></div>
                        </div>

                        <!-- 아이디찾기 -->
                        <div data-tab="tab1" class="tab-content active">
                            <div class="tab-board-lst">
                            <form action="<%=request.getContextPath()%>/my/findUser.do" method="GET">
                            
                                    <label for="userName">이름</label>
                                    <input type="text" id="userName" name="userName" class="input" placeholder="이름을 입력해주세요">

                                    <label for="userPhone">휴대폰번호</label>
                                    <input type="text" id="userPhone" name="userPhone" class="input" placeholder="휴대폰번호를 입력해주세요">

                                    <input type="submit" value="아이디 찾기" class="btn-style1 mt-30 mb-30" id="findid">

                                </form>

                                <!-- 아이디 찾기 후 아래 코드가 나와야함 (현재 주석처리) -->
<<<<<<< .mine
                        <div class="result-area">
||||||| .r377849
=======
>>>>>>> .r377936
					    <% if (list != null && !list.isEmpty()) { %>
                        <div class="result-area">
					        <% for (UsersVO vo : list) { %>
					            <p>아이디 : <%= vo.getUser_id() %></p>
					            <p>가입일 : <%= vo.getIns_dt() %></p>
					        <% } %>
                            </div>
					    <% }  %>
                        </div>
					</div>
                        <!-- 비번찾기 -->
                        <div data-tab="tab2" class="tab-content">
                            <div class="tab-board-lst">

                                <!-- 비밀번호찾기 프로세스1 -->
                                 <%-- <form action="<%=request.getContextPath()%>/my/findUser2.do" method="GET"> --%>
                                    <label for="userName">이름</label>
                                    <input type="text" id="userName" name="userName" class="input" placeholder="이름을 입력해주세요">

                                    <label for="userId">아이디</label>
                                    <input type="text" id="userId" name="userId" class="input" placeholder="아이디를 입력해주세요">
									
                                    <input type="button" value="인증번호 받기" class="btn-style2 mt-20 mb-20" id="confirm">
                                    <!-- </form> -->
                                    
                                    <div class="hidden">
                                    
                                    <p class="msg-txt1 mt-10 mb-30" id="sendMail">
                                        <i class="xi-mail"></i>&nbsp;
                                       		 가입시 등록했던 이메일로 전송했습니다.
                                    </p>
									<form action="<%=request.getContextPath()%>/my/findUser2.do" method="POST">
	                                    <label for="code">인증번호 입력</label>
	                                    <input type="text" id="code" name="code" class="input" placeholder="인증번호를 입력해주세요">
	
	                                    <input type="submit" value="인증번호 확인" class="btn-style1 mt-30 mb-30">
	
	                                    <!-- <p class="msg-txt1">인증번호가 일치합니다.</p>
	                                    <p class="msg-txt2">인증번호가 불일치합니다.</p> -->

                               		</form> 
									</div>
                               
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </main>
		
		<jsp:include page="${_footer}"/>
	</div>
</body>
<script>

$(() => {
	
	
	$("#confirm").on("click", function(e){
			$(".hidden").show();
			var namevalue = $("#userName").val().trim();
			var idvalue = $("#userId").val().trim();
			var mypath =  '<%= request.getContextPath() %>';
			
			$.ajax({
				url : `${mypath}/my/findUser2.do`,
	    		type : "GET",
	    		data : {"userName" :namevalue, "userId" : idvalue},
	    		success : function(result){
	    			console.log(result);
	    		},
	    		 error: function (xhr) {
	    	            alert("실패")
	    	        }
		
		
	})
	
	 
	
})
})



</script>
</html>
