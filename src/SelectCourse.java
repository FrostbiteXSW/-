import com.opensymphony.xwork2.ActionSupport;
import db.School.EEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class SelectCourse extends ActionSupport {
    private static final SessionFactory ourSessionFactory;
    private String kh;

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
            EEntity e = new EEntity();
            e.setKh(kh.substring(0, kh.indexOf('|')));
            kh = kh.substring(kh.indexOf('|') + 1);
            e.setXq(kh.substring(0, kh.indexOf('|')));
            kh = kh.substring(kh.indexOf('|') + 1);
            e.setXh(kh.substring(0, kh.indexOf('|')));
            kh = kh.substring(kh.indexOf('|') + 1);
            e.setGh(kh);
            session.save(e);
            transaction.commit();
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "failed";
        }
    }

    public String getKh() {
        return kh;
    }

    public void setKh(String kh) {
        this.kh = kh;
    }
}
