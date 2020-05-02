package pl.coderslab.heymployment.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "interview_questions")
public class InterviewQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "question_id")
    private long id;

    @NotBlank
    @Size(min = 5, max = 250)
    @Column(name = "question_content")
    private String question;

    @Size(min = 5, max = 1000)
    @Column(name = "answer_content")
    private String answer;

    @Size(min = 1, max = 50)
    @Column(name = "difficulty_level")
    private String difficulty;

    @NotBlank
    @Column(name = "ready")
    private boolean ready;

    @NotBlank
    @ManyToOne
    @JoinColumn(name = "category_id")
    private InterviewCategory interviewCategory;

    @ManyToMany
    @JoinTable(name = "interview_questions_topics",
            joinColumns = {@JoinColumn(name = "question_id")},
            inverseJoinColumns = {@JoinColumn(name = "topic_id")})
    private Set<Topic> topics = new HashSet<>();
}