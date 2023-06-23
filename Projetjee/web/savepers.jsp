 <%@page import="java.sql.*"%>
<%@page import= "java.lang.*"%>
<html>
    <head>
        <title>save person</title>
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
    <body>
        <%
            try {
 //chargement du driver
               
                Class.forName("com.mysql.jdbc.Driver"); 
//connexion avec la base de données
                Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio?zeroDateTimeBehavior=convertToNull","root","");
                out.println("Connexion avec succès!!!!!!");

            
          
          int idpers = Integer.parseInt(request.getParameter("idpers"));
          String nom = request.getParameter("nom");
          String prenom = request.getParameter("prenom");
          String email = request.getParameter("email");
          String adress = request.getParameter("adress");
          double phone = Double.parseDouble(request.getParameter("phone"));
          String login = request.getParameter("login");
          String password = request.getParameter("password");
          String classroom = request.getParameter("classroom");
          String grade = request.getParameter("grade");
          String dep = request.getParameter("dep");
          String sql="INSERT INTO personne (`IDPERS`, `NOM`, `PRENOM`, `EMAIL`, `ADRESSE`, `TELEPHONE`, `LOGIN`, `PASS`) VALUES (?, ?,?, ?, ?,?, ?,?);";
          PreparedStatement pstm = cx.prepareStatement(sql);
          pstm.setInt(1, idpers);
          pstm.setString(2, prenom);
          pstm.setString(3, nom);
          pstm.setString(4, email);
          pstm.setString(5, adress);
          pstm.setDouble(6, phone);
          pstm.setString(7, login);
          pstm.setString(8, password);
          String sql1="INSERT INTO etudiant (`IDETUD`, `CLASSE`) VALUES (?, ?);";
          PreparedStatement pstm1 = cx.prepareStatement(sql1);
          pstm1.setInt(1, idpers);
          pstm1.setString(2, classroom);
          String sql2="INSERT INTO enseignant (`IDENS`, `GRADE`, `DEPARTEMENT`) VALUES (?, ?, ?);";
          PreparedStatement pstm2 = cx.prepareStatement(sql2);
          pstm2.setInt(1, idpers);
          pstm2.setString(2, grade);
          pstm2.setString(3, dep);
          int n = pstm.executeUpdate();
          int n1 = pstm1.executeUpdate();
          int n2 = pstm2.executeUpdate();
          if (((n!=0)&&(n1!=0))||((n!=0)&&(n2!=0)))
              out.println("Ajout avec succés!!");
          else 
              out.println("Aucun enregistrement a été mis à jour");
           }catch (ClassNotFoundException ex) {
            out.println("Driver manquant");    
            } 
        %>
      
    </body>
</html>
