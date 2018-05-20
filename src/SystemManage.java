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
            Transaction transaction = session.beginTransaction();
            switch (table) {
                case "C":
                    for (int i = 0; i < content.length / 5; i++) {
                        CEntity c = new CEntity();
                        c.setKh(content[i]);
                        c.setKm(content[i + 1]);
                        c.setXf(Integer.parseInt(content[i + 2]));
                        c.setXs(Integer.parseInt(content[i + 3]));
                        c.setYxh(content[i + 4]);
                        session.update(c);
                    }
                    break;
                case "D":
                    for (int i = 0; i < content.length / 4; i++) {
                        DEntity d = new DEntity();
                        d.setYxh(content[i]);
                        d.setMc(content[i + 1]);
                        d.setDz(content[i + 2]);
                        d.setLxdh(content[i + 3]);
                        session.update(d);
                    }
                    break;
                case "E":
                    for (int i = 0; i < content.length / 8; i++) {
                        EEntity e = new EEntity();
                        e.setXh(content[i]);
                        e.setXq(content[i + 1]);
                        e.setGh(content[i + 2]);
                        e.setKh(content[i + 3]);
                        e.setGh(content[i + 4]);
                        e.setPscj(Integer.parseInt(content[i + 5]));
                        e.setKscj(Integer.parseInt(content[i + 6]));
                        e.setZpcj(Integer.parseInt(content[i + 7]));
                        session.update(e);
                    }
                    break;
                case "O":
                    for (int i = 0; i < content.length / 4; i++) {
                        OEntity o = new OEntity();
                        o.setXq(content[i]);
                        o.setKh(content[i + 1]);
                        o.setGh(content[i + 2]);
                        o.setSksj(content[i + 3]);
                        session.update(o);
                    }
                    break;
                case "S":
                    for (int i = 0; i < content.length / 7; i++) {
                        SEntity s = new SEntity();
                        s.setXh(content[i]);
                        s.setXm(content[i + 1]);
                        s.setXb(content[i + 2]);
                        s.setCsrq(content[i + 3]);
                        s.setJg(content[i + 4]);
                        s.setSjhm(content[i + 5]);
                        s.setYxh(content[i + 6]);
                        session.update(s);
                    }
                    break;
                case "T":
                    for (int i = 0; i < content.length / 7; i++) {
                        TEntity t = new TEntity();
                        t.setGh(content[i]);
                        t.setXm(content[i + 1]);
                        t.setXb(content[i + 2]);
                        t.setCsrq(content[i + 3]);
                        t.setXl(content[i + 4]);
                        t.setJbgz(new BigDecimal(content[i + 5]));
                        t.setYxh(content[i + 6]);
                        session.update(t);
                    }
                    break;
                default:
                    transaction.commit();
                    return "failed";
            }
            transaction.commit();
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
