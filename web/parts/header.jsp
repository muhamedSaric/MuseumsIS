<%@page import="dto.UserIdentity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Museums</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css">

        <style>
            .museums-list{
                padding: 0;
                margin: 0;
            }
            
            .museums-list .li-item{
                height: 325px;
                width: 260px;
                background-repeat: no-repeat;
              
                display: inline-block;
                position: relative;
                margin-top:10px;
                margin-left: 5px;
                margin-right: 5px;
                
            }
            
            .museums-list .li-item .mus-image{
                width: 100%;
                height: 212px;
                position: absolute;
                left: 0;
                top:0;
                background-position: center;
                background-size: cover;
            }
            
            .museums-list .li-item .mus-description h3{
                font-size: 16px;
            }
            
            .museums-list .li-item .mus-description{
                position: absolute;
                bottom: 0;
                left: 0;
                height: 100px;
            }
            
            .museums-list .li-item .mus-description p{
                margin-bottom: 5px !important;
            }
        </style>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
        <script>
            $(document).ready(function(){
                if($("#searchBox").val()=="null"){
                    $("#searchBox").val("");
                }
            });
        </script>
    </head>

    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
  <a class="navbar-brand" href="/MuseumsIS/">Museums IS</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  
   <% UserIdentity currentUser = null;
              if(session.getAttribute("currentUser")!=null)
                currentUser = (UserIdentity) (session.getAttribute("currentUser"));%>
              

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/MuseumsIS/">Home <span class="sr-only">(current)</span></a>
      </li>

             
             
             
              <%
                  if(currentUser == null){
                  %>
                        <li class="nav-item">
        <a class="nav-link" href="http://localhost:8080/MuseumsIS/Register.jsp">Register</a>
      </li>
        
                   <li class="nav-item">
                     <a class="nav-link" href="http://localhost:8080/MuseumsIS/Login.jsp">Login</a>
                  </li>
        <%}else{%>
         <li class="nav-item active">
        <a class="nav-link">[ Welcome <%=currentUser.getFullName()%>! ]</a>
        </li>
        <%}%>
      
      
      <% if(currentUser!=null) {%>
      <li class="nav-item">
          <a class="nav-link" href="http://localhost:8080/MuseumsIS/logout">Logout >></a> 
      </li>
      
      <%} %>
     
    </ul>
    <form class="form-inline my-2 my-lg-0">
        <input type="hidden" name="searchfrm" value="1" />
        <input id="searchBox" class="form-control mr-sm-2" name="mq" value="<%=request.getParameter("mq")%>" type="text" placeholder="Search by name" aria-label="Search">
      <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<div class="container">

