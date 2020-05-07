package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "companies")
public class Company {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "company_id")
    private long id;

    @NotBlank
    @Size(min = 5, max = 50)
    @Column(name = "company_name")
    private String name;

    @Size(max = 50)
    @Column(name = "company_location")
    private String location;

    @Size(max = 1000)
    @Column(name = "company_description")
    private String description;

    @URL
    @Column(name = "company_website")
    private String website;

    @OneToMany(mappedBy = "company")
    private Set<JobOffer> jobOffers = new HashSet<>();
}
