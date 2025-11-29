<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");

    int id = 0;
    try {
        id = Integer.parseInt(idStr);
    } catch (Exception e) {
        id = 0;
    }

    BoardVO vo = new BoardVO();
    vo.setId(id);
    vo.setTitle(title);
    vo.setWriter(writer);
    vo.setContent(content);

    BoardDAO dao = new BoardDAO();
    int result = dao.updateBoard(vo);   // 성공하면 1 리턴한다고 가정
%>
<html>
<head>
    <title>Edit Result</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

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

</div>
</body>
</html>