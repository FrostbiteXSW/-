package db.School;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "C", schema = "School")
public class CEntity {
    private String kh;
    private String km;
    private int xf;
    private int xs;
    private String yxh;

    @Id
    @Column(name = "kh", nullable = false, length = 8)
    public String getKh() {
        return kh;
    }

    public void setKh(String kh) {
        this.kh = kh;
    }

    @Basic
    @Column(name = "km", nullable = false, length = 20)
    public String getKm() {
        return km;
    }

    public void setKm(String km) {
        this.km = km;
    }

    @Basic
    @Column(name = "xf", nullable = false)
    public int getXf() {
        return xf;
    }

    public void setXf(int xf) {
        this.xf = xf;
    }

    @Basic
    @Column(name = "xs", nullable = false)
    public int getXs() {
        return xs;
    }

    public void setXs(int xs) {
        this.xs = xs;
    }

    @Basic
    @Column(name = "yxh", nullable = false)
    public String getYxh() {
        return yxh;
    }

    public void setYxh(String yxh) {
        this.yxh = yxh;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CEntity cEntity = (CEntity) o;
        return xf == cEntity.xf &&
                xs == cEntity.xs &&
                Objects.equals(kh, cEntity.kh) &&
                Objects.equals(km, cEntity.km);
    }

    @Override
    public int hashCode() {

        return Objects.hash(kh, km, xf, xs);
    }
}
