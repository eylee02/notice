<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
  $(function(){
  	fnDeleteNotice();
  	fnListNotice();
  	fnEditNotice();
  })
  
  functuin fnEditNotice(){
	  var editResult= '${editResult}';
	  if(editResult !== ''){
		  if(editResult === '1'){
			  alert('공지사항이 수정되었습니다.');
		  } else {
			  alert('공지사항 수정에 실패했습니다.');
		  }
	  }
	  
  }
  
  function fnEditNotice(){
	  #('#btn_edit').click(function(){
		  location.href = "${contectPath}/notice/edit.do";
	  })
  }
  
  
  function fnDeleteNotice(){
	  $('#btn_delete').click(function(){
		  if(confirm('공지사항을 삭제할까요?')){
			  $('#frm_detail').attr('action', '${contextPath}/notice/delete.do');
				 $('#frm_detail').submit();
		  }
	  })
	  
	function fnListNotice(){
		  $('#btn_list').click(function(){
			  location.href = "${contextPath}/notice/list.do";
		  })
		  
	  }
	  
  }

</script>


</head>
<body>

  <div>
    <h1>${notice.notice_no}공지사항</h1>
    <form id="frm_detail" method="post" action="${contextPath}/notice/edit.do">
      <div>
      구분 : ${notice.gubun}
      </div>
      <div>
      제목 : ${notice.title}
      </div>
      <div>
      ${notice.content}
      </div>
    </form>
    
    <hr>
    <div>
      <button type="button" id="btn_edit">편집</button>
      <button type="button" id="btn_delete">삭제</button>
      <button type="button" id="btn_list">목록</button>
    </div>
  </div>

</body>
</html>