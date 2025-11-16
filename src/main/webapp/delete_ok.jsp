<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8"%>
<%
    String id = request.getParameter("id");
    if (id == null) id = "1";
%>
<html>
<head>
    <title>Delete Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Delete Result</h2>

    <div class="alert alert-danger" role="alert">
        Contact with id <strong><%= id %></strong> has been deleted (mock).
    </div>

    <a href="list.jsp" class="btn btn-secondary">Back to List</a>

</div>
</body>
</html>