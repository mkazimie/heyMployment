package pl.coderslab.heymployment.domain;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Data
@ToString(exclude = "interviewCategory")
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

    @Size(max = 5000, message = "Answer cannot contain more than 5000 characters")
    @Column(name = "answer_content")
    private String answer;

    @Column(name = "difficulty_level")
    private String difficulty;

    @Column(name = "ready")
    private boolean ready;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private InterviewCategory interviewCategory;

    private LocalDateTime added;

    @PrePersist
    public void prePersist(){
        added = LocalDateTime.now();
    }

    private LocalDateTime updated;

    @PreUpdate
    public void preUpdate() {
        updated = LocalDateTime.now();
    }

    @Transient
    private String formatAddedDate;

    @Transient
    private String formatUpdatedDate;




}