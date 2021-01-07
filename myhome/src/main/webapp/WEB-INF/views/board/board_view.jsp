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
		<h2>게시판 상세보기</h2>
		<p></p>
		<form>
			<table class="table">
				<colgroup>
					<col width="25%" />
					<col width="*" />
				</colgroup>

				<tbody>
					<tr>
						<td>제목</td>
						<td>제목입니다</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>홍길동</td>

					</tr>
					<tr>
						<td>내용</td>
						<td>내용입니다</td>

					</tr>

					<tr>
						<td></td>
						<td></td>
					</tr>

				</tbody>
			</table>

			<div class="container" style="text-align: right">
				<div class="btn-group">
					<button type="button" class="btn btn-primary">답글</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary">수정</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-danger">삭제</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-primary">목록</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>