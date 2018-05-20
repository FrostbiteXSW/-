import com.opensymphony.xwork2.ActionContext;
import db.School.SEntity;
import db.School.TEntity;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Login extends ActionSupport {
    private String username, password;
    private static final SessionFactory ourSessionFactory;

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
        ActionContext.getContext().getSession().put("username", this.username);
        if (!this.username.equals(password))
            return "failed";
        if (this.username.equals("system"))
            return "system";
        Session session = getSession();
        for (Object object : session.createQuery("from SEntity").list()) {
            SEntity sEntity = (SEntity)object;
            if (sEntity.getXh().equals(this.username))
                return "student";
        }
        for (Object object : session.createQuery("from TEntity").list()) {
            TEntity tEntity = (TEntity)object;
            if (tEntity.getGh().equals(this.username))
                return "teacher";
        }
        return "failed";
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
