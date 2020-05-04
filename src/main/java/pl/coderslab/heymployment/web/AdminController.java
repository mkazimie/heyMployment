package pl.coderslab.heymployment.web;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.heymployment.domain.Role;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;
import pl.coderslab.heymployment.repository.RoleRepository;
import pl.coderslab.heymployment.service.UserService;

import javax.validation.Valid;
import java.util.*;

@Controller
@Secured("ROLE_ADMIN")
public class AdminController {

    private final UserService userService;
    private final RoleRepository roleRepository;


    public AdminController(UserService userService, RoleRepository roleRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/admin/panel")
    public String displayAdminPanel(){
        return "admin-panel";
    }



    @GetMapping("/admin/allusers")
    public String displayAllUsers(Model model) {
        List<User> allUsers = userService.getAllUsers();
        model.addAttribute("users", allUsers);
        return "user-list";
    }

    @GetMapping("/admin/adduser")
    public String addNewUser(Model model) {
        model.addAttribute("user", new User());
        return "admin-add-user";
    }

    @PostMapping("/admin/adduser")
    public String addNewUser(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.createUser(user);
            } catch (UserAlreadyExistsException e) {
                model.addAttribute("failed", "An account for that username/email already exists");
                return "admin-add-user";
            }
            return "redirect:/admin/allusers";
        }
        return "admin-add-user";
    }


    @ModelAttribute("roles")
    public List<Role> roles() {
        return roleRepository.findAll();
    }


}
