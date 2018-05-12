package com.db.School;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "T", schema = "School", catalog = "")
public class TEntity {
    private String gh;
    private String xm;
    private String xb;
    private String csrq;
    private String xl;
    private BigDecimal jbgz;

    @Id
    @Column(name = "gh", nullable = false, length = 4)
    public String getGh() {
        return gh;
    }

    public void setGh(String gh) {
        this.gh = gh;
    }

    @Basic
    @Column(name = "xm", nullable = false, length = 20)
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
    @Column(name = "xl", nullable = false, length = 10)
    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl;
    }

    @Basic
    @Column(name = "jbgz", nullable = false, precision = 2)
    public BigDecimal getJbgz() {
        return jbgz;
    }

    public void setJbgz(BigDecimal jbgz) {
        this.jbgz = jbgz;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TEntity tEntity = (TEntity) o;
        return Objects.equals(gh, tEntity.gh) &&
                Objects.equals(xm, tEntity.xm) &&
                Objects.equals(xb, tEntity.xb) &&
                Objects.equals(csrq, tEntity.csrq) &&
                Objects.equals(xl, tEntity.xl) &&
                Objects.equals(jbgz, tEntity.jbgz);
    }

    @Override
    public int hashCode() {

        return Objects.hash(gh, xm, xb, csrq, xl, jbgz);
    }
}
