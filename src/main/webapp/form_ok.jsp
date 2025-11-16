<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String title = request.getParameter("title");
    String phone = request.getParameter("phone");
    String age = request.getParameter("age");
%>
<html>
<body>
<h2>Form result</h2>
<p>Name: <%= name %>
</p>
<p>Email: <%= email %>
</p>
<p>Title: <%= title %>
</p>
<p>Phone: <%= phone %>
</p>
<p>Age: <%= age %>
</p>
<p><a href="index.jsp">Back</a></p>
</body>
</html>