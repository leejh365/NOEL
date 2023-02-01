<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <link rel="shortcut icon" href="./resources/img/index/favicon (1).ico" /> 
	<title>bonjour noël</title>
   <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
   <style>
      .btnWrap {
         text-align: center;
         margin-bottom: 50px;
      }
      .btnWrap>button {
         display: inline-block;
         font-weight: 400;
         text-align: center;
         vertical-align: middle;
         user-select: none;
         border: 1px solid transparent;
         padding: 0.375rem 0.75rem;
         font-size: 0.9375rem;
         line-height: 1;
         border-radius: 0.1875rem;
         transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
         border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
         margin-right: 10px;
         height: 40px;
         width: 100%;
         margin-top: 30px;
         border: 1px solid rgb(51, 51, 51);
         background-color: rgb(51, 51, 51);
         color: #fff;
      }
      .btnWrap>button[type=submt] {
         border: 1px solid rgb(51, 51, 51);
         background-color: rgb(51, 51, 51);
         color: #fff;
      }
      .btnWrap>button[type=submit]:hover {
         cursor: pointer;
         background-color: #fff;
         color: rgb(51, 51, 51);
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
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/class/classDetail.css">
<link rel="stylesheet" href="/resources/css/class/marketerClassMypage.css">
<div class="content-wrap" style="height: auto;">
<jsp:include page="/WEB-INF/views/common/marketerHeader.jsp" />
<article id="content" class="content">
<div class="contents">
<div class="col-12 grid-margin stretch-card" style="margin-bottom: 200px;">
   <div class="card">
      <div class="card-body">
      <div class="directoryDiv">mypage > 예약 내역 > 리뷰 등록</div>
         <br>
         <h1 class="card-title">클래스 리뷰 등록</h1>
         <br>
         <form id="addClassReview" method="post" action="/class/addClassReview" enctype="multipart/form-data">
         <input type="hidden" name="userId" name="userId" value="${sessionScope.m.userId }">
         <input type="hidden" id="classNo" name="classNo" value="${classNo}"/>
         <input type="hidden" id="className" name="className" value="${className}"/>
         
         
            <div class="form-group">
               <label for="inputReviewName">제목</label>
               <br>
               <input type="text" class="form-control" id="classReviewName" name="classReviewName" placeholder="클래스 가격을 입력하세요."
                      required oninvalid="this.setCustomValidity('리뷰 제목을 입력하세요')" oninput="this.setCustomValidity('')">
            </div>
            <br>

            <div class="form-group">
               <label for="summernote">클래스 내용을 입력하세요</label>
               <br>
               <textarea class="form-control" name="classReviewContent" id="summernote" rows="4" required oninvalid="this.setCustomValidity('클래스 설명을 입력하세요')" oninput="this.setCustomValidity('')" style="margin: 10px 0;"></textarea>
            </div>
            <div>
               <input type="file" name="file" class="file-upload" id="file" style="display: none;" accept="image/gif, image/jpg, image/jpeg, image/png">
               <button class="inputPhoto" type="button" id="inputPhoto">썸네일 첨부하기</button>
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
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/class/addClass.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script>
   /* 이미지 업로드 */
   (function($)
   {
      'use strict';
      $(function()
      {
         $('.inputPhoto').on('click', function()
         {
            var file = $(this).parent().find('.file-upload');
            file.trigger('click');
         });
         $('.file-upload').on('change', function()
         {
            if ($(this).val() == '')
            {
               $(this).parent().find('.inputPhoto').text('썸네일 첨부하기');
            }
            else
            {
               $(this).parent().find('.inputPhoto').text($(this).val().replace(/C:\\fakepath\\/i, ''));
            }
         });
      });
   })(jQuery);
   $("#submitBtn").on('click', function(event)
   {
      const fileValue = $('.inputPhoto').text();
      if (fileValue == '사진 첨부하기')
      {
         event.preventDefault();
         alert("사진을 첨부해주세요.");
      }
   });
   $('#summernote').summernote(
           {
              height : 400,
              lang : "ko-KR",
              callbacks :
                      {
                         onImageUpload : function(files)
                         {
                            uploadImage(files[0], this);
                         }
                      }
           });
   function uploadImage(files, editor)
   {
      const form = new FormData();
      form.append("files", files);
      $.ajax(
              {
                 url : "/classReviewEditorUpload",
                 type : "post",
                 data : form,
                 processData : false,
                 contentType : false,
                 success : function(data)
                 {
                    $(editor).summernote("insertImage", data);
                 }
              });
   }
</script>
</body>
</html>