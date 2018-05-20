import com.opensymphony.xwork2.ActionSupport;
import db.School.OEntity;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class OpenCourse extends ActionSupport {
    private static final SessionFactory ourSessionFactory;
    private String kh, sksj, xq, gh;

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
            OEntity o = new OEntity();
            o.setSksj(sksj);
            o.setGh(gh);
            o.setKh(kh);
            o.setXq(xq);
            session.save(o);
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

    public String getSksj() {
        return sksj;
    }

    public void setSksj(String sksj) {
        this.sksj = sksj;
    }

    public String getXq() {
        return xq;
    }

    public void setXq(String xq) {
        this.xq = xq;
    }

    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }
}
