package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Course;
import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.domain.dto.CourseDto;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.repository.CourseRepository;
import pl.coderslab.heymployment.repository.TopicRepository;

import java.util.*;

@Service
public class CourseServiceImpl implements CourseService {

    private final CourseRepository courseRepository;
    private final TopicRepository topicRepository;

    public CourseServiceImpl(CourseRepository courseRepository, TopicRepository topicRepository) {
        this.courseRepository = courseRepository;
        this.topicRepository = topicRepository;
    }

    @Override
    public List<Course> findAll(long id) {
        return courseRepository.findAllByUserId(id);
    }

    @Override
    public List<Course> findAllByStatus(long id, String status) {
        return courseRepository.findAllByUserIdAndStatus(id, status);
    }

    @Override
    public List<Course> findAllByTopic(String topic) {
        return courseRepository.findAllByTopics(topic);
    }

    @Override
    public Course findById(long id) {
        Optional<Course> course = courseRepository.findById(id);
        return course.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }

    // delete course and its topics directly from DB
    @Override
    public void deleteCourse(long id) {
        Course toDelete = findById(id);
        List<Topic> topics = toDelete.getTopics();
        for (Iterator<Topic> it = topics.iterator(); it.hasNext(); ) {
            Topic next = it.next();
            it.remove();
            topicRepository.delete(next);
        }
        courseRepository.delete(toDelete);
    }


    @Override
    public Course saveCourse(Course course) {
        return courseRepository.save(course);
    }

    @Override
    public Course createCourseFromForm(CourseDto courseDto) {
        Course course = new Course();
        course.setName(courseDto.getName());
        course.setDescription(courseDto.getDescription());
        course.setStatus(courseDto.getStatus());
        course.setUrl(courseDto.getUrl());
        course.setFinishDate(courseDto.getFinishDate());
        course.setOrganizedBy(courseDto.getOrganizedBy());
        return course;
    }

}
