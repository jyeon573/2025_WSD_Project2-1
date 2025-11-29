<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<jsp:include page="header.jsp"/>

<%
    request.setCharacterEncoding("UTF-8");

    String uploadPath = request.getServletContext().getRealPath("upload");
    int sizeLimit = 10 * 1024 * 1024;

    MultipartRequest multi = null;
    int result = 0;
    int id = 0;

    try {
        multi = new MultipartRequest(
                request,
                uploadPath,
                sizeLimit,
                "UTF-8",
                new DefaultFileRenamePolicy()
        );

        String idStr = multi.getParameter("id");
        String title = multi.getParameter("title");
        String writer = multi.getParameter("writer");
        String content = multi.getParameter("content");

        String oldFileName = multi.getParameter("oldFileName");      // 기존 파일 이름
        String newFileName = multi.getFilesystemName("uploadFile");  // 새로 업로드한 파일 이름

        try {
            id = Integer.parseInt(idStr);
        } catch (Exception e) {
            id = 0;
        }

        // 새 파일이 올라왔으면 기존 파일 삭제
        if (newFileName != null && !newFileName.isEmpty()) {
            if (oldFileName != null && !oldFileName.isEmpty()) {
                File oldFile = new File(uploadPath, oldFileName);
                if (oldFile.exists()) oldFile.delete();
            }
        }

        // 최종 fileName (새 파일 있으면 새 파일, 없으면 기존 파일 유지)
        String finalFileName = (newFileName != null && !newFileName.isEmpty())
                ? newFileName
                : (oldFileName == null || oldFileName.isEmpty() ? null : oldFileName);

        BoardVO vo = new BoardVO();
        vo.setId(id);
        vo.setTitle(title);
        vo.setWriter(writer);
        vo.setContent(content);
        vo.setFileName(finalFileName);

        BoardDAO dao = new BoardDAO();
        result = dao.updateBoard(vo);

    } catch (Exception e) {
        e.printStackTrace();
        result = 0;
    }
%>

<h2 class="mb-4">Edit Result</h2>

<%
    if (result == 1) {
%>
<div class="alert alert-success">The post has been updated successfully.</div>
<%
} else {
%>
<div class="alert alert-danger">Failed to update the post.</div>
<%
    }
%>

<div class="mt-3">
    <a href="view.jsp?id=<%= id %>" class="btn btn-primary">Back to Post</a>
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
</div>

<jsp:include page="footer.jsp"/>