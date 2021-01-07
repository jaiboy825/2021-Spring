<%@page import="com.mycompany.myhome.board.BoardDto"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>

	<nav class="navbar navbar-expand-sm bg-light navbar-light">
		<ul class="navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="/sms/list">게시판</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="">상품</a></li>
			<li class="nav-item"><a class="nav-link" href="">Logout</a></li>
		</ul>
	</nav>

	<div class="container" style="margin-top: 20px">
		<h2>게시판 글쓰기</h2>
		<p></p>

		<form name="form">
			<input type="hidden" name="pg" value=""> <input type="hidden"
				name="sel" id="sel" value="" />

			<div class="input-group mt-3 mb-3">
				<div class="input-group-prepend">
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle"
						data-toggle="dropdown" id="searchItem">전체</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#" onclick="changeSearch('1')">전체</a>
						<a class="dropdown-item" href="#" onclick="changeSearch('2')">제목</a>
						<a class="dropdown-item" href="#" onclick="changeSearch('3')">내용</a>
						<a class="dropdown-item" href="#" onclick="changeSearch('4')">제목
							+ 내용</a>
					</div>
				</div>
				<input type="text" class="form-control" name="key" id="key" value=""
					placeholder="검색어를 입력하ㅔ요">
				<div class="input-group-append">
					<button class="btn btn-success" type="button" onclick="goSearch()">Go</button>
				</div>
			</div>
			<%
				List<BoardDto> list = (List<BoardDto>) request.getAttribute("boardList");
			%>

			<table class="table">
				<colgroup>
					<col width="8%" />
					<col width="*">
					<col width="12%" />
					<col width="12%">
				</colgroup>
				<thead class="table-primary">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${boardList}">
						<tr>
							<td><c:out value="${dto.id}" />
							<td><c:out value="${dto.title}" />
							<td><c:out value="${dto.writer}" />
							<td><c:out value="${dto.wdate}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="container" style="text-align: right">
				<div class="btn-group">
					<button type="button" class="btn btn-primary" onclick="goWrite()">글쓰기</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>

<script>
	window.onload = goInit();

	function goInit() {
		var key = '1';
		var sel = '1';

		console.log(sel);
		changeSearch(sel);
		document.getElementById("key").value = key;

	}

	function goPage(pg) {
		frm = document.form;
		frm.pg.value = pg;
		frm.action = "/board/list";
		frm.submit();
	}

	function goWrite() {
		frm = document.form;
		frm.action = "/board/write";
		frm.submit();
	}

	function goSearch() {
		frm = document.form;
		frm.action = "/board/list";
		frm.submit();
	}

	function changeSearch(sel) {
		document.getElementById("sel").value = sel;

		if (sel == "1")
			sel = "전체";
		else if (sel == "2")
			sel = "제목";
		else if (sel == "3")
			sel = "내용";
		else if (sel == "4")
			sel = "제목+내용";

		document.getElementById("searchItem").innerHTML = sel;
	}
</script>