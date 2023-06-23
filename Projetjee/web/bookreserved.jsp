<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Affichage</title>
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
            <table border="1" class="table">
                <thead class="thead-light">
            <tr>
                <th scope="col">IDRES</th>
                <th scope="col">DATERES</th>
                <th scope="col">ISBN</th>
                <th scope="col">TITLE </th>
                <th scope="col">AUTEURS </th>
                <th scope="col">IDPERS</th>
                <th scope="col">Annuler Reservation</th>
            </tr>
            </thead>
        <%
            try {
 //chargement du driver
               
                Class.forName("com.mysql.jdbc.Driver"); 
//connexion avec la base de données
                Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio?zeroDateTimeBehavior=convertToNull","root","");
                out.println("Connexion avec succès!!!!!!");

                
                String sql = "SELECT * FROM `livre`,`reservation` WHERE `livre`.`ISBN`=`reservation`.`ISBN`;";
                Statement stm = cx.createStatement();
                ResultSet res = stm.executeQuery(sql);
                while(res.next()){
                int id = res.getInt("IDRES");
                
          %>
        <tr>
            <td><%=id%></td>
            <td><%= res.getString("DATERES")%></td>
            <td><%= res.getString("ISBN")%></td>
            <td><%= res.getString("TITRE")%></td>
            <td><%= res.getString("AUTEURS")%> </td>
            <td><%= res.getInt("IDPERS")%></td>
			
           <%String lien ="annuler.jsp?id=" + id;%>
             <td><a href ="<%=lien%>">annuler reservation</a></td>  
          
       
<%
          }
          stm.close();
          cx.close();
            }catch (ClassNotFoundException ex) {
                out.println("Driver manquant");    
            }
        %>
        
         </tr>
            
      </table>  
    </body>
</html>
