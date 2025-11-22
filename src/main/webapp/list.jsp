<%@ page import="java.util.List" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Board List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Board List</h2>

    <div class="mb-3">
        <a href="write.jsp" class="btn btn-primary">Write New Post</a>
        <a href="index.jsp" class="btn btn-secondary">Home</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Date</th>
            <th>Hit</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
            BoardDAO dao = new BoardDAO();
            List<BoardVO> list = dao.getBoardList();

            for (BoardVO vo : list) {
        %>
        <tr>
            <td><%= vo.getId() %></td>
            <td><%= vo.getTitle() %></td>
            <td><%= vo.getWriter() %></td>
            <td><%= vo.getRegdate() %></td>
            <td><%= vo.getHit() %></td>
            <td>
                <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>
</body>
</html>