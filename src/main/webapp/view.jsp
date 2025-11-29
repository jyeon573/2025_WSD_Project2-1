<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String idStr = request.getParameter("id");
    int id = 0;
    try {
        id = Integer.parseInt(idStr);
    } catch (Exception e) { id = 0; }

    BoardDAO dao = new BoardDAO();
    BoardVO vo = dao.getBoardById(id);
%>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">View Post</h2>

<%
    if (vo == null) {
%>
<div class="alert alert-danger">No post found.</div>
<a href="list.jsp" class="btn btn-secondary">Back to List</a>
<%
} else {
%>

<div class="card">
    <div class="card-body">

        <h4 class="card-title mb-3"><%= vo.getTitle() %></h4>

        <p><strong>Writer:</strong> <%= vo.getWriter() %></p>
        <p><strong>Date:</strong> <%= vo.getRegdate() %></p>
        <p><strong>Hit:</strong> <%= vo.getHit() %></p>

        <%
            String fileName = vo.getFileName();
            if (fileName != null && !fileName.isEmpty()) {
        %>
        <p><strong>File:</strong>
            <a href="<%= request.getContextPath() %>/upload/<%= fileName %>" download>
                <%= fileName %>
            </a>
        </p>

        <!-- 이미지인 경우 미리보기 -->
        <img src="<%= request.getContextPath() %>/upload/<%= fileName %>"
             alt="attachment"
             class="img-fluid mt-2">
        <%
            }
        %>

        <hr>

        <p style="white-space: pre-line;"><%= vo.getContent() %></p>

    </div>
</div>

<div class="mt-3">
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    <a href="edit.jsp?id=<%= vo.getId() %>" class="btn btn-primary">Edit</a>
    <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-danger"
       onclick="return confirm('Are you sure you want to delete this post?');">
        Delete
    </a>
</div>

<%
    }
%>

<jsp:include page="footer.jsp"/>