<%@ page import="dao.ItemDAO" %>

<%
    String id = request.getParameter("id");

    if (id != null) {
        ItemDAO.deleteItem(Integer.parseInt(id));
        response.sendRedirect("view.jsp");
        return;
    }
%>

<html>
<head>
    <title>Delete Item</title>
</head>
<body>

<h2>Delete Item</h2>

<form method="post">
    Item ID:<br>
    <input type="number" name="id" required><br><br>

    <input type="submit" value="Delete Item">
</form>

<br>
<a href="index.jsp">Back</a>

</body>
</html>
