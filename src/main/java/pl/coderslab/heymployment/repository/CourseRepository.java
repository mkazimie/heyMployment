package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.Course;
import pl.coderslab.heymployment.domain.JobOffer;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {


    @Query("SELECT c FROM Course c WHERE c.user.id = ?1 ORDER BY c.id DESC")
    List<Course> findAllByUserId(long id);

    @Query("SELECT c FROM Course c WHERE c.user.id = ?1 and c.status = ?2 ORDER BY c.id DESC")
    List<Course> findAllByUserIdAndStatus(long id, String status);

    @Query("SELECT c FROM Course c LEFT JOIN c.topics t WHERE t.name LIKE %?1%")
    List<Course> findAllByTopics(String topic);

}

