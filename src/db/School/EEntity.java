package db.School;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "E", schema = "School")
@IdClass(EEntityPK.class)
public class EEntity implements Serializable {
    private String xh;
    private String xq;
    private String kh;
    private String gh;
    private Integer pscj;
    private Integer kscj;
    private Integer zpcj;

    @Id
    @Column(name = "xh", nullable = false, length = 4)
    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

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
    @Column(name = "pscj")
    public Integer getPscj() {
        return pscj;
    }

    public void setPscj(Integer pscj) {
        this.pscj = pscj;
    }

    @Basic
    @Column(name = "kscj")
    public Integer getKscj() {
        return kscj;
    }

    public void setKscj(Integer kscj) {
        this.kscj = kscj;
    }

    @Basic
    @Column(name = "zpcj")
    public Integer getZpcj() {
        return zpcj;
    }

    public void setZpcj(Integer zpcj) {
        this.zpcj = zpcj;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EEntity eEntity = (EEntity) o;
        return Objects.equals(xh, eEntity.xh) &&
                Objects.equals(xq, eEntity.xq) &&
                Objects.equals(kh, eEntity.kh) &&
                Objects.equals(gh, eEntity.gh) &&
                Objects.equals(pscj, eEntity.pscj) &&
                Objects.equals(kscj, eEntity.kscj) &&
                Objects.equals(zpcj, eEntity.zpcj);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xh, xq, kh, gh, pscj, kscj, zpcj);
    }
}
