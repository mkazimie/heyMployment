package pl.coderslab.heymployment.domain;

import lombok.*;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.datetime.DateFormatter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
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
    @Size(min = 5, max = 50, message = "* Title must be between 5 and 50 character long")
    @Column(name = "job_title")
    private String title;

    @Size(max = 5000, message = "* Description is too long")
    @Column(name = "job_description")
    private String description;

    @URL
    @Column(name = "job_offer_url")
    private String url;

    @NotBlank
    @Size(min = 3, max = 50, message = "* Location must be between 5 and 50 character long")
    @Column(name = "job_location")
    private String location;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @Column(name = "job_search_website")
    private String jobSearchWebsite;

    @Column(name = "salary")
    private String salary;

    @NotEmpty
    @Size(min = 1, max = 50)
    @Column(name = "job_offer_status")
    private String status;

    @Column(name = "how_attractive")
    private String howAttractive;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Past(message = "* Future date not allowed")
    @Column(name = "applied_on")
    private LocalDate appliedOn;

    @Column(name = "notes")
    @Size(max = 1000)
    private String notes;

    @OneToMany(mappedBy = "jobOffer", cascade = CascadeType.REMOVE)
    private Set<Todo> todos = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Transient
    private boolean editedVersion;

}
