package pl.coderslab.heymployment.domain;

import lombok.*;

import javax.persistence.*;
import java.util.List;

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

    @ManyToMany(mappedBy = "topics")
    private List<Course> courses;

    public Topic(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return name;
    }


}
