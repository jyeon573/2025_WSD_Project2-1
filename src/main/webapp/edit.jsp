<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    int id = 0;
    try {
        id = Integer.parseInt(idStr);
    } catch (Exception e) {
        id = 0;
    }

    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getBoardById(id);
%>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">Edit Post</h2>

<%
    if (vo == null) {
%>
<div class="alert alert-danger">No post found.</div>
<a href="list.jsp" class="btn btn-secondary">Back to List</a>
<%
} else {
%>
<form action="edit_ok.jsp" method="post">
    <!-- id는 숨겨서 같이 보냄 -->
    <input type="hidden" name="id" value="<%= vo.getId() %>">

    <div class="mb-3">
        <label for="title" class="form-label">Title</label>
        <input type="text" id="title" name="title"
               class="form-control"
               value="<%= vo.getTitle() %>" required>
    </div>

    <div class="mb-3">
        <label for="writer" class="form-label">Writer</label>
        <input type="text" id="writer" name="writer"
               class="form-control"
               value="<%= vo.getWriter() %>" required>
    </div>

    <div class="mb-3">
        <label for="content" class="form-label">Content</label>
        <textarea id="content" name="content" rows="10"
                  class="form-control" required><%= vo.getContent() %></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Save</button>
    <a href="view.jsp?id=<%= vo.getId() %>" class="btn btn-secondary">Cancel</a>
</form>
<%
    }
%>

<jsp:include page="footer.jsp"/>