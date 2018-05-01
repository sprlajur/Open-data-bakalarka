<%-- 
    Document   : contractDetail
    Created on : Mar 18, 2018, 7:05:08 PM
    Author     : sprlajur
--%>

<%@page import="rpo.RPODepositEntry"%>
<%@page import="java.util.List"%>
<%@page import="rpo.RPOAddressEntry"%>
<%@page import="constants.UrlParameters"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="rpo.RPOLegalPerson"%>
<%@page import="constants.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Právnická osoba</title>
    </head>
    <body>
        <jsp:include page="topMenu.jsp" />
        <% RPOLegalPerson person = (RPOLegalPerson) request.getAttribute(RequestAttributeNames.LEGAL_PERSON);%>
        <h1>Detail právnickej osoby</h1>
        <ul>
            <li><strong>IČO: </strong> <span><%=(String) request.getParameter(UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getParameter())%></span></li>
            <li><strong>Meno: </strong> <span><%= person.getName()%></span></li>
            <li><strong>Adresa: </strong> <span><%= person.getFormatted_address()%></span></li>
            <li><strong>Hlavná ekonomická činnosť: </strong> <span><%= person.getMainActivityCode()%></span></li>
            <li><strong>Činnost podľa ESA2010: </strong> <span><%= person.getEsa2010Code()%></span></li>
            <li><strong>Dátum založenia: </strong> <span><%= person.getEstablished_on().format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))%></span></li>
            <li><strong>Miesto registrácie: </strong> <span><%= person.getRegistration_office()%></span></li>
            <li><strong>Registračné čislo: </strong> <span><%= person.getRegistration_nr()%></span></li>
                <% LocalDate terminated_on = person.getTerminated_on();
                    if (terminated_on != null) {%>
            <li><strong>Dátum ukončenia činnosti: </strong> <span><%= terminated_on.format(DateTimeFormatter.ofPattern("dd.MM.yyyy"))%></span></li>
                <% }
                %>
                <c:if test = "${person.getDepositEntries() ne null && not person.getDepositEntries().isEmpty()}">
                    <jsp:include page="depositEntries.jsp" />
                </c:if>
                <c:if test = "${person.getAlternateNameEntries() ne null && not person.getAlternateNameEntries().isEmpty()}">
                    <jsp:include page="alternateNameEntries.jsp" />
                </c:if>
                <c:if test = "${person.getAddressEntries() ne null && person.getAddressEntries().size() gt 1}">
                    <jsp:include page="addressEntries.jsp" />
                </c:if>
                <c:if test = "${person.getAuthorizationEntries() ne null && not person.getAuthorizationEntries().isEmpty()}">
                    <jsp:include page="authorizationEntries.jsp" />
                </c:if>
                <c:if test = "${person.getEconomicActivityEntries() ne null && not person.getEconomicActivityEntries().isEmpty()}">
                    <jsp:include page="economicActivityEntries.jsp" />
                </c:if>
                <c:if test = "${person.getEquityEntries() ne null && not person.getEquityEntries().isEmpty()}">
                    <jsp:include page="equityEntries.jsp" />
                </c:if>
                <c:if test = "${person.getLegalForms() ne null && not person.getLegalForms().isEmpty()}">
                    <jsp:include page="legalFormEntries.jsp" />
                </c:if>
                <c:if test = "${person.getLegalStatusEntries() ne null && not person.getLegalStatusEntries().isEmpty()}">
                    <jsp:include page="legalStatusEntries.jsp" />
                </c:if>
                <c:if test = "${person.getNameEntries() ne null && person.getNameEntries().size() gt 1}">
                    <jsp:include page="nameEntries.jsp" />
                </c:if>
                <c:if test = "${person.getPredecessorEntries() ne null && not person.getPredecessorEntries().isEmpty()}">
                    <jsp:include page="predecessorSuccessorEntries.jsp" >
                        <jsp:param name="object" value="predecessor" />
                    </jsp:include>
                </c:if>
                <c:if test = "${person.getSuccessorEntries() ne null && not person.getSuccessorEntries().isEmpty()}">
                    <jsp:include page="predecessorSuccessorEntries.jsp" />
                </c:if>
                <c:if test = "${person.getShareEntries() ne null && not person.getShareEntries().isEmpty()}">
                    <jsp:include page="shareEntries.jsp" />
                </c:if>
                <c:if test = "${person.getStatutoryEntries() ne null && not person.getStatutoryEntries().isEmpty()}">
                    <jsp:include page="statutoryStakeholderEntries.jsp" >
                        <jsp:param name="object" value="statutory" />
                    </jsp:include>
                </c:if>
                <c:if test = "${person.getStakeholderEntries() ne null && not person.getStakeholderEntries().isEmpty()}">
                    <jsp:include page="statutoryStakeholderEntries.jsp" />
                </c:if>
            <li><span> <a href="https://finstat.sk/<%=(String) request.getParameter(UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getParameter())%>" target="_blank">finstat.sk</a></span></li>
        </ul>
    </body>
</html>
