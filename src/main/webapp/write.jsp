<jsp:include page="header.jsp"/>

<h2 class="mb-4">Write New Post</h2>

<form action="write_ok.jsp" method="post" class="row g-3">

    <div class="col-md-6">
        <label class="form-label">Title</label>
        <input type="text" name="title" class="form-control" required>
    </div>

    <div class="col-md-6">
        <label class="form-label">Writer</label>
        <input type="text" name="writer" class="form-control" required>
    </div>

    <div class="col-12">
        <label class="form-label">Content</label>
        <textarea name="content" class="form-control" rows="5" required></textarea>
    </div>

    <div class="col-12">
        <button type="submit" class="btn btn-primary">Submit</button>
        <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    </div>

</form>

<jsp:include page="footer.jsp"/>