package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.InterviewCategory;
import pl.coderslab.heymployment.domain.InterviewQuestion;
import pl.coderslab.heymployment.exception.RecordAlreadyExistsException;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CategoryService;
import pl.coderslab.heymployment.service.QuestionService;
import pl.coderslab.heymployment.service.TopicService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user/categories")
public class InterviewCategoriesQuestionsController {

    private final CategoryService categoryService;
    private final QuestionService questionService;

    public InterviewCategoriesQuestionsController(CategoryService categoryService, QuestionService questionService, TopicService topicService) {
        this.categoryService = categoryService;
        this.questionService = questionService;
    }

    // display form for adding categories
    @GetMapping("/add")
    public String addCategory(Model model){
        model.addAttribute("category", new InterviewCategory());
        return "category-form";
    }

    // save added category
    @PostMapping("/add")
    public String saveCategory(@ModelAttribute @Valid InterviewCategory category, BindingResult result,
                               @AuthenticationPrincipal CurrentUser currentUser, Model model){
        if (!result.hasErrors()){
            try{
                categoryService.checkCategoryExists(category);
                category.setUser(currentUser.getUser());
                categoryService.saveCategory(category);
                return "redirect:/user/categories/all";
            } catch (RecordAlreadyExistsException e){
                model.addAttribute("failed", "Category already exists in database");
                return "category-form";
            }
        }
        model.addAttribute("failed", "Please try again");
        return "category-form";
    }

    // display all categories
    @GetMapping("/all")
    public String displayCategories(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<InterviewCategory> categories = categoryService.findAll(currentUser.getUser().getId());
        model.addAttribute("categories", categories);
        return "category-list";
    }

    // edit a category
    @GetMapping("/update/{id}")
    public String updateCat(Model model, @PathVariable long id) {
        InterviewCategory category = categoryService.findById(id);
        model.addAttribute("cat", category);
        return "category-edit-form";
    }

    // update record
    @PostMapping("/update")
    public String updateCat(@ModelAttribute ("cat") @Valid InterviewCategory category, BindingResult result,
                            Model model) {
        if (!result.hasErrors()){
            categoryService.saveCategory(category);
            return "redirect:/user/categories/all";
        }
        model.addAttribute("failed", "Please try again");
        return "category-edit-form";
    }

    // confirm-delete a category: normal warning and additional warning if category has questions assigned
    @GetMapping("/confirm-delete/{id}")
    public String confirmDelete(@PathVariable long id, Model model) {
        InterviewCategory category = categoryService.findById(id);
        List<InterviewQuestion> interviewQuestions = category.getInterviewQuestions();
        model.addAttribute("category", category);
        if (interviewQuestions.size() == 0) {
            return "category-confirm-delete";
        }
        return "category-confirm-delete-constraint";
    }

    // delete a category
    @GetMapping("/delete/{id}")
    public String deleteCat(@PathVariable long id) {
        categoryService.deleteCategory(id);
        return "redirect:/user/categories/all";
    }

    // add a question to a category
    @GetMapping("/{id}/questions/add")
    public String addQuestion(Model model, @PathVariable long id){
        model.addAttribute("qa", new InterviewQuestion());
        return "question-add";
    }

    // display questions from a category
    @GetMapping("/{id}/questions/all")
    public String displayQuestions(@PathVariable long id, Model model){
        InterviewCategory category = categoryService.findById(id);
        List<InterviewQuestion> allQuestionsById = questionService.findAllByCategoryId(id);
        model.addAttribute("allById", allQuestionsById);
        model.addAttribute("cat", category);
        return "questions-all-by-category";
    }

    // save new question in certain category
    @PostMapping("/{id}/questions/add")
    public String saveQuestion(@ModelAttribute("qa") @Valid InterviewQuestion qa, BindingResult result, Model model,
                               @PathVariable long id){
        if (!result.hasErrors()){
            qa.setInterviewCategory(categoryService.findById(id));
            questionService.saveQuestion(qa);
            return "redirect:/user/categories/{id}/questions/all";
        }
        model.addAttribute("failed", "Please try again");
        return "question-add";
    }


    @ModelAttribute("difficulty")
    public List<String> difficulty(){
        return Arrays.asList("Extremely Hard", "Difficult", "Moderate", "Easy");
    }

}
