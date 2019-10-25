package entities;

import entities.Emp;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-10-25T06:41:11")
@StaticMetamodel(Dept.class)
public class Dept_ { 

    public static volatile ListAttribute<Dept, Emp> empList;
    public static volatile SingularAttribute<Dept, String> dname;
    public static volatile SingularAttribute<Dept, String> deptno;

}