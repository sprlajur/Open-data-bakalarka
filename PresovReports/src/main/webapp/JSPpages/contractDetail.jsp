<%-- 
    Document   : contractDetail
    Created on : Mar 18, 2018, 7:05:08 PM
    Author     : sprlajur
--%>

<%@page import="DAO.ContractEntityDAO"%>
<%@page import="presentation.TableContractsDataFormatter"%>
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
        <% ContractEntity contract = (ContractEntity) request.getAttribute(RequestAttributeNames.CONTRACT);
            String parties = contract.getParties();
            String party1 = TableContractsDataFormatter.formatParties(parties, 0);
            String party2 = TableContractsDataFormatter.formatParties(parties, 1);
            String contractID = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getContractNr());
            String type = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getType());
            String kind = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getKind());
            String currency = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getCurrency());
            String signatureDate = (String) TableContractsDataFormatter.dateFormatter(contract.getSignatureDate().toString());
            String releaseDate = (String) TableContractsDataFormatter.dateFormatter(contract.getReleaseDate().toString());
            String name = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getName());
            String mainOrAppendix = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getMainOrAppendix());
            String signaturePlace = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getSignaturePlace());
            String validityDate = (String) TableContractsDataFormatter.dateFormatter(contract.getValidityDate().toString());
            String subject = (String) TableContractsDataFormatter.dataOrEmptyString(contract.getSubject());
        %>
        <h1>Detail zmluvy</h1>
        <ul>
            <li><strong>ID v registre zmlúv mesta Prešov: </strong> <span><%= contractID%></span></li>
            <li><strong>Typ: </strong> <span><%= type%></span></li>
            <li><strong>Druh: </strong> <span><%= contract.getKind()%></span></li>
            <li><strong>Strany: </strong> <span><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party1)%>"><%=party1%></a>;&nbsp; &nbsp;  
                    <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party2)%>"><%=party2%></a></span></li>
            <li><strong>Predmet: </strong> <span><%= subject%></span></li>
            <li><strong>Suma: </strong> <span><%= TableContractsDataFormatter.dataOrEmptyString(contract.getPrice()) + " " + currency%></span></li>
            <li><strong>Dátum podpisu: </strong> <span><%=signatureDate%></span></li>
            <li><strong>Dátum zverejnenia: </strong> <span><%=releaseDate%></span></li>
            <li><strong>Názov: </strong> <span><%= name%></span></li>
            <li><strong>Hlavná/Dodatok: </strong> <span><%= mainOrAppendix%></span></li>
            <li><strong>Miesto (miesta) podpisu: </strong> <span><%=signaturePlace%></span></li>
            <li><strong>Dátum platnosti: </strong> <span><%=validityDate%></span></li>
        </ul>
    </body>
</html>
