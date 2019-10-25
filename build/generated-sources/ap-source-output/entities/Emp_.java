package entities;

import entities.Dept;
import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-10-25T06:41:11")
@StaticMetamodel(Emp.class)
public class Emp_ { 

    public static volatile SingularAttribute<Emp, String> ename;
    public static volatile SingularAttribute<Emp, String> empno;
    public static volatile SingularAttribute<Emp, Dept> deptno;
    public static volatile SingularAttribute<Emp, BigDecimal> sal;

}