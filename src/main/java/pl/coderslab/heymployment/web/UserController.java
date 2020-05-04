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

@Controller("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    //edit personal info
    @GetMapping("/update")
    public String updateProfileForm(@AuthenticationPrincipal CurrentUser currentUser, Model model){
        User user = userService.findById(currentUser.getUser().getId());
        model.addAttribute("user", user);
        return "user-update-profile";
    }

    @PostMapping("/update")
    public String updateProfileProcess(@ModelAttribute @Valid User user, BindingResult bindingResult){
        if(!bindingResult.hasErrors()){
            userService.updateUser(user);
            return "redirect:/user/home";
        }
        return "user-update-profile";
    }



}
