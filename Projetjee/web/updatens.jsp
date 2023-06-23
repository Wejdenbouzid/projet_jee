<!DOCTYPE html>
<html>
    <head>
    <title>update enseignant</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="fa fa-book navbar-brand" href="home.html"> Library</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
               <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Student and teacher management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		  <a class="dropdown-item" href="selectstudent.jsp">Display student</a>
                  <a class="dropdown-item" href="selectens.jsp">Display teacher</a>     
                  <a class="dropdown-item" href="stadd.html">Add</a>
                  <a class="dropdown-item" href="searchpers.jsp">Search</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Book management
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="selectbook.jsp">Display book</a>
          <a class="dropdown-item" href="bookadd.html">Add</a>
          <a class="dropdown-item" href="search.jsp">Search</a>
      </li>
      
      
     <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Reservation management</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="reservation.jsp">reservation</a>
          <a class="dropdown-item" href="bookreserved.jsp">books reserved</a>
          <a class="dropdown-item" href="reserverbook.jsp">reserve book</a>
      </li>
	 <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          loan management</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="loan.jsp">loan</a>
          <a class="dropdown-item" href="booksloaned.jsp">books loaned</a>
          <a class="dropdown-item" href="loanbook.jsp">loan book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="login.html">
	  <button class="btn btn-outline-success my-2 my-sm-0">Logout</button>
    </form>
  </div>
</nav>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    

try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
%>

<%
try{
Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio?zeroDateTimeBehavior=convertToNull","root","");
                out.println("Connexion avec succès!!!!!!");
                
int id = Integer.parseInt(request.getParameter("id"));
String sql ="select * from `personne`,`enseignant` where `GRADE`!='NULL' AND `IDPERS`='"+id+"' ";
Statement stm = cx.createStatement();
ResultSet res = stm.executeQuery(sql);
while(res.next()){
    int idp = res.getInt("IDPERS");
%>

<body>
  <header class="w3-display-container w3-content w3-hide-small" style="max-width:1500px;">
  <div class="w3-display-middle" style="width:65%; margin-top:24%">
    <div class="w3-bar w3-black">
      <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Book');"><i class="fa fa-book w3-margin-right"></i>Enseignant</button>
    </div>
       <div id="Book" class="w3-container w3-white w3-padding-16 myLink">
        <h1>Update data from enseignant </h1>
      <div class="w3-row-padding" style="margin:0 -10px;"></div>

<form method="post" action="update-process-ens.jsp">
     <table> <tr>
<td> <label>id enseignant : </label></td>

<td><input type="text" name="idpers" value="<%=res.getInt("IDPERS") %>"></td>
         </tr>
         <tr>
             <td><label>First name:</label></td>
             <td><input type="text" name="first_name" value="<%=res.getString("NOM") %>"></td>
         </tr>

         <tr>
             <td><label>Last name:</label></td>
             <td><input type="text" name="last_name" value="<%=res.getString("PRENOM") %>"></td>
 </tr>
 <tr>
     <td><label>Email :</label></td>
     <td><input type="email" name="email" value="<%=res.getString("EMAIL") %>"></td>
</tr>
<tr>
    <td><label>Adresse:</label></td>
    <td><input type="text" name="city_name" value="<%=res.getString("ADRESSE") %>"></td>
</tr>
<tr>
    <td><label>Telephone:</label></td>
<td><input type="tel" name="phone" value="<%=res.getBigDecimal("TELEPHONE") %>"></td>

</tr>
<tr>
    <td><label>Login:</label></td>
    <td><input type="text" name="login" value="<%=res.getString("LOGIN") %>"></td>
</tr>
<tr>
    <td><label>pass:</label></td>
    <td><input type="text" name="pass" value="<%=res.getString("PASS") %>"></td>
</tr>
<tr>
    <td><label>Grade:</label></td>
    <td><input type="text" name="grade" value="<%=res.getString("GRADE") %>"></td>
</tr>
<tr>
    <td><label>Departement:</label></td>
    <td><input type="text" name="dept" value="<%=res.getString("DEPARTEMENT") %>"></td>
</tr>
<tr><td><input type="submit" value="submit"></td></tr>
 </table> 
</form>
   </div>
  </div>
<%
}
cx.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
