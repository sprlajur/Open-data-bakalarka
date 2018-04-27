<%-- 
    Document   : allContracts
    Created on : Mar 12, 2018, 9:47:27 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="DAO.ContractEntityDAO"%>
<%@page import="constants.*"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="java.util.List"%>
<%@page import="entity.ContractEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Zmluvy mesta</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href= "<%= Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="<%= Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="<%= Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="<%= Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <%! List<ContractEntity> contracts;%>
        <table style="width:100%">
            <tr style=>      
                <th>Predmet</th>
                <th>Dátum podpisu</th>
                <th>Cena</th>
            </tr>
            <%
                contracts = (List<ContractEntity>) request.getAttribute(RequestAttributeNames.ALL_CONTRACTS);

                for (int i = 0; i < contracts.size(); i++) {
                    ContractEntity contract = contracts.get(i);
                    String parties = contract.getParties();
                    String party1 = TableDataFormatter.formatParties(parties, 0);
                    String party2 = TableDataFormatter.formatParties(parties, 1);
            %>
            <tr>      
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party1)%>"><%=party1%></a> </td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, party2)%>"><%=party2%></a> </td>
                <td><%=TableDataFormatter.formatTextData(contract.getSubject())%></td>
                <td><%=TableDataFormatter.dateFormatter(contract.getSignatureDate())%></td>
                <td><%=TableDataFormatter.priceFormatter(contract.getPrice(), contract.getCurrency())%></td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_CONTRACTS_URL + "/" + Urls.CONTRACT_DETAIL + UrlParameters.CONTRACT_DETAIL_NR_PARAMETER.getURLParameter() + contract.getContractNr()%>">detail</a> </td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
