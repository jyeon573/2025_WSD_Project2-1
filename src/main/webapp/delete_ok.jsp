<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id == null) id = "1";
%>
<html>
<body>
<h2>Delete result</h2>
<p>Post with id <%= id %> has been deleted (mock).</p>
<p><a href="list.jsp">Back to list</a></p>
</body>
</html>