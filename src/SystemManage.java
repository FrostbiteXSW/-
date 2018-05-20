import com.opensymphony.xwork2.ActionSupport;
import db.School.*;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import java.math.BigDecimal;

public class SystemManage extends ActionSupport {
    private static final SessionFactory ourSessionFactory;
    private String table;
    private String[] content;
    
    static {
        try {
            ourSessionFactory = new Configuration().
                    configure("hibernate.cfg.xml").
                    buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    private static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }

    @Override
    public String execute() throws Exception {
        try {
            Session session = getSession();
            Transaction transaction;
            switch (table) {
                case "C":
                    for (int i = 0; i < content.length; i += 5) {
                        transaction = session.beginTransaction();
                        CEntity c = new CEntity();
                        c.setKh(content[i]);
                        c.setKm(content[i + 1]);
                        c.setXf(Integer.parseInt(content[i + 2]));
                        c.setXs(Integer.parseInt(content[i + 3]));
                        c.setYxh(content[i + 4]);
                        session.update(c);
                        transaction.commit();
                    }
                    break;
                case "D":
                    for (int i = 0; i < content.length; i += 4) {
                        transaction = session.beginTransaction();
                        DEntity d = new DEntity();
                        d.setYxh(content[i]);
                        d.setMc(content[i + 1]);
                        d.setDz(content[i + 2]);
                        d.setLxdh(content[i + 3]);
                        session.update(d);
                        transaction.commit();
                    }
                    break;
                case "E":
                    for (int i = 0; i < content.length; i += 7) {
                        transaction = session.beginTransaction();
                        EEntity e = new EEntity();
                        e.setXh(content[i]);
                        e.setXq(content[i + 1]);
                        e.setKh(content[i + 2]);
                        e.setGh(content[i + 3]);
                        if (content[i + 4].equals("") || content[i + 5].equals("") || content[i + 6].equals("")) {
                            transaction.commit();
                            continue;
                        }
                        e.setPscj(Integer.parseInt(content[i + 4]));
                        e.setKscj(Integer.parseInt(content[i + 5]));
                        e.setZpcj(Integer.parseInt(content[i + 6]));
                        session.update(e);
                        transaction.commit();
                    }
                    break;
                case "O":
                    for (int i = 0; i < content.length; i += 4) {
                        transaction = session.beginTransaction();
                        OEntity o = new OEntity();
                        o.setXq(content[i]);
                        o.setKh(content[i + 1]);
                        o.setGh(content[i + 2]);
                        o.setSksj(content[i + 3]);
                        session.update(o);
                        transaction.commit();
                    }
                    break;
                case "S":
                    for (int i = 0; i < content.length; i += 7) {
                        transaction = session.beginTransaction();
                        SEntity s = new SEntity();
                        s.setXh(content[i]);
                        s.setXm(content[i + 1]);
                        s.setXb(content[i + 2]);
                        s.setCsrq(content[i + 3]);
                        s.setJg(content[i + 4]);
                        s.setSjhm(content[i + 5]);
                        s.setYxh(content[i + 6]);
                        session.update(s);
                        transaction.commit();
                    }
                    break;
                case "T":
                    for (int i = 0; i < content.length; i += 7) {
                        transaction = session.beginTransaction();
                        TEntity t = new TEntity();
                        t.setGh(content[i]);
                        t.setXm(content[i + 1]);
                        t.setXb(content[i + 2]);
                        t.setCsrq(content[i + 3]);
                        t.setXl(content[i + 4]);
                        t.setJbgz(new BigDecimal(content[i + 5]));
                        t.setYxh(content[i + 6]);
                        session.update(t);
                        transaction.commit();
                    }
                    break;
                default:
                    return "failed";
            }
            return "success";
        } catch (Exception e) {
            return "failed";
        }
    }

    public String[] getContent() {
        return content;
    }

    public void setContent(String[] content) {
        this.content = content;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }
}
