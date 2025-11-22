<jsp:include page="header.jsp"/>

<h2 class="mb-4">Edit Contact (id = <%= id %>)</h2>

<form action="edit_ok.jsp" method="post" class="row g-3">
    <input type="hidden" name="id" value="<%= id %>">

    <div class="col-md-6">
        <label class="form-label">Name</label>
        <input type="text" name="name" class="form-control" value="Reynie Muldoon" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Phone</label>
        <input type="text" name="phone" class="form-control" value="010-1111-2222" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" value="reynie@benedict.org" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Birthday</label>
        <input type="date" name="birthday" class="form-control" value="2005-03-15" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Age</label>
        <input type="number" name="age" class="form-control" value="20" required>
    </div>

    <div class="col-12">
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    </div>

</form>

<jsp:include page="footer.jsp"/>