<%-- 
    Document   : index
    Created on : 18-ene-2019, 10:02:44
    Author     : alumno_2DAW
--%>

<%@page import="ayuda.Category"%>
<%@page import="java.util.List"%>
<%@page import="ayuda.Store"%>
<%@page import="ayuda.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Videoteca</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            p{
                background-color: cornflowerblue;
                color: white;
            }
        </style>
    </head>
    <body>

        <%

            Ayudante ayu = new Ayudante();
            List<Store> tienda = ayu.consultaTienda();

            List<Category> categoria = ayu.consultaCategoria();

        %>

    <center>
        <form method="POST" action="datosNegocio.jsp">
            <div style="width: 40%; border: 1px solid;">
                <img src="videoteca.gif">
                <hr>
                Video club
                <select name="tiendas">
                    <% for (int x = 0; x < tienda.size(); x++) {%>
                    <option value="<%=tienda.get(x).getStoreId() %>"><%=tienda.get(x).getNombre() %></option>
                    <% } %>
                </select>
                <hr>
                <p>Datos del negocio:</p>
                <table>
                    <tr><td><input type="radio" name="negocio" value="datosNegocio"></td><td>Datos del negocio</td><td><button type="submit" value="datos" name="datos">Mostrar</button></td></tr>
                    <tr><td><input type="radio" name="negocio" value="datosEmpleado"></td><td>Datos de los empleados</td></tr>
                </table>
                <hr>
                <p>Gestion de clientes:</p>
                <table>
                    <tr><td><input type="radio" name="clientes" value="activos"></td><td>Listado de clientes activos</td><td><button type="submit" value="cliente" name="cliente">Mostrar</button></td></tr>
                    <tr><td><input type="radio" name="clientes" value="inactivos"></td><td>Listado de clientes inactivos</td></tr>
                </table>
                <hr>
                <p>Gestion de inventario:</p>
                <table>
                    <tr><td>Categoria de películas
                            <select name="category">
                                <% for (int x = 0; x < categoria.size(); x++) {%>
                                <option value="<%=categoria.get(x).getCategoryId() %>"><%=categoria.get(x).getName() %></option>
                                <% }%>
                            </select>
                        </td><td><button type="submit" value="categoria" name="categoria">Mostrar</button></td></tr>
                </table>
            </div>
        </form>
    </center>

</body>
</html>
