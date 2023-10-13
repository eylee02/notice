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
</head>
<body>

  <div>
    <h1>공지 작성하기</h1>
  </div>
  
  <div>
    <form method="post" action="${contextPath}/notice/add.do">
      <div>
      <label for="gubun">구분</label>
      <select name="gubun">  
        <option selected>1</option>
        <option>2</option>
      </select>
      </div>
      <div>
      <label for="title">제목</label>
      <input type="text" id="title" name="title">
      </div>
      <div>
      <label for="content">내용</label>
      <textarea id="content" name="content" cols="50" rows="5"></textarea>
      </div>
      <div>
        <button type="submit">작성완료</button>
        <button type="button" onclick="location.href=${contextPath}/notice/list.do">목록</button>
      </div>
    </form>
  </div>

</body>
</html>