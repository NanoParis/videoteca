<%-- 
    Document   : muestraInformacion
    Created on : 28-ene-2019, 14:07:36
    Author     : alumno_2DAW
--%>

<%@page import="java.util.List"%>
<%@page import="ayuda.Film"%>
<%@page import="ayuda.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Más información</title>
    </head>
    <body>
        <%
        
        String id=request.getParameter("id");
        
        Ayudante ayu=new Ayudante();
        List<Film>lista=ayu.consultaDatosPeli(id);

            %>
            
            <% for(int x=0;x<lista.size();x++){ %>
            <strong><%=lista.get(x).getTitle() %></strong><br>
            Descripcion: <%=lista.get(x).getDescription() %><br>
            Duracion: <%=lista.get(x).getLength() %> minutos<br>
            Año: <%=lista.get(x).getReleaseYear() %><br>
            <% } %>
    </body>
</html>
