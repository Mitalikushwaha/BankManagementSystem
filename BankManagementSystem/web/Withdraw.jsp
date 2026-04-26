<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Basic session check (recommended)
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Withdraw Money</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            text-align: center;
            padding-top: 60px;
        }

        .box {
            background: white;
            width: 350px;
            margin: auto;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }

        input {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            width: 95%;
            padding: 10px;
            background: red;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: darkred;
        }

        a {
            text-decoration: none;
            color: blue;
        }
    </style>
</head>

<body>

<div class="box">

    <h2>Withdraw Money 💸</h2>

    <form action="WithdrawServlet" method="post">

        <input type="number" name="amount" placeholder="Enter amount" required>

        <button type="submit">Withdraw</button>

    </form>

    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>
