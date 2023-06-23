<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

</head>
<body>
            <%
        String login= request.getParameter("login");
        String pwd= request.getParameter("password");
        if (login != null){
            
        
        try {
 //chargement du driver
               
                Class.forName("com.mysql.jdbc.Driver"); 
//connexion avec la base de données
               Connection cx = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblio?zeroDateTimeBehavior=convertToNull","root","");
                out.println("Connexion avec succès!!!!!!");
                PreparedStatement pst= cx.prepareStatement("select LOGIN, PASS from personne where LOGIN =? and PASS =?");
                pst.setString(1,login);
                pst.setString(2,pwd);
                ResultSet res=pst.executeQuery();
                if(res.next())
                  
                {
                    out.println("login succès!!!!!!");
                    response.sendRedirect("home.html");
                }
                else 
                  {
                   out.println("login failed!!!!!!");
                   response.sendRedirect("login.html");
                   }
             }catch (ClassNotFoundException ex) {
            out.println("Driver manquant");    
            }}
        %>
  
</body>
</html>

        

        
        

