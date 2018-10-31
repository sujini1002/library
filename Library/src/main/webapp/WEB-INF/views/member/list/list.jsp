<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/resources/common/memberHeader.jsp"></jsp:include>
<!-- 네비 사용 시작  -->
<jsp:include page="/resources/common/memberNavOpen.jsp"></jsp:include>
<!DOCTYPE html>

<style>
body, html {
	height: 100%;
	background-color: white;
}

h1 {
	padding: 40px 200px;
}

#list {
	/* padding: 0 200px; */
}

#pageNum {
	text-align: right;
	padding: 20px;
}

#write {
	float: right;
	color: white;
	background-color: black;
	padding: 10px;
	cursor: pointer;
	margin: 10px;
}

#title {
	cursor: pointer;
}
</style>

	<h2>자유 게시판</h2>

	<div id="list">
		<button onclick="location.href='writeForm'" id="write" type="button"
			class="btn btn-rounded btn-blue-grey">
			<i class="far fa-edit" aria-hidden="true"></i> 글쓰기
		</button>
		<table id="list" class="table table-striped table-hover text-center">
			<thead>
				<tr>
					<th scope="col" style="width: 10%">#</th>
					<th scope="col" style="width: 50%">제목</th>
					<th scope="col" style="width: 20%">작성자</th>
					<th scope="col" style="width: 20%">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="message" items="${viewInfo}" varStatus="status">
					<tr>
						<td scope="row">${message.idx}</td>
						<td id="title" onclick="location.href='view?idx=${message.idx}'">${message.list_title}&nbsp[${message.cnt}]</td>
						<td>${message.list_name}</td>
						<td>${message.list_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div id="pageNum">
			<c:choose>
				<c:when test="${page.currentPageNumber > 1}">
					<a style="color: black" href="list?page=1">[ << ]</a>
					<a style="color: black"
						href="list?page=${page.currentPageNumber-1}">[ < ]</a>
				</c:when>
			</c:choose>
			<c:forEach var="num" begin="${page.startPageNum}"
				end="${page.lastPageNum}">
				<c:choose>
					<c:when test="${page.currentPageNumber==num}">
						<a style="color: red" href="list?page=${num}">[${num}]</a>
					</c:when>
					<c:otherwise>
						<a style="color: black" href="list?page=${num}">[${num}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:choose>
				<c:when test="${page.currentPageNumber < page.pageTotalCount}">
					<a style="color: black"
						href="list?page=${page.currentPageNumber+1}">[ > ]</a>
					<a style="color: black" href="list?page=${page.pageTotalCount}">[
						>> ]</a>
				</c:when>
			</c:choose>
		</div>
	</div>

<jsp:include page="/resources/common/memberNavClose.jsp"></jsp:include>
<!-- 네비 사용 끝 -->
<jsp:include page="/resources/common/memberFooter.jsp"></jsp:include>