<%
    session.invalidate(); //Encerra a Sess�o Do Usu�rio
    response.sendRedirect("../index.jsp?erro=4"); //Rediciona Para a Mensagem "Sua Sess�o Foi Encerrada!"
%>