<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Register - Bank Management System</title>

    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
            text-align: center;
            padding-top: 60px;
        }

        .box {
            background: white;
            width: 380px;
            margin: auto;
            padding: 30px;
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
            background: blue;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: darkblue;
        }

        a {
            text-decoration: none;
            color: green;
        }
    </style>
</head>

<body>

<div class="box">

    <h2>Create Account</h2>

    <form action="RegisterServlet" method="post">

        <input type="text" name="name" placeholder="Enter Name" required>

        <input type="text" name="email" placeholder="Enter Email" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Register</button>

    </form>

    <br>
    <a href="login.jsp">Already have an account? Login</a>

</div>

</body>
</html>
