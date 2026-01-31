<%@ page import="dao.ItemDAO" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");

    // When form is submitted
    if (id != null && name != null && category != null && price != null) {
        ItemDAO.updateItem(
            Integer.parseInt(id),
            name,
            category,
            Double.parseDouble(price)
        );
        response.sendRedirect("view.jsp");
        return;
    }
%>

<html>
<head>
    <title>Update Item</title>
</head>
<body>

<h2>Update Item</h2>

<form method="post">

    ID:<br>
    <input type="number" name="id" required><br><br>

    Name:<br>
    <input type="text" name="name" required><br><br>

    Category:<br>
    <input type="text" name="category" required><br><br>

    Price:<br>
    <input type="number" step="0.01" name="price" required><br><br>

    <input type="submit" value="Update Item">

</form>

<br>
<a href="index.jsp">Back</a>

</body>
</html>
