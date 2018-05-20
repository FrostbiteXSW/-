import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import db.School.EEntity;
import db.School.SEntity;
import db.School.TEntity;
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
        Session session = getSession();
        for (String s : kh) {
            Transaction transaction = session.beginTransaction();
            EEntity e = new EEntity();
            e.setKh(s.substring(0, s.indexOf('|')));
            s = s.substring(s.indexOf('|') + 1);
            for (Object aList : session.createQuery("select ")) {
                Object[] tuple = (Object[]) aList;
                String kh = (String) tuple[0], km = (String) tuple[1], sksj = (String) tuple[2], xm = (String) tuple[3], xq = (String) tuple[4];
                int xf = (int) tuple[5];
                out.print("\n" +
                        "<tr>\n" +
                        "   <td class='InnerBlock'>" + kh + "</td>\n" +
                        "   <td class='InnerBlock'>" + km + "</td>\n" +
                        "   <td class='InnerBlock'>" + xq + "</td>\n" +
                        "   <td class='InnerBlock'>" + sksj + "</td>\n" +
                        "   <td class='InnerBlock'>" + xm + "</td>\n" +
                        "   <td class='InnerBlock'>" + xf + "</td>\n" +
                        "   <td class='InnerBlock' style='text-align: center'><input type='checkbox' name='kh' value='" + kh + "|" + xm + "|" + xq + "|" + "'/></td>\n" +
                        "</tr>\n");
            }
            transaction.commit();
        }
        return "failed";
    }
}
