package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    //view for homepage after login
    @GetMapping("/user/home")
    public String homeAuthenticated(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        model.addAttribute("currentUser", currentUser.getUser());
        return "home";
    }

    //edit personal info
    @GetMapping("/user/update")
    public String updateProfileForm(@AuthenticationPrincipal CurrentUser currentUser, Model model) {
        User user = userService.findById(currentUser.getUser().getId());
        model.addAttribute("currentUser", user);
        return "user-update-profile";
    }

    //save edited personal info
    @PostMapping("/user/update")
    public String updateProfileProcess(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors()) {
            userService.updateUser(user);
            return "redirect:/user/home";
        }
        return "user-update-profile";
    }


}
