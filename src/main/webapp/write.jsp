<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<body>
<h2>Write new post</h2>
<form action="write_ok.jsp" method="post">
    <p>Title: <input type="text" name="title"></p>
    <p>Writer: <input type="text" name="writer"></p>
    <p>Content:<br>
        <textarea name="content" rows="5" cols="40"></textarea>
    </p>
    <button type="submit">Submit</button>
</form>
<p><a href="list.jsp">Back to list</a></p>
</body>
</html>