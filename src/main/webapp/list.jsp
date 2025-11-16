<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Contact List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">
<div class="container">

    <h2 class="mb-4">Contact List</h2>

    <div class="mb-3">
        <a href="write.jsp" class="btn btn-primary">Write New Contact</a>
        <a href="index.jsp" class="btn btn-secondary">Home</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-light">
        <tr>
            <th>No</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Birthday</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>1</td>
            <td><a href="detail.jsp?id=1">Reynie Muldoon</a></td>
            <td>010-1111-2222</td>
            <td>reynie@benedict.org</td>
            <td>2005-03-15</td>
            <td>
                <a href="edit.jsp?id=1" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=1" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>2</td>
            <td><a href="detail.jsp?id=2">Kate Wetherall</a></td>
            <td>010-5555-6666</td>
            <td>kate@benedict.org</td>
            <td>2004-11-05</td>
            <td>
                <a href="edit.jsp?id=2" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=2" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>3</td>
            <td><a href="detail.jsp?id=3">Constance Contraire</a></td>
            <td>010-7777-8888</td>
            <td>constance@benedict.org</td>
            <td>2016-01-30</td>
            <td>
                <a href="edit.jsp?id=3" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=3" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>4</td>
            <td><a href="detail.jsp?id=4">Mr. Benedict</a></td>
            <td>010-9999-0000</td>
            <td>benedict@benedict.org</td>
            <td>1969-06-09</td>
            <td>
                <a href="edit.jsp?id=4" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=4" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>5</td>
            <td><a href="detail.jsp?id=5">Number Two</a></td>
            <td>010-1212-3434</td>
            <td>numbertwo@benedict.org</td>
            <td>1970-04-18</td>
            <td>
                <a href="edit.jsp?id=5" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=5" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>6</td>
            <td><a href="detail.jsp?id=6">Rhonda Kazembe</a></td>
            <td>010-5656-7878</td>
            <td>rhonda@benedict.org</td>
            <td>1988-09-12</td>
            <td>
                <a href="edit.jsp?id=6" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=6" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>

        <tr>
            <td>7</td>
            <td><a href="detail.jsp?id=7">Milligan</a></td>
            <td>010-9090-1010</td>
            <td>milligan@benedict.org</td>
            <td>1988-12-25</td>
            <td>
                <a href="edit.jsp?id=7" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete_ok.jsp?id=7" class="btn btn-sm btn-danger">Delete</a>
            </td>
        </tr>
        </tbody>
    </table>

</div>
</body>
</html>