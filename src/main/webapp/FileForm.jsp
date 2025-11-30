<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<h2>파일 업로드 테스트</h2>

<form method="post" action="FileUpload.jsp" enctype="multipart/form-data">
    파일 선택: <input type="file" name="photo"><br><br>
    <input type="submit" value="upload">
</form>