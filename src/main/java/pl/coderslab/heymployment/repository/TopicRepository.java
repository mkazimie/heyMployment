package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.Topic;

import java.util.List;

@Repository
public interface TopicRepository extends JpaRepository<Topic, Long> {

    Topic findByName(String name);



}
