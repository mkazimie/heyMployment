package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.InterviewCategory;

@Repository
public interface InterviewCategoryRepository extends JpaRepository<InterviewCategory, Long > {
}
