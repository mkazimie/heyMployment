package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.repository.JobOfferRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JobOfferServiceImpl implements JobOfferService {

    private final JobOfferRepository jobOfferRepository;

    public JobOfferServiceImpl(JobOfferRepository jobOfferRepository) {
        this.jobOfferRepository = jobOfferRepository;
    }

    @Override
    public List<JobOffer> findAllJobOffers(long id) {
        return jobOfferRepository.findAllByUserId(id);
    }

    @Override
    public List<JobOffer> findAllByStatus(long id, String status) {
        return jobOfferRepository.findAllByUserIdAndStatus(id, status);
    }


    @Override
    public JobOffer findById(long id) {
        Optional<JobOffer> jobOffer = jobOfferRepository.findById(id);
        return jobOffer.get();
    }


    @Override
    public void deleteJobOffer(long id) {
        jobOfferRepository.delete(findById(id));
    }

    @Override
    public JobOffer saveJobOffer(JobOffer jobOffer) {
        return jobOfferRepository.save(jobOffer);
    }
}
