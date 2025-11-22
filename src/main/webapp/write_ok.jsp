<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");

    BoardVO vo = new BoardVO();
    vo.setTitle(title);
    vo.setWriter(writer);
    vo.setContent(content);

    BoardDAO dao = new BoardDAO();
    int result = dao.insertBoard(vo);   // 성공하면 1
%>
<html>
<head>
    <title>Write Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

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

</div>
</body>
</html>