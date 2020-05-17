package pl.coderslab.heymployment.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "interviewCategories")
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private long id;

    @NotBlank
    @Column(name = "first_name")
    private String firstName;

    @NotBlank
    @Column(name = "last_name")
    private String lastName;

    @NotBlank
    @Length(min = 5, message = "Your username must have at least 5 characters")
    @Column(name = "username", unique = true)
    private String username;

    @NotBlank
    @Email
    @Column(name = "email", unique = true)
    private String email;

    @NotBlank
    @Length(min = 5, message = "Your password must have at least 5 characters")
    @Column(name = "password")
    private String password;

    @Column(name = "enabled")
    private int enabled;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "users_roles", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @OneToMany(mappedBy = "user")
    private Set<Course> courses = new HashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<JobOffer> jobOffers = new HashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<InterviewCategory> interviewCategories = new HashSet<>();

    @OneToMany(mappedBy = "user")
    private Set<Todo> todos = new HashSet<>();

}
