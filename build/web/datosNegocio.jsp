<%-- 
    Document   : datosNegocio
    Created on : 18-ene-2019, 11:31:42
    Author     : alumno_2DAW
--%>

<%@page import="ayuda.Film"%>
<%@page import="ayuda.Category"%>
<%@page import="java.util.Iterator"%>
<%@page import="ayuda.Customer"%>
<%@page import="ayuda.Staff"%>
<%@page import="java.util.List"%>
<%@page import="ayuda.Store"%>
<%@page import="ayuda.Ayudante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
        
        String tiendas=request.getParameter("tiendas");
        int id=Integer.parseInt(tiendas);
        
        String negocio=request.getParameter("negocio");
        String datos=request.getParameter("datos");
        
        String clientes=request.getParameter("clientes");
        String cliente=request.getParameter("cliente");
            
        String categoria=request.getParameter("categoria");
        String category=request.getParameter("category");
        int num=Integer.parseInt(category);

        Ayudante ayu=new Ayudante();
        List<Store>lista=ayu.consultaDatos(id);//Recojo los datos del negocio
        
        List<Staff>emplea=ayu.consultaEmpleado(id);//Recojo los datos del empleado
        
        List<Customer>acti=ayu.consultaClientesActivos(id);//Recojo los clientes activos
        
        List<Category>catego=ayu.consultaCategori(num);
        
        List<Film>pelis=ayu.consultaPelis(num);

        %>
        
        <% if(datos!=null){ 
              if(negocio.equals("datosNegocio")){ %>
              Nombre:<%=lista.get(0).getNombre() %><br>
              Direccion:<%=lista.get(0).getAddress().getAddress() %><br>
              Ciudad:<%=lista.get(0).getAddress().getCity().getCity() %><br>
              Pais:<%=lista.get(0).getAddress().getCity().getCountry().getCountry() %>
          <%  }

              if(negocio.equals("datosEmpleado")){ %>
              Empleado:<%=emplea.get(0).getFirstName() %> <%=emplea.get(0).getLastName() %><br>
              Direccion:<%=emplea.get(0).getAddress().getAddress() %><br>
              Ciudad:<%=emplea.get(0).getAddress().getCity().getCity() %><br>
              Pais:<%=emplea.get(0).getAddress().getCity().getCountry().getCountry() %>
              <%  }
            }

            if(cliente!=null){
                if(clientes.equals("activos")){ %>
                <table>
                    <tr><td>Nombre</td><td>Apellidos</td><td>Email</td></tr>
                    <% for(Iterator it=lista.get(0).getCustomers().iterator(); it.hasNext();){ //El iterator recoje 
                                                                                                //los campos que son SET. 
                                                                                                //Vamos recogiendo cada cliente y 
                                                                                                //lo vamos mostrando hasta que no 
                                                                                                //haya ninguno(it.hasNext())
                        Customer client=(Customer) it.next();//Cada registro lo metemos en client
                        if(client.isActive()){  //Si el cliente es activo, que lo muestre %>
                        <tr>
                            <td><%=client.getFirstName() %></td>
                            <td><%=client.getLastName() %></td>
                            <td><%=client.getEmail() %></td>
                        </tr>
                      <%  }
                     } %>
                </table>
               <% }

               if(clientes.equals("inactivos")){ %>
                <table>
                    <tr><td>Nombre</td><td>Apellidos</td><td>Email</td></tr>
                    <% for(Iterator it=lista.get(0).getCustomers().iterator(); it.hasNext();){ //El iterator recoje 
                                                                                                //los campos que son SET. 
                                                                                                //Vamos recogiendo cada cliente y 
                                                                                                //lo vamos mostrando hasta que no 
                                                                                                //haya ninguno(it.hasNext())
                        Customer client=(Customer) it.next();//Cada registro lo metemos en client
                        if(!client.isActive()){  //Si el cliente es activo, que lo muestre %>
                        <tr>
                            <td><%=client.getFirstName() %></td>
                            <td><%=client.getLastName() %></td>
                            <td><%=client.getEmail() %></td>
                        </tr>
                      <%  }
                     } %>
                </table>
               <% }
            }

            if(categoria!=null){ %>
            Categoria:<%=catego.get(0).getName() %>
                <hr>
                <form action="muestraInformacion.jsp" method="POST">
                <table>
                    <tr><td style="border-bottom: solid">Pelicula</td><td></td></tr>
                    
                    <%
                        for(int x=0;x<pelis.size();x++){ %>
                        
                        <tr><td><%=pelis.get(x) %></td><td><button type="submit" name="id" value="<%=pelis.get(x) %>">Más información</button></td></tr>                        
                    <%    }
                    %>
                </table>
                </form>
            <% }
            
             %>
    </body>
</html>
