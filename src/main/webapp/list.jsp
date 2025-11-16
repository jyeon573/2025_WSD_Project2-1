<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<body>
<h2>Board list</h2>
<table border="1">
    <tr>
        <th>No</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Date</th>
        <th>Actions</th>
    </tr>
    <tr>
        <td>1</td>
        <td><a href="detail.jsp?id=1">First post</a></td>
        <td>Dayeon</td>
        <td>2025-11-16</td>
        <td>
            <a href="edit.jsp?id=1">edit</a> |
            <a href="delete_ok.jsp?id=1">delete</a>
        </td>
    </tr>
    <!-- 2~5번까지 비슷하게 하드코딩 -->
</table>

<p><a href="write.jsp">Write new post</a></p>
<p><a href="index.jsp">Home</a></p>
</body>
</html>