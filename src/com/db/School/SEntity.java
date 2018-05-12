package com.db.School;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "S", schema = "School", catalog = "")
public class SEntity {
    private String xh;
    private String xm;
    private String xb;
    private String csrq;
    private String jg;
    private String sjhm;

    @Id
    @Column(name = "xh", nullable = false, length = 4)
    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    @Basic
    @Column(name = "xm", nullable = false, length = 10)
    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    @Basic
    @Column(name = "xb", nullable = false, length = 1)
    public String getXb() {
        return xb;
    }

    public void setXb(String xb) {
        this.xb = xb;
    }

    @Basic
    @Column(name = "csrq", nullable = false, length = 8)
    public String getCsrq() {
        return csrq;
    }

    public void setCsrq(String csrq) {
        this.csrq = csrq;
    }

    @Basic
    @Column(name = "jg", nullable = false, length = 10)
    public String getJg() {
        return jg;
    }

    public void setJg(String jg) {
        this.jg = jg;
    }

    @Basic
    @Column(name = "sjhm", nullable = false, length = 11)
    public String getSjhm() {
        return sjhm;
    }

    public void setSjhm(String sjhm) {
        this.sjhm = sjhm;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SEntity sEntity = (SEntity) o;
        return Objects.equals(xh, sEntity.xh) &&
                Objects.equals(xm, sEntity.xm) &&
                Objects.equals(xb, sEntity.xb) &&
                Objects.equals(csrq, sEntity.csrq) &&
                Objects.equals(jg, sEntity.jg) &&
                Objects.equals(sjhm, sEntity.sjhm);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xh, xm, xb, csrq, jg, sjhm);
    }
}
