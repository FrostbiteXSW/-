package db.School;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "O", schema = "School")
@IdClass(OEntityPK.class)
public class OEntity  implements Serializable {
    private String xq;
    private String kh;
    private String gh;
    private String sksj;

    @Id
    @Column(name = "xq", nullable = false, length = 11)
    public String getXq() {
        return xq;
    }

    public void setXq(String xq) {
        this.xq = xq;
    }

    @Id
    @Column(name = "kh", nullable = false, length = 8)
    public String getKh() {
        return kh;
    }

    public void setKh(String kh) {
        this.kh = kh;
    }

    @Id
    @Column(name = "gh", nullable = false, length = 4)
    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    @Basic
    @Column(name = "sksj", nullable = false, length = 8)
    public String getSksj() {
        return sksj;
    }

    public void setSksj(String sksj) {
        this.sksj = sksj;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OEntity oEntity = (OEntity) o;
        return Objects.equals(xq, oEntity.xq) &&
                Objects.equals(kh, oEntity.kh) &&
                Objects.equals(gh, oEntity.gh) &&
                Objects.equals(sksj, oEntity.sksj);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xq, kh, gh, sksj);
    }
}
