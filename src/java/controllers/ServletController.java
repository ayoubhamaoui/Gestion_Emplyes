/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.DepDao;
import dao.EmpDao;
import entities.Dept;
import entities.Emp;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ayoub
 */
public class ServletController extends HttpServlet {
    
    private DepDao deptDao;
    private EmpDao empDao;
    private Dept dept;
    private Emp emp;
    
    @Override
    public void init() throws ServletException {
        super.init();
        this.dept = new Dept();
        this.emp = new Emp();
        this.empDao = new EmpDao();
        this.deptDao = new DepDao();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        switch (action) {
            case "AddDepartement":
                addDepartement(request, response);
                break;
            case "DeleteDepartement":
                deleteDepartement(request, response);
                break;
            case "EditDepartement":
                editDepartement(request, response);
                break;
            case "SaveEditDepartement":
                saveDepartement(request, response);
                break;
            case "AddEmploye":
                addEmploye(request, response);
                break;
            case "SaveEmploye":
                SaveEmploye(request, response);
                break;
            case "ListeEmployesByDept":
                listeEmployesByDept(request, response);
                break;
            case "DeleteEmploye":
                deleteEmploye(request, response);
                break;
            case "EditEmploye":
                editEmploye(request, response);
                break;
            case "saveEditEmploye":
                saveEditEmploye(request, response);
                break;
            case "ListeDepartement":
                listeDepartement(request, response);
                break;

        }

        listeDepartement(request, response);
    }
    private void addDepartement(HttpServletRequest request, HttpServletResponse response) {
        String idDept, nom;
        nom = request.getParameter("nom");
        idDept = request.getParameter("idDept");
        dept.setDeptno(idDept);
        dept.setDname(nom);
        deptDao.add(dept);
    }

    private void deleteDepartement(HttpServletRequest request, HttpServletResponse response) {
        deptDao.delete(request.getParameter("code"));
    }

    private void editDepartement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        dept = deptDao.findById(request.getParameter("code"));
        request.setAttribute("dept", dept);
        request.getRequestDispatcher("editDepartement.jsp").forward(request, response);
    }

    private void saveDepartement(HttpServletRequest request, HttpServletResponse response) {
        String idDep = request.getParameter("idDep");
        String nom = request.getParameter("nom");
        dept.setDeptno(idDep);
        dept.setDname(nom);
        deptDao.update(dept);
    }

    private void listeDepartement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dept> deptList = deptDao.findAll();
        request.setAttribute("data", deptList);
        request.getRequestDispatcher("gestionDepartements.jsp").forward(request, response);
    }

    private void addEmploye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idDept = request.getParameter("code");
        request.setAttribute("idDept", idDept);
        request.getRequestDispatcher("addEmploye.jsp").forward(request, response);
    }

    private void SaveEmploye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idDept = request.getParameter("idDept");
        String empno = request.getParameter("empno");
        String nom = request.getParameter("nom");
        String salaire = request.getParameter("salaire");

        
        emp.setDeptno(this.deptDao.findById(idDept));
        emp.setEname(nom);
        emp.setEmpno(empno);
        emp.setSal(new BigDecimal(salaire));
        
        System.out.println(emp.getDeptno().getDeptno());

        empDao.Add(emp);
        listeDepartement(request, response);
    }

    private void listeEmployesByDept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDept = request.getParameter("code");
        dept = deptDao.findById(idDept);
        List<Emp> employes = empDao.findAllByDept(dept);
        request.setAttribute("employes", employes);
        request.getRequestDispatcher("listeEmployesByDept.jsp").forward(request, response);
    }

    private void deleteEmploye(HttpServletRequest request, HttpServletResponse response) {
        empDao.remove(request.getParameter("code"));
    }

    private void editEmploye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        emp = empDao.findById(request.getParameter("code"));
        request.setAttribute("emp", emp);
        request.getRequestDispatcher("editEmploye.jsp").forward(request, response);
    }

    private void saveEditEmploye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empno = request.getParameter("empno");
        String idDept = request.getParameter("idDept");
        String nom = request.getParameter("nom");
        String salaire = request.getParameter("salaire");
        
        emp.setDeptno(this.deptDao.findById(idDept));
        emp.setEname(nom);
        emp.setSal(new BigDecimal(salaire));
        empDao.Update(emp);
        dept = deptDao.findById(idDept);
        List<Emp> employes = empDao.findAllByDept(dept);
        request.setAttribute("employes", employes);
        request.getRequestDispatcher("listeEmployesByDept.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        System.out.println("Servlet");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
