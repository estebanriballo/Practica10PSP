package hibernate;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "coche")
public class Coche {
    
    @Id
    private String matricula;

    @Column(nullable = false)
    private String marca;

    @Column(nullable = false)
    private String modelo;

    @Column(nullable = false)
    private String imagen;

    @Column(nullable = false)
    private BigDecimal precio;

    @Column(name = "fecha_lanzamiento")
    private LocalDate fechaLanzamiento;

    @ManyToOne
    @JoinColumn(name = "dueño") // Se asocia con la columna dueño en la BD
    private Usuario dueño; // Cambiar de UUID a Usuario

    public Coche() {}

    public Coche(String matricula, String marca, String modelo, String imagen, BigDecimal precio, LocalDate fechaLanzamiento, Usuario dueño) {
        this.matricula = matricula;
        this.marca = marca;
        this.modelo = modelo;
        this.imagen = imagen;
        this.precio = precio;
        this.fechaLanzamiento = fechaLanzamiento;
        this.dueño = dueño;
    }

    // Getters y Setters
    public String getMatricula() { return matricula; }
    public void setMatricula(String matricula) { this.matricula = matricula; }
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
    public String getModelo() { return modelo; }
    public void setModelo(String modelo) { this.modelo = modelo; }
    public String getImagen() { return imagen; }
    public void setImagen(String imagen) { this.imagen = imagen; }
    public BigDecimal getPrecio() { return precio; }
    public void setPrecio(BigDecimal precio) { this.precio = precio; }
    public LocalDate getFechaLanzamiento() { return fechaLanzamiento; }
    public void setFechaLanzamiento(LocalDate fechaLanzamiento) { this.fechaLanzamiento = fechaLanzamiento; }
    public Usuario getDueño() { return dueño; }
    public void setDueño(Usuario dueño) { this.dueño = dueño; }
}
