<%-- 
    Document   : login
    Created on : Nov 6, 2018, 3:06:38 PM
    Author     : krocos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>

<!DOCTYPE html>
<html lang="en" class="no-js"> 
    <head>
        <meta charset="UTF-8" />
        <title>Login and Registration Form</title>

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/st.css"/>
        <script src="${pageContext.request.contextPath}/script/script.js"></script>

    </head>
    <body onload="disableSubmit()">
        <div class="container">

            <header>
                <h1 style="color: forestgreen">Welcome ! ! ! Please login to enjoy...</h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">


                            <form  action="${pageContext.request.contextPath}/user/checklogin.htm" autocomplete="on" method="POST"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" > Username </label>
                                    <input id="username" name="username" required="required" type="text" placeholder="e.g. young1925"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd"> Password </label>
                                    <input id="password" name="password" required="required" type="password" placeholder="e.g. X8df!90EO" /> 
                                </p>
                                <p class="keeplogin"> 
                                    <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" onchange="activateLoginButton(this)"/> 
                                    <label for="loginkeeping">Confirm log in</label>
                                </p>
                                <div style="color: brown">
                                    ${message}
                                </div>
                                <p class="login button"> 
                                    <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" ></a>
                                </p>
                                <p class="change_link">
                                    Not a member yet ?
                                    <a href="#toregister" class="to_register">Register</a>
                                </p><br><br><br>
                                <p class="signin button"> 
                                    <input type="submit" value="Log in" id="log"/> 
                                </p>                           
                            </form>
                        </div>

                        <div id="register" class="animate form">

                            <spring:form modelAttribute="user" action="${pageContext.request.contextPath}/user/checkregistration.htm" method="POST"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <spring:label path="username" for="usernamesignup" class="uname" >Your username</spring:label>
                                    <spring:input path="username" id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="e.g. takis7" />
                                </p>
                                <p> 
                                    <spring:label path="firstname" for="usernamesignup" class="firstname" >Your firstname</spring:label>
                                    <spring:input path="firstname" id="firstnamesignup" name="firstnamesignup" required="required" type="text" placeholder="" />
                                </p>
                                <p> 
                                    <spring:label path="lastname" for="lastnamesignup" class="lastname" >Your lastname</spring:label>
                                    <spring:input path="lastname" id="lastnamesignup" name="lastnamesignup" required="required" type="text" placeholder="" />
                                </p>
                                <p> 
                                    <spring:label path="email" for="emailsignup" class="youmail"  > Your email</spring:label>
                                    <spring:input path="email" id="emailsignup" name="emailsignup" required="required" type="email" placeholder="e.g. tsoukalas1925@gmail.com"/> 
                                </p>
                                <p> 
                                    <spring:label path="password" for="passwordsignup" class="youpasswd" >Your password</spring:label>
                                    <spring:input path="password" id="passwordsignup" name="passwordsignup" required="required" type="password" placeholder="e.g. X8df!90EO"/>
                                </p>
                                <p> 
                                    <spring:label path="confirmPassword" for="passwordsignup_confirm" class="youpasswd" >Please confirm your password </label></spring:label>
                                    <spring:input path="confirmPassword" id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="eg. X8df!90EO" onkeyup="checkPass(); return false;"/>
                                    <input type="checkbox" name="terms" id="terms" onchange="activateButton(this)" /> 
                                    <label for="terms">I Agree Terms & Coditions </label>
                                    <span id="confirmMessage" class="confirmMessage"></span>
                                </p>

                                <div style="color: brown">
                                    ${message}
                                </div>
                                <p class="signin button"> 
                                    <input type="submit" value="Sign up" id="submit"/> 
                                </p>
                                <p class="change_link">  
                                    Already a member ?
                                    <a href="#tologin" class="to_register">Log in </a>
                                </p>
                            </spring:form>
                        </div>
                    </div>
                </div>  
            </section>
        </div>

        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    </body>
</html>
