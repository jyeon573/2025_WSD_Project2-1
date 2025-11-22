<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
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

        <h4 class="card-title mb-3"><%= vo.getTitle() %>
        </h4>

        <p><strong>Writer:</strong> <%= vo.getWriter() %>
        </p>
        <p><strong>Date:</strong> <%= vo.getRegdate() %>
        </p>
        <p><strong>Hit:</strong> <%= vo.getHit() %>
        </p>

        <hr>

        <p style="white-space: pre-line;"><%= vo.getContent() %>
        </p>

    </div>
</div>

<div class="mt-3">
    <a href="list.jsp" class="btn btn-secondary">Back to List</a>
    <a href="delete_ok.jsp?id=<%= vo.getId() %>" class="btn btn-danger">Delete</a>
</div>

<%
    }
%>

</div>
</body>
</html>