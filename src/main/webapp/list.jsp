<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">Board List</h2>

<!-- Search form -->
<form method="get" action="list.jsp" class="row g-2 mb-3">
    <div class="col-auto">
        <input type="text" name="keyword" class="form-control"
               placeholder="Search by title or content"
               value="<%= request.getParameter("keyword") == null ? "" : request.getParameter("keyword") %>">
    </div>

    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary">Search</button>
    </div>

    <div class="col-auto">
        <a href="list.jsp" class="btn btn-outline-secondary">Reset</a>
    </div>
</form>

<!-- Buttons -->
<div class="mb-3">
    <a href="write.jsp" class="btn btn-primary">Write New Post</a>
    <a href="index.jsp" class="btn btn-secondary">Home</a>
</div>

<!-- Board table -->
<table class="table table-bordered table-hover">
    <thead class="table-light">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Writer</th>
        <th>Date</th>
        <th>Hit</th>
        <th>File</th>
        <th>Actions</th>
    </tr>
    </thead>

    <tbody>
    <%
        BoardDAO dao = new BoardDAO();
        String keyword = request.getParameter("keyword");

        List<BoardVO> list;
        if (keyword != null && !keyword.trim().equals("")) {
            list = dao.searchBoard(keyword.trim());
        } else {
            list = dao.getBoardList();
        }

        for (BoardVO vo : list) {
    %>
    <tr>
        <td><%= vo.getId() %></td>

        <td>
            <a href="view.jsp?id=<%= vo.getId() %>">
                <%= vo.getTitle() %>
            </a>
        </td>

        <td><%= vo.getWriter() %></td>
        <td><%= vo.getRegdate() %></td>
        <td><%= vo.getHit() %></td>

        <!-- 파일 여부 -->
        <td>
            <%
                String fn = vo.getFileName();
                if (fn != null && !fn.isEmpty()) {
            %>
            📎
            <%
                }
            %>
        </td>

        <td>
            <a href="delete_ok.jsp?id=<%= vo.getId() %>"
               class="btn btn-sm btn-danger"
               onclick="return confirm('Are you sure you want to delete this post?');">
                Delete
            </a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<jsp:include page="footer.jsp"/>