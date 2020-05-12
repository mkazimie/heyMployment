package pl.coderslab.heymployment.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.JobOfferDto;
import pl.coderslab.heymployment.security.CurrentUser;
import pl.coderslab.heymployment.service.CompanyService;
import pl.coderslab.heymployment.service.JobOfferService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/user/offers/")
public class JobOfferController {

    private final JobOfferService jobOfferService;
    private final CompanyService companyService;


    public JobOfferController(JobOfferService jobOfferService, CompanyService companyService) {
        this.jobOfferService = jobOfferService;
        this.companyService = companyService;
    }

    //display form for adding job offer
    @GetMapping("/add")
    public String addJobOffer(Model model) {
        model.addAttribute("jobOffer", new JobOfferDto());
        return "job-offer-basic-form";
    }


    // process basic form and redirect to detailed form
    @PostMapping("/add")
    public String addJobOffer(@ModelAttribute("jobOffer") @Valid JobOfferDto jobOffer, BindingResult result,
                              @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        if(!result.hasErrors()){
            Company company = companyService.getCompanyOrCreateNew(jobOffer);
            JobOffer jobOfferFromForm = jobOfferService.createJobOfferFromForm(jobOffer);
            jobOfferFromForm.setCompany(company);
            jobOfferFromForm.setUser(currentUser.getUser());
            jobOfferService.saveJobOffer(jobOfferFromForm);
            model.addAttribute("offer", jobOfferFromForm);
            return "job-offer-detailed-form";
        }
        model.addAttribute("failed", "Please try again");
        return "job-offer-basic-form";

    }

    // process detailed form (all fields can be null but have some max size restrictions) & redirect to list of all
    @PostMapping("/add/details")
    public String addDetails(@ModelAttribute("offer") @Valid JobOffer offer, BindingResult result, Model model) {
        if (!result.hasErrors()) {
            jobOfferService.saveJobOffer(offer);
            return "redirect:/user/offers/all";
        } else {
            model.addAttribute("failed", "Please try again");
            return "job-offer-detailed-form";
        }
    }

    // display all job offers for current user
    @GetMapping("/all")
    public String displayJobOffers(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<JobOffer> allJobOffers = jobOfferService.findAllJobOffers(currentUser.getUser().getId());
        model.addAttribute("allHowMany", allJobOffers.size());
        model.addAttribute("offers", allJobOffers);
        return "job-offer-list";
    }

    // display job offers by status for current user
    @GetMapping("/all/{name}")
    public String displayJobOffersByStatus(@PathVariable String name,
                                           @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        List<JobOffer> allByStatus = jobOfferService.findAllByStatus(currentUser.getUser().getId(), name);
        model.addAttribute("allByStatus", allByStatus);
        model.addAttribute("specificHowMany", allByStatus.size());
        return "job-offer-list";
    }

    // display detailed view of a job offer by id
    @GetMapping("/{id}")
    public String displayDetails(Model model, @PathVariable long id){
        JobOffer jobOffer = jobOfferService.findById(id);
        model.addAttribute("jobOffer", jobOffer);
        return "job-offer-detailed-view";
    }


    // edit job offer
    @GetMapping("/update/{id}")
    public String updateOffer(Model model, @PathVariable long id) {
        JobOffer offer = jobOfferService.findById(id);
        model.addAttribute("jobOffer", offer);
        return "job-offer-edit";
    }

    // process job offer editing
    @PostMapping("/update")
    public String updateOffer(@ModelAttribute @Valid JobOffer jobOffer, BindingResult result, Model model){
        if (!result.hasErrors()){
            Company company = companyService.findByName(jobOffer.getCompany().getName());
            jobOffer.setCompany(company);
            jobOfferService.saveJobOffer(jobOffer);
            return "redirect:/user/offers/all";
        }
        model.addAttribute("failed", "Please try again");
        return "job-offer-edit";
    }


    // confirm-delete of job offer
    @GetMapping("/confirm-delete/{id}")
    public String confirmDelete(@PathVariable long id, Model model) {
        JobOffer jobOffer = jobOfferService.findById(id);
        model.addAttribute("offer", jobOffer);
        return "job-offer-confirm-delete";
    }

    // delete job offer
    @GetMapping("delete/{id}")
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
