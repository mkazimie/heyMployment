package pl.coderslab.heymployment.domain;

import lombok.*;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Getter
@Setter
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
    @Size(min = 2, max = 50, message = "* Name must be between 5 and 50 character long")
    @Column(name = "course_name")
    private String name;

    @Size(max = 1000, message = "* Description is too long")
    @Column(name = "description")
    private String description;

    @NotEmpty
    @Column(name = "completion_status")
    private String status;

    @URL
    @Column(name = "course_url")
    private String url;

    @Size(min = 2, max = 50, message = "* The organizing entity name must be between 5 and 50 character long")
    @Column(name = "organized_by")
    private String organizedBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "finish_date")
    private LocalDate finishDate;

    @ManyToMany(cascade= CascadeType.ALL)
    @JoinTable(name = "courses_topics",
            joinColumns = {@JoinColumn(name = "course_id")},
            inverseJoinColumns = {@JoinColumn(name = "topic_id")})
    private List<Topic> topics;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "course")
    private Set<Todo> todos = new HashSet<>();

    public void removeTopics(Topic topic) {
        if (topic != null) {
            topics.remove(topic);
        }

    }


}
