<%@ page import="dao.ItemDAO" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>View Items</title>
</head>
<body>

<h1>View Items</h1>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Category</th>
        <th>Price</th>
    </tr>

    <%
        List<String[]> items = ItemDAO.getAllItems();
        for (String[] item : items) {
    %>
        <tr>
            <td><%= item[0] %></td>
            <td><%= item[1] %></td>
            <td><%= item[2] %></td>
            <td><%= item[3] %></td>
        </tr>
    <%
        }
    %>

</table>

<br>
<a href="index.jsp">Back</a>

</body>
</html>
