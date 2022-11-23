<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>

<%
    Connection con = null;
    Statement st = null; //instanciando Statements para executar Querys
    ResultSet rs = null; //instanciando Resultset para navegar entre registros retornados
    
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    String user = "";
    String pass = "";
    String nomeUser = "";
    
    out.println(email+senha);
    
    if(email == "" && senha == ""){
        response.sendRedirect("../index.jsp?erro=1"); //email e/ou senha vazios;
    } else {
        try{
            String url = "jdbc:postgresql://localhost:5432/website";
            String usuario = "postgres";
            String senhaBD = "j0434430";
            
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+email+"' AND senha = '"+senha+"'");
            
            while(rs.next()){
                user = rs.getString(3); //armazena o email (3 coluna da tabela)
                pass = rs.getString(5); // armazena a senha
                nomeUser = rs.getString(2); //armazena o nome
            }
            
        } catch (Exception e){
            out.println(e);
        }
        if(email.equals(user) && senha.equals(pass)){
            session.setAttribute("nomeUsuario", nomeUser);
            response.sendRedirect("../home.jsp");
        } else {
            response.sendRedirect("../index.jsp?erro=2"); //Email e/ou senha não conferem;
        }
    }
%>