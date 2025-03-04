package hibernate;

import jakarta.persistence.*;
import java.util.UUID;
import java.math.BigDecimal;

@Entity
@Table(name = "usuario") 
public class Usuario {

    @Id
    @GeneratedValue(generator = "UUID")
    @Column(columnDefinition = "UUID DEFAULT gen_random_uuid()")
    private UUID id;  // Cambiado de Long a UUID

    @Column(unique = true, nullable = false)
    private String email;

    @Column(unique = true, nullable = false)
    private String username;

    @Column(nullable = false)
    private String password;    

    @Column(name = "precio_coches", precision = 12, scale = 2)
    private BigDecimal precioCoches;
    

    public UUID getId() { return id; }
    public void setId(UUID id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
