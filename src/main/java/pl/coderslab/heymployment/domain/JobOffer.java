package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "job_offers")
public class JobOffer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_offer_id")
    private long id;

    @NotBlank
    @Size(min = 5, max = 50)
    @Column(name = "job_title")
    private String title;

    @Size(min = 5, max = 5000)
    @Column(name = "job_description")
    private String description;

    @URL
    @Column(name = "job_offer_url")
    private String url;

    @NotBlank
    @Size(min=3, max = 50)
    @Column(name = "job_location")
    private String location;

    @NotBlank
    @Size(min = 2, max = 50)
    @Column(name = "company_name")
    private String companyName;

    @Column(name = "salary")
    private double salary;

    @NotBlank
    @Size(min = 1, max = 50)
    @Column(name = "job_offer_status")
    private String status;

    @NotEmpty
    @Range(min = 1, max = 5)
    @Column(name = "attractiveness_level")
    private int howAttractive;

    @Past
    @Column(name = "applied_on")
    private LocalDate appliedOn;

    @Column(name = "notes")
    @Size(max = 1000)
    private String notes;

    @OneToMany(mappedBy = "jobOffer")
    private Set<Todo> todos = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;





}
