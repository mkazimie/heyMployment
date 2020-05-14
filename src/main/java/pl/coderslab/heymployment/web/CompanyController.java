package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CompanyService;
import pl.coderslab.heymployment.service.JobOfferService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/user/companies")
public class CompanyController {

    private final CompanyService companyService;
    private final JobOfferService jobOfferService;

    public CompanyController(CompanyService companyService, JobOfferService jobOfferService) {
        this.companyService = companyService;
        this.jobOfferService = jobOfferService;
    }

    //    display all companies for current user
    @GetMapping("/all")
    public String displayCompanies(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<Company> allCompanies = companyService.findAllByUser(currentUser.getUser());
        model.addAttribute("companies", allCompanies);
        return "company-list";

    }

    // display detailed view of a company by id
    @GetMapping("/{id}")
    public String displayDetails(Model model, @PathVariable long id){
        Company company = companyService.findById(id);
        model.addAttribute("company", company);
        return "company-detailed-view";
    }

    // display form for company editing
    @GetMapping("/update/{id}")
    public String editCompany(Model model, @PathVariable long id){
        Company company = companyService.findById(id);
        model.addAttribute("company", company);
        return "company-edit-form";
    }

    // process company update
    @PostMapping("/update/{id}")
    public String editCompany(@ModelAttribute @Valid Company company, BindingResult result, Model model,
                              @PathVariable long id){
        if (!result.hasErrors()){
            companyService.saveCompany(company);
            return "redirect:/user/companies/{id}";
        }
        model.addAttribute("failed", "Please try again");
        return "company-edit-form";
    }



    @ModelAttribute("currentUser")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return currentUser.getUser();
    }


}
