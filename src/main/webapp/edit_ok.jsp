<<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String birthday = request.getParameter("birthday");
%>
<html>
<head>
    <title>Edit Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Edit Result</h2>

    <div class="card">
        <div class="card-body">
            <p><strong>Id:</strong> <%= id %></p>
            <p><strong>Name:</strong> <%= name %></p>
            <p><strong>Phone:</strong> <%= phone %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Birthday:</strong> <%= birthday %></p>
        </div>
    </div>

    <div class="mt-3">
        <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    </div>

</div>
</body>
</html>