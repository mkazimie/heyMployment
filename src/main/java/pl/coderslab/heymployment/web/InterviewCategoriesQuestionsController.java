package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.*;
import pl.coderslab.heymployment.domain.dto.CategoryDto;
import pl.coderslab.heymployment.domain.dto.QuestionDto;
import pl.coderslab.heymployment.exception.RecordAlreadyExistsException;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CategoryService;
import pl.coderslab.heymployment.service.QuestionService;
import pl.coderslab.heymployment.service.TopicService;

import javax.validation.Valid;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user/categories")
public class InterviewCategoriesQuestionsController {

    private final CategoryService categoryService;
    private final QuestionService questionService;

    public InterviewCategoriesQuestionsController(CategoryService categoryService, QuestionService questionService, TopicService topicService) {
        this.categoryService = categoryService;
        this.questionService = questionService;
    }

    // CATEGORIES

    // add new category
    @GetMapping("/add")
    public String addCategory(Model model) {
        model.addAttribute("category", new CategoryDto());
        return "category-form";
    }

    // save added category
    @PostMapping("/add")
    public String saveCategory(@ModelAttribute("category") @Valid CategoryDto category, BindingResult result,
                               @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        if (!result.hasErrors()) {
            try {
                InterviewCategory cat = categoryService.createCategory(category);
                cat.setUser(currentUser.getUser());
                categoryService.saveCategory(cat);
                return "redirect:/user/categories/";
            } catch (RecordAlreadyExistsException e) {
                model.addAttribute("failed", "Category already exists in the database");
                return "category-form";
            }
        }
        model.addAttribute("failed", "Please try again");
        return "category-form";
    }

    // display all categories
    @GetMapping("/")
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
    public String updateCat(@ModelAttribute("cat") @Valid InterviewCategory category, BindingResult result,
                            Model model) {
        if (!result.hasErrors()) {
            categoryService.saveCategory(category);
            return "redirect:/user/categories/";
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
        return "redirect:/user/categories/";
    }

    // QUESTIONS INSIDE CATEGORIES

    // add a question to a category
    @GetMapping("/{id}/questions/add")
    public String addQuestion(Model model, @PathVariable long id) {
        model.addAttribute("qDto", new QuestionDto());
        InterviewCategory category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "question-add-form";
    }

    // save question inside a given category
    @PostMapping("{id}/questions/add")
    public String saveQuest(@ModelAttribute("qDto") @Valid QuestionDto qDto,
                            BindingResult result, Model model, @PathVariable long id) {
        if (!result.hasErrors()) {
            questionService.createQuestionFromDto(qDto);
            return "redirect:/user/categories/{id}/questions";
        }
        model.addAttribute("failed", "Try again");
        return "question-add-form";
    }

    // display questions from a category
    // NIE WCHODZIĆ PRZEZ KATEGORIĘ?
    @GetMapping("/{id}/questions")
    public String displayQuestions(@PathVariable long id, Model model) {
        InterviewCategory category = categoryService.findById(id);
        List<InterviewQuestion> allQuestionsById = questionService.findAllByCategoryId(id);
        allQuestionsById.forEach(this::dateFormatConverted);
        model.addAttribute("cat", category);
        model.addAttribute("allById", allQuestionsById);
        return "questions-all-by-category";
    }

    // display detailed view of a question 
    // * NIE WCHODZIĆ PRZEZ KATEGORIĘ!
    @GetMapping("/{id}/questions/{questionId}")
    public String displayDetails(Model model, @PathVariable long id, @PathVariable long questionId) {
        InterviewQuestion question = questionService.findById(questionId);
        dateFormatConverted(question);
        model.addAttribute("question", question);
        return "question-detailed-view";
    }

    // edit a question
    @GetMapping("/{id}/questions/update/{questionId}")
    public String updateQuestion(Model model, @PathVariable long id, @PathVariable long questionId) {
        InterviewQuestion question = questionService.findById(questionId);
        InterviewCategory category = categoryService.findById(id);
        model.addAttribute("cat", category);
        model.addAttribute("qa", question);
        return "question-edit-form";
    }

    // update record
    // *
    @PostMapping("/{id}/questions/update")
    public String updateQuestion(@ModelAttribute("qa") @Valid InterviewQuestion qa, BindingResult result,
                                 Model model, @PathVariable long id) {
        if (!result.hasErrors()) {
            InterviewCategory category = categoryService.findByName(qa.getInterviewCategory().getName());
            qa.setInterviewCategory(category);
            questionService.saveQuestion(qa);
            return "redirect:/user/categories/{id}/questions";
        }
        model.addAttribute("failed", "Please try again");
        return "question-edit-form";
    }


    // confirm-delete a category
    // *
    @GetMapping("/{id}/questions/confirm-delete/{questionId}")
    public String confirmDeleteQuestion(@PathVariable long id, @PathVariable long questionId, Model model) {
        InterviewQuestion qa = questionService.findById(questionId);
        model.addAttribute("qa", qa);
        return "question-confirm-delete";
    }

    // delete a question
    // *
    @GetMapping("/{id}/questions/delete/{questionId}")
    public String deleteQuestion(@PathVariable long id, @PathVariable long questionId) {
        questionService.deleteQuestion(questionId);
        return "redirect:/user/categories/{id}/questions";
    }

    public void dateFormatConverted(InterviewQuestion question) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM / [HH:mm]");
        LocalDateTime added = question.getAdded();
        question.setFormatAddedDate(displayWeekDay(added.getDayOfWeek()) + " / " + added.format(formatter));
        //format added record timestamp

        LocalDateTime updated = question.getUpdated();
        if (updated != null) {
            question.setFormatUpdatedDate(displayWeekDay(updated.getDayOfWeek()) + " / " + updated.format(formatter));
            //format updated record timestamp
        }
    }

    public String displayWeekDay(DayOfWeek day) {
        return day.getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
    }


    // display users questions filtered by word
    @PostMapping("/questions/filter")
    public String findByWord(@RequestParam String keyword, Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<InterviewQuestion> allByWord = questionService.findByWord(currentUser.getUser(), keyword);
        model.addAttribute("allByWord", allByWord);
        return "questions-filtered";
    }


    @ModelAttribute("difficulty")
    public List<String> difficulty() {
        return Arrays.asList("Extremely Hard", "Difficult", "Moderate", "Easy");
    }

    @ModelAttribute("currentUser")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return currentUser.getUser();
    }


}
