<%-- 
    Document   : newjsp
    Created on : Mar 5, 2018, 9:15:37 PM
    Author     : sprlajur
--%>

<%@page import="servlets.URLs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <!--<link rel="stylesheet" type="text/css" href="styles.css">-->
        <title>Prešov Open data</title>
    </head>
    <body>

        <ul>
            <li><a href= "<%= URLs.ALL_CONTRACTS_URL %>">Zmluvy</a></li>
            <li><a href="<%= URLs.ALL_GRANTS_URL %>">Dotácie</a></li>
            <li><a href="<%= URLs.ALL_INVOICES_URL %>">Faktúry</a></li>
            <li><a href="<%= URLs.ALL_ORDERS_URL %>">Objednávky</a></li>
        </ul>

    </body>
</html>
