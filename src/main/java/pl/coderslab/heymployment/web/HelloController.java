package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.UserService;

import javax.validation.Valid;

@Controller
public class HelloController {


    private final UserService userService;

    public HelloController(UserService userService) {
        this.userService = userService;
    }

    //landing page display
    @GetMapping("/")
    public String displayHomePage(){
        return "hello";
    }



    //display registration form
    @GetMapping("/register")
    public String register(Model model) {
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "register";
    }

    //process registration form and create a new user; redirect to registration success page
    @PostMapping("/register")
    public String processRegistration(@ModelAttribute("user") @Valid UserDto userDto, BindingResult bindingResult,
                                      Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.registerUser(userDto);
            } catch (UserAlreadyExistsException e) {
                model.addAttribute("failed", "An account for that username/email already exists");
                return "register";
            }
            return "register-success";
        }
        return "register";
    }

    //login form displayed only for users not logged in yet
    @GetMapping("/login")
    public String loginForm(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        if (currentUser != null) {
            return "redirect:/user/home";
        }
        return "login";
    }

    //view for homepage after login
    @GetMapping("/user/home")
    public String homeAuthenticated(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        model.addAttribute("user", currentUser.getUser());
        return "home";
    }

}
