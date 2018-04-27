<%-- 
    Document   : contractDetail
    Created on : Mar 18, 2018, 7:05:08 PM
    Author     : sprlajur
--%>

<%@page import="entity.OrderEntity"%>
<%@page import="DAO.ContractEntityDAO"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="entity.ContractEntity"%>
<%@page import="constants.UrlParameters"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="constants.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Zmluva</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="${pageContext.request.contextPath}/<%=Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <% OrderEntity order = (OrderEntity) request.getAttribute(RequestAttributeNames.ORDER);
            String orderNr = (String) TableDataFormatter.dataOrEmptyString(order.getOrderNr());
            String supplier = (String) TableDataFormatter.dataOrEmptyString(order.getSupplier());
            String price = TableDataFormatter.priceFormatter(order.getValue(), order.getCurrency());
            String issueDate = TableDataFormatter.dateFormatter(order.getIssueDate());
            String releaseDate = TableDataFormatter.dateFormatter(order.getReleaseDate());
            String orgStructure = (String) TableDataFormatter.dataOrEmptyString(order.getOfficeOrganizationStructure());
            String approverName = (String) TableDataFormatter.dataOrEmptyString(order.getApproverName());       
            String approverFunction = (String) TableDataFormatter.dataOrEmptyString(order.getApproverFunction());       
            String productionDate = TableDataFormatter.dateFormatter(order.getProductionDate());
            String notes = (String) TableDataFormatter.dataOrEmptyString(order.getReleaseNotes());       
            String status = (String) TableDataFormatter.dataOrEmptyString(order.getCompletenessStatus());       
        %>
        <h1>Detail objednávky</h1>
        <ul>
            <li><strong>ID v registre zmlúv mesta Prešov: </strong> <span><%= orderNr%></span></li>
            <li><strong>Dodávateľ: </strong> <span><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + order.getIco() %>"><%=order.getSupplier() %></a></span></li>
            <li><strong>Hodnota: </strong> <span><%= price%></span></li>
            <li><strong>Dátum vyhotovenia: </strong> <span><%=productionDate%></span></li>
            <li><strong>Dátum zverejnenia: </strong> <span><%=releaseDate%></span></li>
            <li><strong>Dátum vystavenia: </strong> <span><%=issueDate%></span></li>
            <li><strong>Organizačná štruktúra úradu: </strong> <span><%= orgStructure%></span></li>
            <li><strong>Schvaľujúci: </strong> <span><%= approverName%></span></li>
            <li><strong>Funkcia schvaľujúceho: </strong> <span><%=approverFunction%></span></li>
            <li><strong>Poznámky k zverejneniu: </strong> <span><%=notes%></span></li>
            <li><strong>Stav vybavenia: </strong> <span><%=status%></span></li>
        </ul>
    </body>
</html>
