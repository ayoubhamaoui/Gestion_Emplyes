/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author ayoub
 */

import entities.Dept;
import entities.Emp;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

public class EmpDao
        
{
    EntityManager em ; 
    EntityTransaction tx;
    
    public EmpDao()
    {     
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GEDPU");
        em= emf.createEntityManager();
        tx= em.getTransaction();
       // tx.begin();
        
    }
    
    public void Add(Emp E)
    {
        try {
            tx.begin();
            em.persist(E);
            tx.commit();

        } catch (Exception ex) {
            System.err.print(ex.getMessage());
        }
        
    }
    
    public List<Emp> findAll()
    {
          Query req= em.createQuery("SELECT e FROM Emp e");
          return req.getResultList();
    }
    
    public Emp findById(String code)
    {
        tx.begin();
        Emp d ;
        //find par défaut fait la recherche par l'id, if we want to seach by an other attribute we simply gotta define our request 
        d = em.find(Emp.class, code);
        tx.commit();
        return d ;
    }
    
    public List<Emp> findAllByDept(Dept D) {
        System.out.println(D.getDname());
        TypedQuery<Emp> req = em.createQuery("select e from Emp e where e.deptno = ?1", Emp.class);
        req.setParameter(1, D);
        //List<Emp> results = req.getResultList();
        return req.getResultList();
    }
    
    public boolean Update(Emp d)
    {
        
        if(findById(d.getEmpno()) == null)
        {
            System.err.println("Pas d'Employee avec ce code!!");
            return false;
        }
        tx.begin();
        try
        {
            em.merge(d);
        } catch(Exception ex){
            tx.commit();
            return false;
        }
        tx.commit();
        return true;
    }
    
    public void remove(String code)
    {
        Emp d ;
        tx.begin();
        d=em.find(Emp.class, code );
        em.remove(d);
        tx.commit();
            
    }
}

