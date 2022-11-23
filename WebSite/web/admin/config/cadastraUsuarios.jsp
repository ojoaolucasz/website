<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
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
        st.execute("INSERT INTO public.usuarios(nome, email, telefone, senha) VALUES ('"+Nome+"', '"+Email+"','"+Telefone+"', '"+Senha+"')");
        response.sendRedirect("../usuarios.jsp?erro=5");//ERRO 5 = USUARIO CADASTRADO COM SUCESSO
    } catch(Exception e){
        out.println(e);
    }
%>