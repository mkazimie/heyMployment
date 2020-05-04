package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.JobOffer;

import java.util.List;

public interface JobOfferService {

    List<JobOffer> findAllJobOffers();
    void addJobOffer(JobOffer jobOffer);
    JobOffer findById(long id);
    void deleteJobOffer(long id);
    JobOffer saveJobOffer(JobOffer jobOffer);



}
