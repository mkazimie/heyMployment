package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CompanyService;
import pl.coderslab.heymployment.service.JobOfferService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Controller
public class JobOfferController {

    private final JobOfferService jobOfferService;
    private final CompanyService companyService;


    public JobOfferController(JobOfferService jobOfferService, CompanyService companyService) {
        this.jobOfferService = jobOfferService;
        this.companyService = companyService;
    }

    //display form for adding job offer
    @GetMapping("/user/offers/add")
    public String addJobOffer(Model model) {
        model.addAttribute("jobOffer", new JobOffer());
        model.addAttribute("company", new Company());
        return "job-offer-basic-form";
    }


    // 1) process new job basic form & redirect to detailed form
    // 2) process complete edit-job form
    @PostMapping("/user/offers/add")
    public String addJobOffer(@ModelAttribute @Valid JobOffer jobOffer, BindingResult result,
                              @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        if (!result.hasErrors()) {
            jobOffer.setUser(currentUser.getUser());
            Company company = jobOffer.getCompany();
//            company.setJobOffers(new HashSet<>(Arrays.asList(jobOffer)));
            companyService.saveCompany(company);
            jobOffer.setCompany(company);
            jobOfferService.saveJobOffer(jobOffer);
            if (jobOffer.isEditedVersion()) {
                return "redirect:/user/offers/all";
            }
            model.addAttribute("jobOffer", jobOffer);
            return "job-offer-detailed-form";
        }
        model.addAttribute("failed", "Please try again");
        if (jobOffer.isEditedVersion()) {
            return "job-offer-edit";
        }
        return "job-offer-basic-form";
    }

    // process detail form (all fields can be null but have some max size restrictions)
    @PostMapping("/user/offers/add/details")
    public String addDetails(@ModelAttribute("jobOffer") @Valid JobOffer jobOffer, BindingResult result, Model model) {
        if (!result.hasErrors()) {
            jobOfferService.saveJobOffer(jobOffer);
            return "redirect:/user/offers/all";
        } else {
            model.addAttribute("failed", "Please try again");
            return "job-offer-detailed-form";
        }
    }

    // display all job offers for current user
    @GetMapping("/user/offers/all")
    public String displayJobOffers(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<JobOffer> allJobOffers = jobOfferService.findAllJobOffers(currentUser.getUser().getId());
        model.addAttribute("allHowMany", allJobOffers.size());
        model.addAttribute("offers", allJobOffers);
        return "job-offer-list";
    }

    //display job offers by status for current user
    @GetMapping("/user/offers/all/{name}")
    public String displayJobOffersByStatus(@PathVariable String name,
                                           @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        List<JobOffer> allByStatus = jobOfferService.findAllByStatus(currentUser.getUser().getId(), name);
        model.addAttribute("allByStatus", allByStatus);
        model.addAttribute("specificHowMany", allByStatus.size());
        return "job-offer-list";
    }

    // edit job offer
    @GetMapping("/user/offers/update/{id}")
    public String updateOffer(Model model, @PathVariable long id) {
        JobOffer offer = jobOfferService.findById(id);
        model.addAttribute("jobOffer", offer);
        return "job-offer-edit";
    }

    // confirm-delete of job offer
    @GetMapping("/user/offers/confirm-delete/{id}")
    public String confirmDelete(@PathVariable long id, Model model) {
        JobOffer jobOffer = jobOfferService.findById(id);
        model.addAttribute("offer", jobOffer);
        return "job-offer-confirm-delete";
    }

    // delete job offer
    @GetMapping("/user/offers/delete/{id}")
    public String deleteOffer(@PathVariable long id) {
        jobOfferService.deleteJobOffer(id);
        return "redirect:/user/offers/all";
    }


    @ModelAttribute("currentUser")
    public User currentUser(@AuthenticationPrincipal CurrentUser currentUser) {
        return currentUser.getUser();
    }

    @ModelAttribute("attractiveness")
    public List<String> attractiveness() {
        return Arrays.asList("Super Attractive", "Attractive", "OK", "Not that attractive");
    }

    @ModelAttribute("status")
    public List<String> status() {
        return Arrays.asList("Wishlist", "Applied", "Interview", "Accepted", "Rejected");
    }


}
