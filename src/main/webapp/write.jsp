<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Write Contact</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Write New Contact</h2>

    <form action="write_ok.jsp" method="post" class="row g-3">

        <div class="col-md-6">
            <label class="form-label">Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Phone</label>
            <input type="text" name="phone" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Birthday</label>
            <input type="date" name="birthday" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Age</label>
            <input type="number" name="age" class="form-control" required>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="list.jsp" class="btn btn-secondary">Back to List</a>
        </div>

    </form>

</div>
</body>
</html>