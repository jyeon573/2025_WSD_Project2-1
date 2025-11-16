<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
%>
<html>
<body>
<h2>Edit result</h2>
<p>Id: <%= id %></p>
<p>Title: <%= title %></p>
<p>Writer: <%= writer %></p>
<p>Content:</p>
<pre><%= content %></pre>
<p><a href="list.jsp">Back to list</a></p>
</body>
</html>