package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.InterviewCategory;

import java.util.List;

@Repository
public interface InterviewCategoryRepository extends JpaRepository<InterviewCategory, Long > {

    @Query("SELECT c FROM InterviewCategory c WHERE c.user.id = ?1 ORDER BY c.name")
    List<InterviewCategory> findAllByUserId(long id);

   InterviewCategory findByName(String name);
}
