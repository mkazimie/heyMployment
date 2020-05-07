package pl.coderslab.heymployment.web;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.Role;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;
import pl.coderslab.heymployment.repository.RoleRepository;
import pl.coderslab.heymployment.security.CurrentUser;
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


    //display admin panel
    @GetMapping("/admin/panel")
    public String displayAdminPanel() {
        return "admin-panel";
    }


    //list of all users and admins from admin panel view
    @GetMapping("/admin/users/all")
    public String displayAllUsers(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<User> allUsers = userService.getAllUsers();
        User current = allUsers.stream()
                .filter(user -> user.getUsername().equals(currentUser.getUsername()))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("No user found"));
        allUsers.remove(current);
        model.addAttribute("users", allUsers);
        model.addAttribute("currentUser", currentUser.getUser());
        return "admin-list-all-users";
    }

    //add new user/admin by a logged admin
    @GetMapping("/admin/users/add")
    public String addNewUser(Model model) {
        model.addAttribute("user", new User());
        return "admin-add-user";
    }

    //process adding new user/admin and save
    @PostMapping("/admin/users/add")
    public String addNewUser(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model) {
        if (!bindingResult.hasErrors()) {
            try {
                userService.createUser(user);
            } catch (UserAlreadyExistsException e) {
                model.addAttribute("failed", "An account for that username/email already exists");
                return "admin-add-user";
            }
            return "redirect:/admin/users/all";
        }
        return "admin-add-user";
    }

    //block a user/admin from the list
    @GetMapping("/admin/users/block/{id}")
    public String blockUser(@PathVariable long id) {
        userService.blockUser(id);
        return "redirect:/admin/users/all";
    }

    //unblock a user/admin from the list
    @GetMapping("/admin/users/unblock/{id}")
    public String unblockUser(@PathVariable long id) {
        userService.unblockUser(id);
        return "redirect:/admin/users/all";
    }


    @ModelAttribute("roles")
    public List<Role> roles() {
        return roleRepository.findAll();
    }

    @ModelAttribute("currentUser")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return currentUser.getUser();
    }


}
