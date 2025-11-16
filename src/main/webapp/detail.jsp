<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String id = request.getParameter("id");
    if (id == null) id = "1";
    // 실제 DB는 없어서 예시 데이터 한 세트만 사용
%>
<html>
<head>
    <title>Contact Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Contact Detail (id = <%= id %>)</h2>

    <div class="card">
        <div class="card-body">
            <p><strong>Name:</strong> Reynie Muldoon</p>
            <p><strong>Phone:</strong> 010-1111-2222</p>
            <p><strong>Email:</strong> reynie@benedict.org</p>
            <p><strong>Birthday:</strong> 2005-03-15</p>
            <p><strong>Age:</strong> 20</p>
        </div>
    </div>

    <div class="mt-3">
        <a href="edit.jsp?id=<%= id %>" class="btn btn-warning">Edit</a>
        <a href="delete_ok.jsp?id=<%= id %>" class="btn btn-danger">Delete</a>
        <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    </div>

</div>
</body>
</html>