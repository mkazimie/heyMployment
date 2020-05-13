package pl.coderslab.heymployment.formatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.service.TopicService;


public class TopicsConverter implements Converter<String, Topic> {

    @Autowired
    private TopicService topicService;

    @Override
    public Topic convert(String str) {
        return topicService.findByName(str);


    }
}
