package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.UserService;

import javax.validation.Valid;

@Controller("/user")
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

//    @GetMapping("/create-admin")
//    @ResponseBody
//    public String createUser() {
//        User user = new User();
//        user.setUsername("mkazimie");
//        user.setPassword("heymployment");
//        userService.saveUser(user);
//        return "Hi admin: " + user.getUsername();
//    }

    @GetMapping("/register")
    public String register(Model model) {
        UserDto userDto = new UserDto();
        model.addAttribute("user", userDto);
        return "register";
    }

    @PostMapping("/register")
    public String processRegistration(@ModelAttribute("user") @Valid UserDto userDto, BindingResult bindingResult,
                                      Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.registerUser(userDto);
            } catch (UserAlreadyExistsException e) {
                model.addAttribute("failed", "Email already found in our database!");
                return "register";
            }
            return "register-success";
        }
        return "register";
    }


    @GetMapping("/admin")
    @ResponseBody
    public String admin(@AuthenticationPrincipal CurrentUser customUser) {
        User entityUser = customUser.getUser();
        return "Hello " + entityUser.getUsername();
    }


}
