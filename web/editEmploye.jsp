<%--
    Document   : editEmploye
    Created on : Oct 24, 2019, 7:36:14 PM
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
                        <div class="mdl-cell mdl-cell--4-col">
                            <div class="mdl-card mdl-shadow--6dp">
                                <div class="mdl-card__title mdl-color--primary mdl-color-text--white">
                                    <h2 class="mdl-card__title-text">
                                        Modifier Departement
                                    </h2>
                                </div>
                                <div class="mdl-card__supporting-text">
                                    <form name="myForm" action="ServletController?action=saveEditEmploye&idDept=${emp.getDeptno().getDeptno()}" method="post" >
                                        
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="depid" placeholder="ID departement" value="${emp.getDeptno().getDeptno()}" disabled >
                                            <label class="mdl-textfield__label" for="depid">ID Departement</label>
                                        </div>
                                            
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="empno" placeholder="ID employee" name="empno" value="${emp.getEmpno()}" disabled>
                                            <label class="mdl-textfield__label" for="empno">ID Employee</label>
                                        </div>
                                            
                                        <div class="mdl-textfield mdl-js-textfield">
                                            <input type="text" class="mdl-textfield__input" id="nom" placeholder="ID employee" name="nom" value="${emp.getEname()}">
                                            <label class="mdl-textfield__label" for="empno">Nom</label>
                                        </div>
                                        
                                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                            <input type="number" class="mdl-textfield__input" placeholder="Salaire" name="salaire" pattern="-?[0-9]*(\.[0-9]+)?" value="${emp.getSal()}" id="sample4">
                                            <label class="mdl-textfield__label" for="sample4">Salaire</label>
                                            <span class="mdl-textfield__error">Input is not a number!</span>
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
