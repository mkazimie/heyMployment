package pl.coderslab.heymployment.domain;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDate;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="to_dos")
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "to_do_id")
    private long id;

    @NotBlank
    @Size(min = 5, max = 50, message = "* Name must be between 5 and 50 character long")
    @Column(name = "to_do_name")
    private String name;

    @Size(max = 5000, message = "* Description is too long")
    @Column(name = "to_do_description")
    private String description;

    @ManyToOne
    @JoinColumn(name= "job_offer_id")
    private JobOffer jobOffer;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future(message = "* Past Date Not Allowed")
    @Column(name = "deadline")
    private LocalDate deadline;

    @Column(name = "is_done")
    private boolean done;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


}
