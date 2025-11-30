<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="header.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");

    // 업로드 설정
    String uploadPath = request.getServletContext().getRealPath("upload");
    int sizeLimit = 10 * 1024 * 1024; // 10MB

    MultipartRequest multi = null;
    int result = 0;

    try {
        multi = new MultipartRequest(
                request,
                uploadPath,
                sizeLimit,
                "UTF-8",
                new DefaultFileRenamePolicy()
        );

        String title = multi.getParameter("title");
        String writer = multi.getParameter("writer");
        String content = multi.getParameter("content");

        // 업로드된 실제 파일 이름 (중복 시 rename된 이름)
        String fileName = multi.getFilesystemName("uploadFile");

        BoardVO vo = new BoardVO();
        vo.setTitle(title);
        vo.setWriter(writer);
        vo.setContent(content);
        vo.setFileName(fileName);  // null이면 첨부 없음

        BoardDAO dao = new BoardDAO();
        result = dao.insertBoard(vo);

    } catch (Exception e) {
        e.printStackTrace();
        result = 0;
    }
%>

<h2 class="mb-4">Write Result</h2>

<%
    if (result == 1) {
%>
<div class="alert alert-success">The post has been added successfully.</div>
<%
} else {
%>
<div class="alert alert-danger">Failed to save the post.</div>
<%
    }
%>

<a href="list.jsp" class="btn btn-secondary mt-3">Back to List</a>

<jsp:include page="footer.jsp"/>