<%-- 
    Document   : successlogin
    Created on : Nov 8, 2018, 11:23:16 AM
    Author     : krocos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succeed login</title>

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/st.css"/>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1 Succeess login!!!</h1>
                <h2 style="color: forestgreen">WELCOME ${user.username} </h2>
            </div><br><br>
            <div class="row">
                <table class="table" style="color: forestgreen">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Username</th>
                            <th scope="col">Firstname</th>
                            <th scope="col">Lastname</th>
                            <th scope="col">E-mail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <th>${user.username}</th>
                            <th>${user.firstname}</th>
                            <th>${user.lastname}</th>
                            <th>${user.email}</th>
                        </tr>
                    </tbody>
                </table>
            </div><br><br>
            <div class="row">
                <a href="${pageContext.request.contextPath}/user/createform.htm" class="btn btn-primary" role="button">Back</a>
            </div> 

        </div>      

        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    </body>
</html>
