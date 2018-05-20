package db.School;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "D", schema = "School")
public class DEntity {
    private String yxh;
    private String mc;
    private String dz;
    private String lxdh;

    @Id
    @Column(name = "yxh", nullable = false, length = 2)
    public String getYxh() {
        return yxh;
    }

    public void setYxh(String yxh) {
        this.yxh = yxh;
    }

    @Basic
    @Column(name = "mc", nullable = false, length = 20)
    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    @Basic
    @Column(name = "dz", nullable = false, length = 50)
    public String getDz() {
        return dz;
    }

    public void setDz(String dz) {
        this.dz = dz;
    }

    @Basic
    @Column(name = "lxdh", nullable = false, length = 8)
    public String getLxdh() {
        return lxdh;
    }

    public void setLxdh(String lxdh) {
        this.lxdh = lxdh;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DEntity dEntity = (DEntity) o;
        return Objects.equals(yxh, dEntity.yxh) &&
                Objects.equals(mc, dEntity.mc) &&
                Objects.equals(dz, dEntity.dz) &&
                Objects.equals(lxdh, dEntity.lxdh);
    }

    @Override
    public int hashCode() {

        return Objects.hash(yxh, mc, dz, lxdh);
    }
}
