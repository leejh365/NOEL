<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
hr {
	background: gainsboro;
	height: 1px;
	border: 0;
	margin-bottom: 50px;
}

.inputPhoto {
	width: 100%;
	height: 50px;
	border: 1px dashed gray;
	background-color: transparent;
}

.inputPhoto:hover {
	cursor: pointer;
	background: rgb(51, 51, 51);
	color: #fff;
}

input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">
	<link rel="stylesheet" href="/resources/css/class/classDetail.css">
	<div class="content-wrap">
		<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
		<article id="content" class="content">
		<div class="contents">
		<div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
   		<div class="card">
      		<div class="card-body">
      		<div class="directoryDiv">mypage > 클래스 관리 > 메뉴 등록</div>
         	<br>
         		<h1 class="card-title">메뉴 등록</h1>
				<br>
					<form class="mb-3" id="menuForm" method="post" action="/addMenu" enctype="multipart/form-data">
						<div class="form-group">
							<label for="inputMenuName">메뉴 이름을 입력하세요</label>
							<br>
							<input type="text" class="form-control" id="menuName" name="menuName" placeholder="예) 마들렌" 
								required oninvalid="this.setCustomValidity('메뉴명을 입력하세요')" oninput="this.setCustomValidity('')">
						</div>
						<Br>
						<div class="form-group">
							<label for="inputMenuPrice"> 메뉴 가격을 입력하세요</label>
							<Br>
							<input type="number" class="form-control" id="menuPrice" name="menuPrice" placeholder="예) 2,000원 → 2000" 
								required oninvalid="this.setCustomValidity('가격을 입력하세요')" oninput="this.setCustomValidity('')">
						</div>
						<Br>
						<div>
							<input type="hidden" name="classNo" value="${classNo }">
							<input type="hidden" name="marketerId" value="${sessionScope.mk.marketerId }">
							<input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
							<button class="inputPhoto" type="button" id="inputPhoto">사진 첨부하기</button>
						</div>
						<br>
						<div>
            				<button type="submit" class="btn btn-brand" id="font">저장</button>
               				<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
            			</div>
					</form>
				</div>
			</div>
			</div>
			</div>
		</article>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
	<script>
		(function($) {
			'use strict';
			$(function() {
				$('.inputPhoto').on('click', function() {
					var file = $(this).parent().find('.file-upload');
					file.trigger('click');
				});
				$('.file-upload').on('change', function() {
					if ($(this).val() == '') {
						$(this).parent().find('.inputPhoto').text('사진 첨부하기');
					} else {
						$(this).parent().find('.inputPhoto').text($(this).val().replace(/C:\\fakepath\\/i, ''));
					}
				});
			});
		})(jQuery);

		$("#submitBtn").on('click', function(event) {
			const fileValue = $('.inputPhoto').text();
			if (fileValue == '사진 첨부하기') {
				event.preventDefault();
				alert("사진을 첨부해주세요.");
			}
		});
	</script>
</body>
</html>