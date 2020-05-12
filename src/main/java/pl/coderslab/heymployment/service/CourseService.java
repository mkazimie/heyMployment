package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.Course;
import pl.coderslab.heymployment.domain.dto.CourseDto;

import java.util.List;

public interface CourseService {

    List<Course> findAll(long id);

    List<Course> findAllByStatus(long id, String status);

    List<Course> findAllByTopic(String topic);

    Course findById(long id);

    void deleteCourse(long id);

    Course saveCourse(Course course);

    Course createCourseFromForm(CourseDto courseDto);

}
