package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.CourseDto;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.repository.TopicRepository;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.util.*;

@Service
public class TopicServiceImpl implements TopicService {

    private final TopicRepository topicRepository;

    public TopicServiceImpl(TopicRepository topicRepository) {
        this.topicRepository = topicRepository;
    }

    @Override
    public Topic findByName(String name) {
        return topicRepository.findByName(name);
    }

    @Override
    public Topic findById(long id) {
        Optional<Topic> topic = topicRepository.findById(id);
        return topic.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }

    @Override
    public Topic saveTopic(Topic topic) {
        return topicRepository.save(topic);
    }

    @Override
    public void deleteTopic(long id) {
        topicRepository.delete(findById(id));
    }

    @Override
    public List<Topic> findAll() {
        return topicRepository.findAll();
    }


    @Override
    public List<Topic> getOrCreateNew(CourseDto courseDto) {
        List<String> dtoTopics = new ArrayList<>(Arrays.asList((courseDto.getMainTopic()),
                courseDto.getAdditionalTopic1(), courseDto.getAdditionalTopic2()));
        List<Topic> topics = new ArrayList<>();

        for (String dtoTopic : dtoTopics) {
            if (!dtoTopic.isEmpty()) {
                Topic topic = topicRepository.findByName(dtoTopic);
                if (topic == null) {
                    topic = new Topic();
                    topic.setName(dtoTopic);
                    saveTopic(topic);
                }
                topics.add(topic);
            }
        }
        return topics;
    }


}



