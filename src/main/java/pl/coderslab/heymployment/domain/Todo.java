package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Future;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="to_dos")
public class Todo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "to_do_id")
    private long id;

    @Column(name = "to_do_name")
    private String name;

    @Column(name = "to_do_description")
    private String description;

    @ManyToOne
    @JoinColumn(name= "job_offer_id")
    private JobOffer jobOffer;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    @Future
    @Column(name = "deadline")
    private LocalDate deadline;

    @Column(name = "is_done")
    private boolean done;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;


}
