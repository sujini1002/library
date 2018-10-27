<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/resources/common/adminHeader.jsp"></jsp:include>
<jsp:include page="/resources/common/adminNavOpen.jsp"></jsp:include>
<script type="text/javascript">
	var check = '';
	$(document).ready(function() {
		$('input:checkbox').each(function() {
			if ($(this).val() == 'T') {
				$(this).prop('checked', true);
			} else {
				$(this).prop('checked', false);
			}
		});

		$('input:checkbox').change(function() {
			check = '';
			$('input:checkbox').each(function() {
				if ($(this).is(':checked')) {
					check = check + 'T';
				} else {
					check = check + 'F';
				}
			});
			$('#permission').val(check);
		});
	});
</script>
<form method="post">
	<div class="alert alert-light">
		<h1 class="h3 mb-6 font-weight-normal">관리자 수정</h1>

		<div class="form-group">
			<label>아이디</label><input type="text" name="admin_id"
				class="form-control form-control-lg" value="${av.admin_id}"
				required="required" readonly="readonly" />
		</div>
		<div class="form-group">
			<label>비밀번호</label><input type="text" id="password" name="password"
				class="form-control form-control-lg" placeholder="Password"
				value="${av.password}" required="required" autofocus="autofocus" />
		</div>
		<c:choose>
			<c:when test="${'admin' eq av.admin_id}">
							관리자 'admin' 계정의 경우 권한을 수정할 수 없습니다.
						</c:when>
			<c:otherwise>
				<div class="form-group">
					<label>권한</label> ${av.permission}
					<c:set var="permission" value="${av.permission}" />
					<c:set var="permissionSize" value="${fn:length(permission)}" />
					${permissionSize}
					<div class="custom-control custom-checkbox">
						<c:set var="count" value="0" scope="page" />
						<c:forEach var="item" items="${permissions}">
							<c:set var="count" value="${count+1}" scope="page" />
							<input type="checkbox" id="permission${count}"
								value="${fn:substring(permission, count-1, count)}">
							<label for="permission${count}"> ${item}</label>
						</c:forEach>
						<input type="text" id="permission" name="permission"
							value="${av.permission}" />
					</div>
				</div>
			</c:otherwise>
		</c:choose>

		<button class="btn btn-lg btn-primary btn-block" type="submit">관리자
			등록</button>
	</div>
</form>

<jsp:include page="/resources/common/adminNavClose.jsp"></jsp:include>
<jsp:include page="/resources/common/adminFooter.jsp"></jsp:include>