<%@page import="java.util.List"%>
<%@page import="entity.Museum"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="parts/header.jsp" %>

<style>


     /* Full-width input fields */
    .regfrm input[type=text], .regfrm input[type=password] {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        display: inline-block;
        border: none;
        background: #f1f1f1;
    }

   .regfrm input[type=text]:focus, .regfrm input[type=password]:focus {
        background-color: #ddd;
        outline: none;
    }
    /* Overwrite default styles of hr */
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }

    /* Set a style for the submit button */
    .registerbtn {
        background-color: #4CAF50;
        color: white;
        padding: 16px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }

    .registerbtn:hover {
        opacity: 1;
    }

    /* Add a blue text color to links */
    a {
        color: dodgerblue;
    }

    /* Set a grey background color and center the text of the "sign in" section */
    .signin {
        background-color: #f1f1f1;
        text-align: center;
    }
</style>
<br/><br/><br/>
<form action="login" method="POST" class="regfrm">
    <div class="container">
        <h1>Login</h1>
        <p>Please fill in this form to create an account.</p>
        <hr>
        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter email" name="email" required>
        
        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" required>

        <button type="submit" class="registerbtn">Sign in</button>
    </div>
</form>
