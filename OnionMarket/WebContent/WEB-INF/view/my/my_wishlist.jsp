<%@page import="kr.or.ddit.vo.ProdMyAllVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/taglib.jsp"%>

<!DOCTYPE html>
<html>
<%
	// Controller가 보내온 데이터 받기
List<ProdMyAllVO> myList = (List<ProdMyAllVO>)request.getAttribute("myList");
%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/png" sizes="32x32" href="${_ctx}/favicon.png">
	<title>양파마켓</title>
	
	<jsp:include page="${_resource}"/>
</head>

<body>
	<div>
		<jsp:include page="${_header}"/>
		
		<main class="sub-page">

            <div class="inner">
                <aside class="left-menu border-r">
                    <p class="menu-tit">마이페이지</p>

                    <ul class="mypage-menu">
                        <li>
                            <div class="profile-area">
                                <div class="profile">
                                    <!-- 프로필 등록시 아래 img태그 추가해주세요 -->
                                    <!-- <img src="../img/example/img1.jpg(예시)"> -->
                                </div>

                                <a href="<%=request.getContextPath()%>/my/updateMy.do">프로필 설정</a>
                            </div>
                        </li>
                        <li>
                            <p class="tit">나의 거래</p>
                            <a href="<%=request.getContextPath()%>/my/sellListMy.do">판매내역</a>
                            <a href="<%=request.getContextPath()%>/my/buyListMy.do">구매내역</a>
                            <a href="<%=request.getContextPath()%>/my/wishlistMy.do">위시리스트</a>
                            <a href="<%=request.getContextPath()%>/my/locationStart.do">내 동네 설정</a>
                            <a href="<%=request.getContextPath()%>/my/keywordMy.do">알림 키워드 설정</a>
                        </li>
                        <li>
                            <p class="tit">내 동네 활동</p>
                            <a href="<%=request.getContextPath()%>/my/communityMy.do">커뮤니티</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/my/deleteMy.do">회원정보 탈퇴</a>
                        </li>
                    </ul>
                </aside>

                <section class="content-area">
                    <div class="mypage-list">
                        <h1 class="heading2">위시리스트</h1>

                        <!-- history-area 시작 -->
                        <div class="history-area">
                            <ul>
                            <%
                            for(ProdMyAllVO pvo : myList){
                            %>
                                <li>
                                    <div class="item" onclick="location.href='<%=request.getContextPath() 
													%>/pro/proDetail.do?prod_id=<%=pvo.getProd_id() %>'">
                                        <div class="profile">
													<!-- 프로필 등록시 아래 img태그 추가해주세요 -->
													<!-- <img src="../img/example/img1.jpg(예시)"> -->
												</div>
                                        <div class="txt-wrap">
                                            <p class="cate"><%=pvo.getCate_nm() %></p>
                                            <p class="tit"><%=pvo.getTit() %></p>
                                            <p class="price"><%=pvo.getPrice() %></p>
                                        </div>
                                    </div>
                                </li>
                                <%
                            }
                                %>
                            </ul>

                            <!-- pager 시작 -->
                            <div class="pager">
                                <a href="javascript:void(0);" class="arr prev"></a>
                                <strong class="active">1</strong>
                                <a href="javascript:void(0);">2</a>
                                <a href="javascript:void(0);">3</a>
                                <a href="javascript:void(0);">4</a>
                                <a href="javascript:void(0);">5</a>
                                <a href="javascript:void(0);">6</a>
                                <a href="javascript:void(0);">7</a>
                                <a href="javascript:void(0);">8</a>
                                <a href="javascript:void(0);" class="arr next"></a>
                            </div>
                            <!-- pager 끝 -->
                        </div>
                        <!-- history-area 끝 -->
                    </div>


                </section>
            </div>
        </main>
		
		<jsp:include page="${_footer}"/>
	</div>
</body>
</html>