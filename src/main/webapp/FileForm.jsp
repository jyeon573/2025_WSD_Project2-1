<!-- fileform.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>

<h2>파일 업로드</h2>

<!-- 반드시 enctype="multipart/form-data" 필요 -->
<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
    제목: <input type="text" name="title"><br><br>

    업로드 파일: <input type="file" name="photo"><br><br>

    <input type="submit" value="업로드">
</form>