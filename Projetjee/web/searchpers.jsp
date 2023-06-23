<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Book</title>
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
	
    <body>
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
  

<div class="container">
  <form class="form-inline" method="post" action="searchpers.jsp">
    <input type="text" name="roll_no" class="form-control" placeholder="Search roll no..">
    <button type="submit" name="save" class="btn btn-primary">Search</button>
  </form>
</div>



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




<h1>Search Data</h1>
 <table border="1" class="table">
     <thead class="thead-light">
            <tr>
                <th scope="col">ID </th>
                <th scope="col">NOM </th>
                <th scope="col">PRENOM </th>
		<th scope="col">EMAIL </th>
                <th scope="col">ADRESSE </th>
                <th scope="col">TELEPHONE </th>
		<th scope="col">LOGIN</th>
                <th scope="col">PASS </th>
		
</tr>
</thead>
<%
try{
Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio?zeroDateTimeBehavior=convertToNull","root","");
                out.println("Connexion avec succ�s!!!!!!");
String roll_no=request.getParameter("roll_no");
String sql ="select * from `personne` where `LOGIN`='"+roll_no+"' ";
Statement stm = cx.createStatement();
ResultSet res = stm.executeQuery(sql);
while(res.next()){
    int id = res.getInt("IDPERS");
%>
 <tr>
            <td><%=id%></td>
            <td><%= res.getString("NOM")%></td>
            <td><%= res.getString("PRENOM")%> </td>
			<td><%= res.getString("EMAIL")%> </td>
			<td><%= res.getString("ADRESSE")%> </td>
			<td><%= res.getBigDecimal("TELEPHONE")%> </td>
			<td><%= res.getString("LOGIN")%> </td>
			<td><%= res.getString("PASS")%> </td>
			
</tr>
<%
}
cx.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>