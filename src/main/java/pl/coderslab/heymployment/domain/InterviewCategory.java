package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "interview_categories")
public class InterviewCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private long id;

    @Column(name = "category_name")
    private String name;

    @NotEmpty
    @ManyToMany
    @JoinTable(name = "interview_categories_topics",
            joinColumns = {@JoinColumn(name = "category_id")},
            inverseJoinColumns = {@JoinColumn(name = "topic_id")})
    private Set<Topic> topics = new HashSet<>();

    @OneToMany(mappedBy = "interviewCategory")
    private Set<InterviewQuestion> interviewQuestions = new HashSet<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

}
