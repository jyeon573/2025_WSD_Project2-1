<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");
%>
<html>
<head>
    <title>Form Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Form Result</h2>

    <div class="card">
        <div class="card-body">
            <p><strong>Name:</strong> <%= name %></p>
            <p><strong>Email:</strong> <%= email %></p>
            <p><strong>Message:</strong></p>
            <div class="border p-3"><%= message %></div>
        </div>
    </div>

    <div class="mt-3">
        <a href="form.html" class="btn btn-primary">Submit Again</a>
        <a href="index.jsp" class="btn btn-secondary">Home</a>
    </div>

</div>
</body>
</html>