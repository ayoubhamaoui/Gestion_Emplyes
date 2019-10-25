<%--
    Document   : listeEmployesByDept
    Created on : Oct 24, 2019, 8:29:52 PM
    Author     : hamza enaime
--%>

<%--
    Document   : index
    Created on : Oct 11, 2019, 11:21:46 AM
    Author     : hamza enaime
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <%@include file="./head.jsp" %>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <%@include file="./menu.jsp" %>
            <main class="mdl-layout__content">
                <div class="page-content">
                    <div class="mdl-grid center-items">
                        <div class="mdl-cell mdl-cell--8-col">
                           <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
                                <thead>
                                    <tr>
                                        <th class="mdl-data-table__cell--non-numeric">ID employee</th>
                                        <th>Nom</th>
                                        <th>Salaire</th>
                                        <th>Modifier</th>                                
                                        <th>Supprimer</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${employes}" var="emp">
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric"><c:out value="${emp.getEmpno()}"/></td>
                                            <td><c:out value="${emp.getEname()}"/></td>
                                            <td><c:out value="${emp.getSal()}"/></td>
                                            
                                            <td>
                                                <form action="ServletController?action=EditEmploye&code=${emp.getEmpno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--mini-fab mdl-button--fab mdl-button--primary"><i class="material-icons">
                                                            update
                                                        </i></button>
                                                </form>
                                            </td>
                                            
                                            <td>
                                                <form action="ServletController?action=DeleteEmploye&code=${emp.getEmpno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--mini-fab mdl-button--fab mdl-button--colored " data-toggle="modal" data-target="#exampleModal">
                                                        <i class="material-icons">delete</i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                           </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
