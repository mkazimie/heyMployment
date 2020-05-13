package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.Course;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.domain.dto.CourseDto;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CourseService;
import pl.coderslab.heymployment.service.TopicService;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/user/courses")
public class CourseController {

    private final CourseService courseService;
    private final TopicService topicService;

    public CourseController(CourseService courseService, TopicService topicService) {
        this.courseService = courseService;
        this.topicService = topicService;
    }

    // display add course form
    @GetMapping("/add")
    public String addCourse(Model model){
        model.addAttribute("course", new CourseDto());
        return "course-add-form";
    }

    // process form and save course
    @PostMapping("/add")
    public String saveCourse(@ModelAttribute("course") @Valid CourseDto course, BindingResult result, Model model,
                             @AuthenticationPrincipal CurrentUser currentUser) {
        if (!result.hasErrors()) {
            Course courseFromForm = courseService.createCourseFromForm(course);
            courseFromForm.setUser(currentUser.getUser());
            courseFromForm.setTopics(topicService.getOrCreateNew(course));
            courseService.saveCourse(courseFromForm);
            return "redirect:/user/courses/all";
        }
        model.addAttribute("failed", "Please try again");
        return "course-add-form";
    }



    // display all courses
    @GetMapping("/all")
    public String getAllCourses(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        List<Course> allCourses = courseService.findAll(currentUser.getUser().getId());
        model.addAttribute("allCourses", allCourses);
        model.addAttribute("allHowMany", allCourses.size());
        return "course-list";
    }

    // display courses by status
    @GetMapping("/all/{status}")
    public String displayCoursesByStatus(@PathVariable String status,
                                         @AuthenticationPrincipal CurrentUser currentUser, Model model){
        List<Course> allByStatus = courseService.findAllByStatus(currentUser.getUser().getId(), status);
        model.addAttribute("allByStatus", allByStatus);
        model.addAttribute("specificHowMany", allByStatus.size());
        return "course-list";

    }

    // confirm-delete of a course
    @GetMapping("/confirm-delete/{id}")
    public String confirmDelete(@PathVariable long id, Model model) {
        Course course = courseService.findById(id);
        model.addAttribute("course", course);
        return "course-confirm-delete";
    }

    // delete course
    @GetMapping("/delete/{id}")
    public String deleteCourse(@PathVariable long id) {
        Course toDelete = courseService.findById(id);
        toDelete.getTopics().forEach(toDelete::removeTopics);
        courseService.deleteCourse(toDelete.getId());
        return "redirect:/user/courses/all";
    }

    //    edit course
    @GetMapping("/update/{id}")
    public String updateCourse(Model model, @PathVariable long id){
        Course course = courseService.findById(id);
        model.addAttribute("course", course);
        return "course-edit-form";
    }

    // process editing course
    @PostMapping("/update")
    public String updateCourse(@ModelAttribute @Valid Course course, BindingResult result, Model model){
        if (!result.hasErrors()){
            course.setTopics(course.getTopics());
            courseService.saveCourse(course);
            return "redirect:/user/courses/all";
        }
        model.addAttribute("failed", "Please try again");
        return "course-edit-form";
    }



    @ModelAttribute("status")
    public List<String> status() {
        return Arrays.asList("Wishlist", "Ongoing", "Completed");
    }


}
