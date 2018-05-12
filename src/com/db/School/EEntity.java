package com.db.School;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "E", schema = "School", catalog = "")
@IdClass(EEntityPK.class)
public class EEntity {
    private String xh;
    private String xq;
    private String kh;
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

    @Basic
    @Column(name = "pscj", nullable = true)
    public Integer getPscj() {
        return pscj;
    }

    public void setPscj(Integer pscj) {
        this.pscj = pscj;
    }

    @Basic
    @Column(name = "kscj", nullable = true)
    public Integer getKscj() {
        return kscj;
    }

    public void setKscj(Integer kscj) {
        this.kscj = kscj;
    }

    @Basic
    @Column(name = "zpcj", nullable = true)
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
                Objects.equals(pscj, eEntity.pscj) &&
                Objects.equals(kscj, eEntity.kscj) &&
                Objects.equals(zpcj, eEntity.zpcj);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xh, xq, kh, pscj, kscj, zpcj);
    }
}
