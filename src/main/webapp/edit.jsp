<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    if (id == null) id = "1";
%>
<html>
<body>
<h2>Edit post (id = <%= id %>)</h2>
<form action="edit_ok.jsp" method="post">
    <input type="hidden" name="id" value="<%= id %>">
    <p>Title: <input type="text" name="title" value="First post"></p>
    <p>Writer: <input type="text" name="writer" value="Dayeon"></p>
    <p>Content:<br>
        <textarea name="content" rows="5" cols="40">This is a mock post content.</textarea>
    </p>
    <button type="submit">Save</button>
</form>
<p><a href="list.jsp">Back to list</a></p>
</body>
</html>