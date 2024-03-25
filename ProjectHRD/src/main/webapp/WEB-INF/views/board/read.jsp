<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>read.jsp</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
</head>
<body>
${vo.employee_id }
${username }
	<h1>글 본문(/board/read.jsp)</h1>
	<form role="form" action="" method="get" class="fm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="board_no" value="${vo.board_no }"/>
	</form>
	<div class="box-header with-border">
		<h3 class="box-title">게시판 글쓰기</h3>
	</div>
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputEmail1">제 목</label> <input type="text" class="form-control" id="exampleInputEmail1" name="title" 
				value= "${vo.title }" readonly>
			</div>

			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control" name="employee_id" 
				value="${vo.employee_id }" readonly>
			</div>

			<div class="form-group">
				<label>내 용</label>
				<textarea class="form-control" rows="3" name="content"  readonly>${vo.content }</textarea>
			</div>
			<!-- 로그인한 사용자와 작성자가 같이 않으면 삭제버튼과 수정버튼이 나오지 않음 -->
			<div class="box-footer">				
				<c:if test="${employee_id eq vo.employee_id}">
				<button type="submit" class="btn btn-danger" onclick="location.href='/board/modify?board_no=${vo.board_no}'">수정하기</button>
				<button type="submit" class="btn btn-warning">삭제하기</button>
				</c:if>
				<button type="submit" class="btn btn-success" >목록이동</button>
			</div>
		</div>
		
		<script>
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
			
			
			$(".btn-success").click(function(){
				location.href="/board/list?page=${param.page}&pageSize=${param.pageSize}";
			}); 
			
			$(".btn-warning").click(function(){
				alert(" 삭제되었습니다. ");
				formObj.attr("action","/board/remove");
				formObj.attr("method","post");
				formObj.submit();
			});
		});
		</script>
</body>
</html>