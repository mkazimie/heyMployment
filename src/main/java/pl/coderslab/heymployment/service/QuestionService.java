package pl.coderslab.heymployment.service;
import pl.coderslab.heymployment.domain.InterviewQuestion;
import pl.coderslab.heymployment.domain.dto.QuestionDto;

import java.util.List;

public interface QuestionService {

    List<InterviewQuestion> findAllByCategoryName(String name);

    List<InterviewQuestion> findAllByCategoryId(long id);

    InterviewQuestion findById(long id);

    void deleteQuestion (long id);

    InterviewQuestion saveQuestion (InterviewQuestion question);

    InterviewQuestion createQuestionFromDto(QuestionDto qDto);
}
