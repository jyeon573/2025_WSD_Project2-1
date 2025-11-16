<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id == null) id = "1";
%>
<html>
<body>
<h2>Post detail (id = <%= id %>)</h2>
<p>Title: First post</p>
<p>Writer: Dayeon</p>
<p>Date: 2025-11-16</p>
<p>Content: This is a mock post content.</p>

<p>
    <a href="edit.jsp?id=<%= id %>">Edit</a> |
    <a href="delete_ok.jsp?id=<%= id %>">Delete</a> |
    <a href="list.jsp">Back to list</a>
</p>
</body>
</html>git