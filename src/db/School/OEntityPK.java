package db.School;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class OEntityPK implements Serializable {
    private String xq;
    private String kh;
    private String gh;

    @Column(name = "xq", nullable = false, length = 11)
    @Id
    public String getXq() {
        return xq;
    }

    public void setXq(String xq) {
        this.xq = xq;
    }

    @Column(name = "kh", nullable = false, length = 8)
    @Id
    public String getKh() {
        return kh;
    }

    public void setKh(String kh) {
        this.kh = kh;
    }

    @Column(name = "gh", nullable = false, length = 4)
    @Id
    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OEntityPK oEntityPK = (OEntityPK) o;
        return Objects.equals(xq, oEntityPK.xq) &&
                Objects.equals(kh, oEntityPK.kh) &&
                Objects.equals(gh, oEntityPK.gh);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xq, kh, gh);
    }
}
