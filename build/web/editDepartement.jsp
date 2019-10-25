<%--
    Document   : editDepartement
    Created on : Oct 23, 2019, 11:46:24 PM
    Author     : Ayoub
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
                        <div class="mdl-cell mdl-cell--4-col">
                            <div class="mdl-card mdl-shadow--6dp">
                                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                                    <h2 class="mdl-card__title-text">
                                        Modifier Departement
                                    </h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <form name="myForm" action="ServletController?action=SaveEditDepartement&idDep=${dept.getDeptno()}" method="post" onsubmit="return validateForm()">
                                        
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="idDept" placeholder="ID departement" name="idDept" value="${dept.getDeptno()}" disabled>
                                            <label class="mdl-textfield__label" for="idDept">ID Departement</label>
                                        </div>
                                            
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="nomDept" placeholder="Nom departement" name="nom" value="${dept.getDname()}" >
                                            <label class="mdl-textfield__label" for="nomDept">Nom Departement</label>
                                        </div>
                                            <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit">
                                            Modifier
                                        </button> 
                                        
                                    </form>    
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

    </body>
</html>
