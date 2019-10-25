<%--
    Document   : addEmploye
    Created on : Oct 24, 2019, 7:28:46 PM
    Author     : ayoub
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
                                        Ajouter Employee
                                    </h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <form name="myForm" action="ServletController?action=SaveEmploye&idDept=${idDept}" method="POST" >
                                        
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="idDept" placeholder="ID departement"  value="${idDept}" disabled >
                                            <label class="mdl-textfield__label" for="idDept">ID Departement</label>
                                        </div>
                                            
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="empno" placeholder="ID employee" name="empno">
                                            <label class="mdl-textfield__label" for="empno">ID Employee</label>
                                        </div>
                                        
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="nom" placeholder="Nom" name="nom" >
                                            <label class="mdl-textfield__label" for="nom">Nom</label>
                                        </div>
                                        
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input type="number" class="mdl-textfield__input" placeholder="Salaire" name="salaire" pattern="-?[0-9]*(\.[0-9]+)?" id="sample4">
                                            <label class="mdl-textfield__label" for="sample4">Salaire</label>
                                            <span class="mdl-textfield__error">Input is not a number!</span>
                                        </div>
                                            
                                        <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit">
                                            Ajouter
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
