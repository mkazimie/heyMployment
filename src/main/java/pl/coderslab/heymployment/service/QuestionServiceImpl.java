package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.InterviewQuestion;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.repository.InterviewQuestionRepository;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionServiceImpl implements QuestionService {

    private final InterviewQuestionRepository questionRepository;

    public QuestionServiceImpl(InterviewQuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }

    @Override
    public List<InterviewQuestion> findAllByCategoryName(String name) {
        return questionRepository.findAllByInterviewCategoryName(name);
    }

    @Override
    public List<InterviewQuestion> findAllByCategoryId(long id) {
        return questionRepository.findAllByInterviewCategoryId(id);
    }

    @Override
    public InterviewQuestion findById(long id) {
        Optional<InterviewQuestion> question = questionRepository.findById(id);
        return question.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }

    @Override
    public void deleteQuestion(long id) {
        questionRepository.delete(findById(id));
    }

    @Override
    public InterviewQuestion saveQuestion(InterviewQuestion question) {
        return questionRepository.save(question);
    }
}
