<%@ page import="dao.ItemDAO" %>
<%@ page import="java.io.*" %>

<%
    String message = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");

        if (name != null && category != null && price != null &&
            !name.isEmpty() && !category.isEmpty() && !price.isEmpty()) {

            double p = Double.parseDouble(price);

            ItemDAO.insertItem(name, category, p);
            message = "Item inserted successfully!";
        } else {
            message = "All fields are required!";
        }
    }
%>

<html>
<head>
    <title>Insert Item</title>
</head>
<body>
<h1>Insert New Item</h1>

<form method="post" action="insert.jsp">
    <label>Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Category:</label><br>
    <input type="text" name="category" required><br><br>

    <label>Price:</label><br>
    <input type="number" name="price" step="0.01" required><br><br>

    <input type="submit" value="Insert Item">
</form>

<br>

<% if (!message.isEmpty()) { %>
    <p><b><%= message %></b></p>
<% } %>

<br>
<a href="index.jsp">Back</a>

</body>
</html>

