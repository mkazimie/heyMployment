package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.CourseDto;

import java.util.List;
import java.util.Set;

public interface TopicService {

    Topic findByName(String name);

    Topic findById(long id);

    Topic saveTopic(Topic topic);

    void deleteTopic(long id);

    List<Topic> findAll();

    Set<Topic> getOrCreateNew (CourseDto courseDto);


}
