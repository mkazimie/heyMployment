package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long > {
}
