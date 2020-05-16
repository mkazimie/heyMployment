package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.InterviewCategory;
import pl.coderslab.heymployment.exception.RecordAlreadyExistsException;

import java.util.List;

public interface CategoryService {

    List<InterviewCategory> findAll(long id);

    InterviewCategory findById(long id);

    InterviewCategory findByName(String name);

    void deleteCategory (long id);

    InterviewCategory saveCategory (InterviewCategory category);

     void checkCategoryExists(InterviewCategory category) throws RecordAlreadyExistsException;


    }
