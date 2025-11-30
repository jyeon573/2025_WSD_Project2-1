<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardVO" %>

<jsp:include page="header.jsp"/>

<h2 class="mb-4">Board List</h2>

<%
    String keyword = request.getParameter("keyword");
    String sort = request.getParameter("sort");
%>

<!-- ===== 버튼 3개 (왼, 중간, 오른쪽) ===== -->
<div class="row align-items-center mb-4">

    <!-- 왼쪽: New Post -->
    <div class="col text-start">
        <a href="write.jsp" class="btn btn-primary">Write New Post</a>
    </div>

    <!-- 중앙: Sort -->
    <div class="col text-center">
        <span class="me-2 fw-bold">Sort:</span>
        <a href="list.jsp?sort=title" class="btn btn-sm btn-outline-secondary">Title</a>
        <a href="list.jsp?sort=date" class="btn btn-sm btn-outline-secondary">Date</a>
        <a href="list.jsp?sort=hit" class="btn btn-sm btn-outline-secondary">Hit</a>
    </div>

    <!-- 오른쪽: Search -->
    <div class="col text-end">
        <form method="get" action="list.jsp" class="d-inline-flex">
            <input type="text" name="keyword" class="form-control me-2"
                   placeholder="Search"
                   value="<%= keyword == null ? "" : keyword %>">

            <button type="submit" class="btn btn-outline-primary">Search</button>

            <a href="list.jsp" class="btn btn-outline-secondary ms-2">Reset</a>
        </form>
    </div>

</div>
<!-- ===== END 버튼 정렬 ===== -->

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
        List<BoardVO> list;

        if (keyword != null && !keyword.trim().equals("")) {
            // 검색 중이면 검색 우선
            list = dao.searchBoard(keyword.trim());
        } else {
            // 검색이 아니면 정렬 적용
            list = dao.getBoardList(sort);
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