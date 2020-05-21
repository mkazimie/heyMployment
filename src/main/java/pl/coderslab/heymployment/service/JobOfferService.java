package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.dto.JobOfferDto;

import java.util.List;

public interface JobOfferService {

    List<JobOffer> findAllJobOffers(long id);

    List<JobOffer> findAllByStatus(long id, String status);

    JobOffer findById(long id);

    void deleteJobOffer(long id);

    JobOffer saveJobOffer(JobOffer jobOffer);

    JobOffer createJobOfferFromForm(JobOfferDto jobOfferDto);

     List<JobOffer> offersByMonth(long id, Integer month);

    }
