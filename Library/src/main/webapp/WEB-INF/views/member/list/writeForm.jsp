<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/resources/common/memberHeader.jsp"></jsp:include>
<!-- 네비 사용 시작  -->
<jsp:include page="/resources/common/memberNavOpen.jsp"></jsp:include>
<style>

html, body{
	background-color: white;
}

#wrap{
	
	position:absolute;
	top:60%;
	left:50%;
	width: 70%;
	transform:translate(-50%, -50%)
}
</style>

<div id="wrap">	
<!-- Default form contact -->
<form method="post" class="text-center border border-light p-5">

    <p class="h4 mb-4">글쓰기</p>

    <!-- Name -->
    <input name="list_title" type="text" id="defaultContactFormName" class="form-control mb-4" placeholder="제목">


    <!-- Message -->
    <div class="form-group">
        <textarea name="list_content" style="height: 500px" class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3" placeholder="내용"></textarea>
    </div>

    <!-- Send button -->
    <button class="btn btn-info btn-block" type="submit">확인</button>

    <input type="hidden" name="list_name" value="${memberLoginInfo.name}"/>
    <!--  <input type="hidden" name="id" value="${idz}" />  -->

</form>
<!-- Default form contact -->
</div>


<jsp:include page="/resources/common/memberNavClose.jsp"></jsp:include>
<!-- 네비 사용 끝 -->
<jsp:include page="/resources/common/memberFooter.jsp"></jsp:include>