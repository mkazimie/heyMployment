package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.Todo;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.JobOfferService;
import pl.coderslab.heymployment.service.TodoService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class TodoController {

    private final TodoService todoService;
    private final JobOfferService jobOfferService;

    public TodoController(TodoService toDoService, JobOfferService jobOfferService) {
        this.todoService = toDoService;
        this.jobOfferService = jobOfferService;
    }

    // display form for adding a to-do from user view
    @GetMapping("/user/todos/add")
    public String addTodo(Model model) {
        model.addAttribute("todo", new Todo());
        return "todo-form";
    }

    // process to-do form and save a to-do NOT WORKING!!!
    @PostMapping("/user/todos/add")
    public String saveTodo(@ModelAttribute @Valid Todo todo, BindingResult result, Model model) {
        if (!result.hasErrors()) {
//            to-do.setUser(currentUser.getUser());
            todoService.saveTodo(todo);
            return "redirect:/user/todos/all";
        }
        model.addAttribute("failed", "Please try again");
        return "todo-form";
    }

    // add a to-do directly to a job offer
    @GetMapping("/user/todos/add/job/{id}")
    public String addTodoForJob(@PathVariable long id, Model model) {
        JobOffer jobOffer = jobOfferService.findById(id);
        model.addAttribute("todo", new Todo());
        model.addAttribute("jobOffer", jobOffer);
        return "todo-form";
    }

    //display all todos for current user
    @GetMapping("/user/todos/all")
    public String displayTodos(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<Todo> todos = todoService.findAllByUserId(currentUser.getUser().getId(), false);
        model.addAttribute("todos", todos);
        return "todo-list";
    }

    // edit a to-do
    @GetMapping("/user/todos/update/{id}")
    public String updateOffer(Model model, @PathVariable long id) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        return "todo-form";
    }

    // confirm-delete a to-do
    @GetMapping("/user/todos/confirm-delete/{id}")
    public String confirmDelete(@PathVariable long id, Model model) {
        Todo todo = todoService.findById(id);
        model.addAttribute("todo", todo);
        return "todo-confirm-delete";
    }

    // delete a to-do
    @GetMapping("/user/todos/delete/{id}")
    public String deleteTodo(@PathVariable long id) {
        todoService.deleteTodo(id);
        return "redirect:/user/todos/all";
    }

    @ModelAttribute("jobOffers")
    public List<JobOffer> jobOfferList(@AuthenticationPrincipal CurrentUser currentUser) {
        return jobOfferService.findAllJobOffers(currentUser.getUser().getId());
    }

}
