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
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;


public class DepDao {

    EntityManager em;
    EntityTransaction tx;

    public DepDao() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("GEDPU");
        em = emf.createEntityManager();
        tx = em.getTransaction();

    }

    public void add(Dept d) {
        try {
            tx.begin();
            em.persist(d);
            tx.commit();

        } catch (Exception ex) {
            System.err.print(ex.getMessage());
        }

    }

    public boolean update(Dept d) {
        if (findById(d.getDeptno()) == null) {

            System.err.println("PAS DEPARTEMENT AVEC CE CODE !!");
            return false;
        }
        try {
            tx.begin();
            em.merge(d);
            tx.commit();
        } catch (Exception ex) {
            System.err.print(ex.getMessage());
            tx.commit();
            return false;
        }

        return true;
    }

    public List<Dept> findAll() {
        Query req = em.createQuery("select d from Dept d");
        return req.getResultList();
    }

    public Dept findById(String code) {
        Dept d;
        try {
            Query req = em.createQuery("select d from Dept d where d.deptno='" + code + "'");
            List<Dept> liste = req.getResultList();
            return (Dept) req.getSingleResult();
        } catch (Exception ex) {
            System.err.print(ex.getMessage());
            return null;

        }

    }

    public void delete(String code) {
        if (findById(code) == null) {

            System.err.println("PAS DEPARTEMENT AVEC CE CODE (" + code + ") !!");
            return;
        }

        try {
            tx.begin();
            Dept d = em.find(Dept.class, code);
            em.remove(d);

        } catch (Exception ex) {
            System.err.print(ex.getMessage());
        }
        tx.commit();
    }

}