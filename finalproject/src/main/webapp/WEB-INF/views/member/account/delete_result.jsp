<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/member/template/home_header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
nav.navbar.bootsnav.no-background.white .attr-nav>ul>li>a, nav.navbar.bootsnav.navbar-transparent.white .attr-nav>ul>li>a,
	nav.navbar.bootsnav.navbar-transparent.white ul.nav>li>a, nav.navbar.bootsnav.no-background.white ul.nav>li>a
	{
	color: black !important;
}

nav.navbar.bootsnav.no-background {
    background-color: lightgray;
    border: none;
}
#content-wrapper{
	margin-top:100px;
}
</style>
<div id="content-wrapper">
	<div class="container-fluid">
		<div class="container-form offset-sm-3 col-sm-6 offset-md-3 col-md-6">
			<br> <br> <br> <br> <br> <br> <br>
			<div class="form-cnotrol">탈퇴 완료</div>
			<br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>