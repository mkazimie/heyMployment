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
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.*;
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
        allJobOffers.forEach(this::dateFormatConverted);
        model.addAttribute("allHowMany", allJobOffers.size());
        model.addAttribute("offers", allJobOffers);
        return "job-offer-list";
    }

    // display job offers by status for current user
    @GetMapping("/{name}")
    public String displayJobOffersByStatus(@PathVariable String name,
                                           @AuthenticationPrincipal CurrentUser currentUser, Model model) {
        List<JobOffer> allByStatus = jobOfferService.findAllByStatus(currentUser.getUser().getId(), name);
        allByStatus.forEach(this::dateFormatConverted);
        model.addAttribute("allByStatus", allByStatus);
        model.addAttribute("specificHowMany", allByStatus.size());
        return "job-offer-list";
    }

    // display detailed view of a job offer by id
    @GetMapping("/details/{id}")
    public String displayDetails(Model model, @PathVariable long id) {
        JobOffer jobOffer = jobOfferService.findById(id);
        dateFormatConverted(jobOffer);
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
    @PostMapping("/update")
    public String updateOffer(@ModelAttribute("jobOffer") @Valid JobOffer jobOffer, BindingResult result,
                              Model model) {
        if (!result.hasErrors()) {
            Company company = companyService.findByName(jobOffer.getCompany().getName());
            jobOffer.setCompany(company);
            jobOfferService.saveJobOffer(jobOffer);
            return "redirect:/user/offers/details/" + jobOffer.getId();
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


    public void dateFormatConverted(JobOffer offer) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM / HH:mm");
        LocalDateTime added = offer.getAdded();
        offer.setFormatAdded(displayWeekDay(added.getDayOfWeek()) + " / " + added.format(formatter));
        LocalDateTime updated = offer.getUpdated();
        if (updated != null) {
            offer.setFormatUpdated(displayWeekDay(updated.getDayOfWeek()) + " / " + updated.format(formatter));
        }
    }


    public String displayWeekDay(DayOfWeek day) {
        return day.getDisplayName(TextStyle.SHORT, Locale.ENGLISH);
    }


    // REPORT JOB OFFERS ADDED THIS MONTH

    @GetMapping("/reports")
    public String displayStatistics(Model model, @AuthenticationPrincipal CurrentUser currentUser) {
        // month
        Month month = LocalDate.now().getMonth();
        String monthName = month.getDisplayName(TextStyle.FULL, Locale.ENGLISH);
        List<JobOffer> offersByMonth = jobOfferService.offersThisMonth(currentUser.getUser().getId(), month.getValue());
        Map<String, List<JobOffer>> monthlyMapStatus = offersByMonth.stream()
                .collect(Collectors.groupingBy(JobOffer::getStatus));
        model.addAttribute("monthlyMapStatus", monthlyMapStatus);
        model.addAttribute("offersThisMonth", offersByMonth.size());
        model.addAttribute("month", monthName);
        // year
        int year = LocalDate.now().getYear();
        List<JobOffer> offersThisYear = jobOfferService.offersThisYear(currentUser.getUser().getId(), year);
        Map<String, List<JobOffer>> annualMapStatus = offersThisYear.stream()
                .collect(Collectors.groupingBy(JobOffer::getStatus));
        model.addAttribute("year", year);
        model.addAttribute("annualMapStatus", annualMapStatus);
        model.addAttribute("offersThisYear", offersThisYear.size());


        //for pie chart (???)
//
//        // month
//        Map<String, List<JobOffer>> monthlyMapLocation = offersByMonth.stream()
//                .collect(Collectors.groupingBy(JobOffer::getLocation));
//        model.addAttribute("monthlyMapLocation", monthlyMapLocation);
//
//        // year
//        Map<String, List<JobOffer>> annualMapLocation = offersByMonth.stream()
//                .collect(Collectors.groupingBy(JobOffer::getLocation));
//        model.addAttribute("annualMapLocation", annualMapLocation);

        return "job-offer-report";
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
