<%@page import= "java.sql.*"%>
<%@page import= "org.postgresql.Driver"%>
<%@page import= "util.Upload"%>
<%@page import= "java.io.File"%>

<%
   
    
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    Upload up = new Upload();
    up.setFolderUpload("arquivos");
    
    String imageName = request.getParameter("imagem");
    String id = request.getParameter("id");
            
    if(up.formProcess(getServletContext(), request)){       
        String Nome = up.getForm().get("nome").toString();
        String Desc = up.getForm().get("desc").toString();
        Float Valor = Float.parseFloat(up.getForm().get("valor").toString());
        String Imagem = up.getFiles().get(0);
        
        String url = "jdbc:postgresql://localhost:5432/website";
        String usuario = "postgres";
        String senhaBD = "j0434430";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senhaBD);
            st = con.createStatement();
            
            st.executeUpdate("UPDATE produtos SET nome='"+Nome+"', desc='"+Desc+"', valor='"+Valor+"', imagem='"+Imagem+"'  WHERE id='"+id+"'");
            response.sendRedirect("../produtos.jsp?status=2");
            File file = new File("C:\\Users\\JOSUE\\Documents\\Joao Lucas projetos java\\NetBeans\\WebSite\\build\\web\\arquivos\\"+imageName);
            file.delete();
        } catch(Exception e){
        
        }

    }
%>