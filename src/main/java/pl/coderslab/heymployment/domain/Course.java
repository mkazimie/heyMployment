package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.URL;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "course_id")
    private long id;

    @NotBlank
    @Size(min = 2, max = 50)
    @Column(name = "course_name")
    private String name;

    @Size(min = 5, max = 1000)
    @Column(name = "description")
    private String description;

    @NotBlank
    @Size(min = 2, max = 50)
    @Column(name = "completion_status")
    private String status;

    @URL
    @Column(name = "course_url")
    private String url;

    @Size(min = 2, max = 50)
    @Column(name = "organized_by")
    private String organizedBy;


    @Column(name = "finish_date")
    private LocalDate finishDate;

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "courses_topics",
            joinColumns = {@JoinColumn(name = "course_id")},
            inverseJoinColumns = {@JoinColumn(name = "topic_id")})
    private Set<Topic> topics = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "course")
    private Set<Todo> todos = new HashSet<>();


}
