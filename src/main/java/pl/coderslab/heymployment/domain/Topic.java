package pl.coderslab.heymployment.domain;

import lombok.*;
import org.springframework.web.bind.annotation.GetMapping;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "topics")
public class Topic {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "topic_id")
    private long id;

    @Column(name = "topic_name")
    private String name;

    public Topic(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }
}
