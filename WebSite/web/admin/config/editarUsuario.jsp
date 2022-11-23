<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    String id = request.getParameter("id");
    String Nome = request.getParameter("nome");
    String Email = request.getParameter("email");
    String Telefone = request.getParameter("telefone");
    String Senha = request.getParameter("senha");
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    String url = "jdbc:postgresql://localhost:5432/website";
    String usuario = "postgres";
    String senhaBD = "j0434430";
    
    try{
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection(url, usuario, senhaBD);
      st = con.createStatement();
      st.executeUpdate("UPDATE usuarios SET nome='"+Nome+"', email='"+Email+"', telefone='"+Telefone+"', senha='"+Senha+"' WHERE id='"+id+"'");
      response.sendRedirect("../usuarios.jsp?status=2");//STATUS 2 = DADOS ATUALIZADOS COM SUCESSO
    } catch(Exception e){
        out.println(e);
    }
%>