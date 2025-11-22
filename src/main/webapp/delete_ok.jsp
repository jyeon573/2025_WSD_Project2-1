<%@ page import="board.BoardDAO" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    BoardDAO dao = new BoardDAO();
    int result = dao.deleteBoard(id);
%>
<html>
<head>
    <title>Delete Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Delete Result</h2>

    <%
        if (result == 1) {
    %>
    <div class="alert alert-success">Post <strong><%= id %></strong> has been deleted.</div>
    <%
    } else {
    %>
    <div class="alert alert-danger">Delete failed.</div>
    <%
        }
    %>

    <a href="list.jsp" class="btn btn-secondary">Back to List</a>

</div>
</body>
</html>