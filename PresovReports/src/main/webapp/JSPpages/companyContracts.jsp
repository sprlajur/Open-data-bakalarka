<%-- 
    Document   : companyContracts
    Created on : May 6, 2018, 2:44:14 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="constants.Urls"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="entity.ContractEntity"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="${pageContext.request.contextPath}/javascript/sorttable.js"></script>
    </head>
    <body>
        <%
            List<ContractEntity> contracts = (List<ContractEntity>) request.getAttribute(RequestAttributeNames.ALL_CONTRACTS);
        %>
        <table class="companytable" id="sortable">
            <caption>Zmluvy s mestom Prešov</caption>
            <tr>
                <th class="sorttable_nosort">Zmluva</th>
                <th>Dátum podpisu</th>
                <th>Suma</th>
                <th class="sorttable_nosort"></th>
            </tr>
            <%
                if (contracts != null) {
                    for (int i = 0; i < contracts.size(); i++) {
                        ContractEntity contract = contracts.get(i);
            %>
            <tr>
                <td><%=TableDataFormatter.formatTextData(contract.getSubject())%></td>
                <td><%=TableDataFormatter.dateFormatter(contract.getSignatureDate())%></td>
                <td class= "price_cell"><%=TableDataFormatter.priceFormatter(contract.getPrice(), contract.getCurrency())%></td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_CONTRACTS_URL + "/" + Urls.CONTRACT_DETAIL + UrlParameters.CONTRACT_DETAIL_NR_PARAMETER.getURLParameter() + contract.getContractNr()%>"><i class="glyphicon glyphicon-zoom-in"></i></a> </td>
            </tr>
            <%}
                }
            %>
        </table>
    </body>
</html>
