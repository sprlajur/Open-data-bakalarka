<%-- 
    Document   : allContracts
    Created on : Mar 12, 2018, 9:47:27 PM
    Author     : sprlajur
--%>

<%@page import="DAO.ContractEntityDAO"%>
<%@page import="servlets.URLs"%>
<%@page import="presentation.TableContractsDataFormatter"%>
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
        <%! List<ContractEntity> contracts;
            String contractRows;%>
        <table style="width:100%">
            <tr style=>      
                <th colspan="2">Strany</th>
                <th>Predmet</th>
                <th>Dátum podpisu</th>
                <th>Cena</th>
            </tr>
            <%
                contracts = (List<ContractEntity>) request.getAttribute("allContracts");

                for (int i = 0; i < contracts.size(); i++) {
                    ContractEntity contract = contracts.get(i);
                    String parties = contract.getParties();
            %>
            <tr>      
                <td> <a href=<%= request.getAttribute("javax.servlet.forward.request_uri") + "/" + URLs.CONTRACT_DETAIL + "?ico=" + ContractEntityDAO.getIcoFromContract(contract, TableContractsDataFormatter.formatParties(parties, 0)) %> ><%=TableContractsDataFormatter.formatParties(parties, 0)%></a> </td>
                <td> <%=TableContractsDataFormatter.formatParties(parties, 1)%> </td>
                <td><%=TableContractsDataFormatter.formatSubject(contract.getSubject())%></td>
                <td><%=TableContractsDataFormatter.dateFormatter(contract.getSignatureDate().toString())%></td>
                <td><%=TableContractsDataFormatter.dataOrEmptyString(contract.getPrice()) + " " + TableContractsDataFormatter.dataOrEmptyString(contract.getCurrency())%></td>
            </tr>
            <% }%>
        </table>

    </body>
</html>
