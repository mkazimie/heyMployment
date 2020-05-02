package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.InterviewQuestion;

@Repository
public interface InterviewQuestionRepository extends JpaRepository<InterviewQuestion, Long > {
}
