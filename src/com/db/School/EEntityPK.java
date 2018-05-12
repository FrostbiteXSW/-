package com.db.School;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class EEntityPK implements Serializable {
    private String xh;
    private String xq;
    private String kh;

    @Column(name = "xh", nullable = false, length = 4)
    @Id
    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        EEntityPK eEntityPK = (EEntityPK) o;
        return Objects.equals(xh, eEntityPK.xh) &&
                Objects.equals(xq, eEntityPK.xq) &&
                Objects.equals(kh, eEntityPK.kh);
    }

    @Override
    public int hashCode() {

        return Objects.hash(xh, xq, kh);
    }
}
