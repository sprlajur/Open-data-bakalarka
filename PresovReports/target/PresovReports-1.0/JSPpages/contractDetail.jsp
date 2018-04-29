<%-- 
    Document   : contractDetail
    Created on : Mar 18, 2018, 7:05:08 PM
    Author     : sprlajur
--%>

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
        <jsp:include page="topMenu.jsp" />
        <% ContractEntity contract = (ContractEntity) request.getAttribute(RequestAttributeNames.CONTRACT);
            String parties = contract.getParties();
            String party1 = TableDataFormatter.formatParties(parties, 0);
            String party2 = TableDataFormatter.formatParties(parties, 1);
            String contractID = (String) TableDataFormatter.dataOrEmptyString(contract.getContractNr());
            String type = (String) TableDataFormatter.dataOrEmptyString(contract.getType());
            String kind = (String) TableDataFormatter.dataOrEmptyString(contract.getKind());
            String currency = (String) TableDataFormatter.dataOrEmptyString(contract.getCurrency());
            String signatureDate = TableDataFormatter.dateFormatter(contract.getSignatureDate());
            String releaseDate = TableDataFormatter.dateFormatter(contract.getReleaseDate());
            String name = (String) TableDataFormatter.dataOrEmptyString(contract.getName());
            String mainOrAppendix = (String) TableDataFormatter.dataOrEmptyString(contract.getMainOrAppendix());
            String signaturePlace = (String) TableDataFormatter.dataOrEmptyString(contract.getSignaturePlace());
            String validityDate = TableDataFormatter.dateFormatter(contract.getValidityDate());
            String subject = (String) TableDataFormatter.dataOrEmptyString(contract.getSubject());
        %>
        <h1>Detail zmluvy</h1>
        <ul>
            <li><strong>ID v registre zmlúv mesta Prešov: </strong> <span><%= contractID%></span></li>
            <li><strong>Typ: </strong> <span><%= type%></span></li>
            <li><strong>Druh: </strong> <span><%= contract.getKind()%></span></li>
            <li><strong>Strany: </strong> <span><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party1)%>"><%=party1%></a>;&nbsp; &nbsp;  
                    <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party2)%>"><%=party2%></a></span></li>
            <li><strong>Predmet: </strong> <span><%= subject%></span></li>
            <li><strong>Suma: </strong> <span><%= TableDataFormatter.priceFormatter(contract.getPrice(), currency)%></span></li>
            <li><strong>Dátum podpisu: </strong> <span><%=signatureDate%></span></li>
            <li><strong>Dátum zverejnenia: </strong> <span><%=releaseDate%></span></li>
            <li><strong>Názov: </strong> <span><%= name%></span></li>
            <li><strong>Hlavná/Dodatok: </strong> <span><%= mainOrAppendix%></span></li>
            <li><strong>Miesto (miesta) podpisu: </strong> <span><%=signaturePlace%></span></li>
            <li><strong>Dátum platnosti: </strong> <span><%=validityDate%></span></li>
        </ul>
    </body>
</html>
