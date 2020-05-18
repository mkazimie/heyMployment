package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.*;
import pl.coderslab.heymployment.domain.dto.CategoryDto;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.exception.RecordAlreadyExistsException;
import pl.coderslab.heymployment.repository.InterviewCategoryRepository;
import pl.coderslab.heymployment.repository.InterviewQuestionRepository;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final InterviewCategoryRepository categoryRepository;
    private final InterviewQuestionRepository questionRepository;

    public CategoryServiceImpl(InterviewCategoryRepository categoryRepository, InterviewQuestionRepository questionRepository) {
        this.categoryRepository = categoryRepository;
        this.questionRepository = questionRepository;
    }

    @Override
    public List<InterviewCategory> findAll(long id) {
        return categoryRepository.findAllByUserId(id);
    }

    @Override
    public InterviewCategory findById(long id) {
        Optional<InterviewCategory> category = categoryRepository.findById(id);
        return category.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }

    @Override
    public InterviewCategory findByName(String name) {
        return categoryRepository.findByName(name);
    }


    // delete category with all its questions
    @Override
    public void deleteCategory(long id) {
        InterviewCategory toDelete = findById(id);
        List<InterviewQuestion> interviewQuestions = toDelete.getInterviewQuestions();
        for (Iterator<InterviewQuestion> it = interviewQuestions.iterator(); it.hasNext();){
            InterviewQuestion next = it.next();
            it.remove();;
            questionRepository.delete(next);
        }
        categoryRepository.delete(toDelete);
    }

    @Override
    public InterviewCategory saveCategory(InterviewCategory category) {
        return categoryRepository.save(category);
    }

    @Override
    public InterviewCategory createCategory(CategoryDto categoryDto) throws RecordAlreadyExistsException{
        if (findByName(categoryDto.getName()) != null){
            throw new RecordAlreadyExistsException("Record already exists in the database");
        } else {
            InterviewCategory category = new InterviewCategory();
            category.setName(categoryDto.getName());
            return category;
        }
    }



    // FIX METHOD FOR NOT ADDING A DUPLICATE NAME OF CATEGORY
//    @Override
//    public void checkCategoryExists(InterviewCategory category) throws RecordAlreadyExistsException {
//        if (categoryRepository.findByName(category.getName()) != null) {
//            throw new RecordAlreadyExistsException("Record already exists in database");
//        }
//    }

}
