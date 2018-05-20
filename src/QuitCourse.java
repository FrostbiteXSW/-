import com.opensymphony.xwork2.ActionSupport;
import db.School.EEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class QuitCourse extends ActionSupport {
    private static final SessionFactory ourSessionFactory;
    private String[] kh;

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
            for (String s : kh) {
                Transaction transaction = session.beginTransaction();
                EEntity e = new EEntity();
                e.setKh(s.substring(0, s.indexOf('|')));
                s = s.substring(s.indexOf('|') + 1);
                for (Object obj : session.createQuery("select T.gh from TEntity as T where T.xm ='"+ s.substring(0, s.indexOf('|')) +"'").list()) {
                    String str = (String) obj;
                    e.setGh(str);
                }
                s = s.substring(s.indexOf('|') + 1);
                e.setXq(s.substring(0, s.indexOf('|')));
                s = s.substring(s.indexOf('|') + 1);
                e.setXh(s);
                session.delete(e);
                transaction.commit();
            }
            return "success";
        } catch (Exception e) {
            return "failed";
        }
    }

    public void setKh(String[] kh) {
        this.kh = kh;
    }
}
