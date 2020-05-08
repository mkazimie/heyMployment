package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CompanyService;
import pl.coderslab.heymployment.service.JobOfferService;

import java.util.List;

@Controller
public class CompanyController {

    private final CompanyService companyService;
    private final JobOfferService jobOfferService;

    public CompanyController(CompanyService companyService, JobOfferService jobOfferService) {
        this.companyService = companyService;
        this.jobOfferService = jobOfferService;
    }

    //    display all companies for current user
    @GetMapping("/user/companies/all")
    public String displayCompanies(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<Company> allCompanies = companyService.findAllByUser(currentUser.getUser());
        model.addAttribute("companies", allCompanies);
        return "company-list";

    }


    @ModelAttribute("currentUser")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return currentUser.getUser();
    }


}
