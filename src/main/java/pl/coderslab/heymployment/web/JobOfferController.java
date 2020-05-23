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
import java.time.*;
import java.time.format.TextStyle;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user/offers")
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
        if (!result.hasErrors()) {
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

    // process detailed form (all fields can be null but some have max size restrictions) & redirect to list of all
    @PostMapping("/add/details")
    public String addDetails(@ModelAttribute("offer") @Valid JobOffer offer, BindingResult result, Model model) {
        if (!result.hasErrors()) {
            jobOfferService.saveJobOffer(offer);
            return "redirect:/user/offers/";
        } else {
            model.addAttribute("failed", "Please try again");
            return "job-offer-detailed-form";
        }
    }

    // display all job offers for current user
    @GetMapping("/")
    public String displayJobOffers(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        List<JobOffer> allJobOffers = jobOfferService.findAllJobOffers(currentUser.getUser().getId());
//        dateFormatConverted(allJobOffers);
        model.addAttribute("allHowMany", allJobOffers.size());
        model.addAttribute("offers", allJobOffers);
        return "job-offer-list";
    }

    // display job offers by status for current user
    @GetMapping("/{name}")
    public String displayJobOffersByStatus(@PathVariable String name,
                                           @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        List<JobOffer> allByStatus = jobOfferService.findAllByStatus(currentUser.getUser().getId(), name);
//        dateFormatConverted(allByStatus);
        model.addAttribute("allByStatus", allByStatus);
        model.addAttribute("specificHowMany", allByStatus.size());
        return "job-offer-list";
    }

    // display detailed view of a job offer by id
    @GetMapping("/details/{id}")
    public String displayDetails(Model model, @PathVariable long id) {
        JobOffer jobOffer = jobOfferService.findById(id);
        jobOffer.getTodos().forEach(todo -> todo.setFormattedDeadline(todo.getDeadline()));
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
    @PostMapping("/offers/update")
    public String updateOffer(@ModelAttribute ("jobOffer") @Valid JobOffer jobOffer, BindingResult result,
                              Model model) {
        if (!result.hasErrors()) {
            Company company = companyService.findByName(jobOffer.getCompany().getName());
            jobOffer.setCompany(company);
            jobOfferService.saveJobOffer(jobOffer);
            return "redirect:/user/offers/";
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
    // delete company if no job offer related anymore
    @GetMapping("/delete/{id}")
    public String deleteOffer(@PathVariable long id) {
        JobOffer offer = jobOfferService.findById(id);
        Company company = companyService.findByName(offer.getCompany().getName());
        jobOfferService.deleteJobOffer(id);
        if (company.getJobOffers().size() == 0) {
            companyService.deleteCompany(company.getId());
        }
        return "redirect:/user/offers/";
    }


//    public void dateFormatConverted(List<JobOffer> jobOffers) {
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM / HH:mm");
//        for (JobOffer offer : jobOffers) {
//            LocalDateTime updated = offer.getUpdated();
//            if (updated != null) {
//                offer.setFormatUpdated(updated.format(formatter));
//                //format updated record timestamp
//                offer.setDaysFromUpdated(Duration.between(updated, LocalDateTime.now()).toDays());
//                // display how many days ago updated
//            }
//            LocalDate appliedOn = offer.getAppliedOn();
//            if (appliedOn != null) {
//                offer.setDaysFromApplied(Period.between(appliedOn, LocalDate.now()).getDays());
////                //how many days ago applied
//            }
//
//        }
//
//    }


    // RAPORT DISPLAY ON JOB OFFERS
    @GetMapping("/raport")
    public String displayStatistics(Model model, @AuthenticationPrincipal CurrentUser currentUser){
        Month month = LocalDate.now().getMonth();
        String monthName = month.getDisplayName(TextStyle.FULL, Locale.ENGLISH);
        List<JobOffer> offersByMonth = jobOfferService.offersByMonth(currentUser.getUser().getId(), month.getValue());
//        List<String> status = status();
//        List<JobOffer> specificByMonth = new ArrayList<>();
//        for (int i = 0; i < status.size(); i++) {
//            for (JobOffer jobOffer : offersByMonth) {
//                if (jobOffer.getStatus().equals(status.get(i))){
//                    specificByMonth.add(jobOffer);
//                    model.addAttribute("specificByMonth"+i, specificByMonth.size());
//                }
//            }
//        }
        List<JobOffer> wishlistByMonth = offersByMonth.stream()
                .filter(jobOffer -> jobOffer.getStatus().equals("Wishlist"))
                .collect(Collectors.toList());
        List<JobOffer> appliedByMonth = offersByMonth.stream()
                .filter(jobOffer -> jobOffer.getStatus().equals("Applied"))
                .collect(Collectors.toList());
        List<JobOffer> interviewByMonth = offersByMonth.stream()
                .filter(jobOffer -> jobOffer.getStatus().equals("Interview"))
                .collect(Collectors.toList());
        List<JobOffer> rejectedByMonth = offersByMonth.stream()
                .filter(jobOffer -> jobOffer.getStatus().equals("Rejected"))
                .collect(Collectors.toList());
        List<JobOffer> acceptedByMonth = offersByMonth.stream()
                .filter(jobOffer -> jobOffer.getStatus().equals("Accepted"))
                .collect(Collectors.toList());
        model.addAttribute("appliedByMonth", appliedByMonth.size());
        model.addAttribute("interviewByMonth", interviewByMonth.size());
        model.addAttribute("wishlistByMonth", wishlistByMonth.size());
        model.addAttribute("rejectedByMonth", rejectedByMonth.size());
        model.addAttribute("acceptedByMonth", acceptedByMonth.size());

        model.addAttribute("offersThisMonth", offersByMonth.size());
        model.addAttribute("month", monthName);
        return "job-offer-raport";
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
