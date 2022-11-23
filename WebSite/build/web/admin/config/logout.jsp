<%
    session.invalidate(); //Encerra a Sessão Do Usuário
    response.sendRedirect("../index.jsp?erro=4"); //Rediciona Para a Mensagem "Sua Sessão Foi Encerrada!"
%>