
<%--
    Document   : index
    Created on : Oct 11, 2019, 11:21:46 AM
    Author     : Ayoub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <%@include file="./head.jsp" %>
    <body>
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
            <%@include file="./menu.jsp" %>
            <main class="mdl-layout__content">
                <div class="page-content">
                    <div class="mdl-grid center-items">
                        <div class="mdl-cell mdl-cell--4-col">
                            <div class="mdl-card mdl-shadow--6dp">
                                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                                    <h2 class="mdl-card__title-text">
                                        Ajouter Departement
                                    </h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <form name="myForm" action="ServletController?action=AddDepartement" method="POST">
                                        
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="idDept" placeholder="ID departement" name="idDept" >
                                            <label class="mdl-textfield__label" for="idDept">ID Departement</label>
                                        </div>
                                            
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="nomDept" placeholder="Nom departement" name="nom" >
                                            <label class="mdl-textfield__label" for="nomDept">Nom Departement</label>
                                        </div>
                                            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit">
                                            Ajouter
                                        </button> 
                                        
                                    </form>    
                                </div> 
                            </div>
                        </div>
                        <div class="mdl-cell mdl-cell--8-col">
                           <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
                                <thead>
                                    <tr>
                                        <th class="mdl-data-table__cell--non-numeric">ID departement</th>
                                        <th>Nom departement</th>
                                        <th>Ajouter</th>
                                        <th>Modifier</th>                                
                                        <th>Supprimer</th>
                                        <th>Liste des employees</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${data}" var="dept">
                                        <tr>
                                            <td class="mdl-data-table__cell--non-numeric"><c:out value="${dept.getDeptno()}"/></td>
                                            <td><c:out value="${dept.getDname()}"/></td>
                                            
                                            <td>
                                                <form action="ServletController?action=AddEmploye&code=${dept.getDeptno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab">
                                                        <i class="material-icons">
                                                            add
                                                        </i>
                                                    </button>
                                                </form>
                                            </td>
                                            
                                            <td>
                                                <form action="ServletController?action=EditDepartement&code=${dept.getDeptno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--mini-fab mdl-button--fab mdl-button--primary"><i class="material-icons">
                                                            update
                                                        </i></button>
                                                </form>
                                            </td>
                                            
                                            <td>
                                                <form action="ServletController?action=DeleteDepartement&code=${dept.getDeptno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--mini-fab mdl-button--fab mdl-button--colored " data-toggle="modal" data-target="#exampleModal"><i class="material-icons">
                                                            delete
                                                        </i>
                                                    </button>
                                                </form>
                                            </td>
                                            
                                            <td>
                                                <form action="ServletController?action=ListeEmployesByDept&code=${dept.getDeptno()}" method="POST">
                                                    <button type="submit" class="mdl-button mdl-js-button mdl-button--primary"><i class="material-icons">
                                                            list
                                                        </i></button>
                                                </form>
                                            </td>
                                        </tr>
                                        
                                    </c:forEach>
                                </tbody>                     
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
