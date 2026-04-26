<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Optional: simple session check (basic login protection)
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Dashboard - Bank Management System</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
            text-align: center;
        }

        .container {
            margin-top: 80px;
        }

        .box {
            background: white;
            width: 400px;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        a {
            display: block;
            margin: 10px;
            padding: 10px;
            background: green;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background: darkgreen;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="box">

        <h2>Welcome to Dashboard 🏦</h2>

        <p>Hello, <b><%= user %></b></p>

        <a href="deposit.jsp">Deposit Money</a>

        <a href="withdraw.jsp">Withdraw Money</a>

        <a href="logout.jsp">Logout</a>

    </div>

</div>

</body>
</html>
