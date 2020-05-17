package pl.coderslab.heymployment.domain;

import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@ToString(exclude = "interviewQuestions")
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

    @OneToMany(mappedBy = "interviewCategory")
    private List<InterviewQuestion> interviewQuestions = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public void addQuestion(InterviewQuestion question){
        if(question != null) {
            interviewQuestions.add(question);
        }
    }


}
