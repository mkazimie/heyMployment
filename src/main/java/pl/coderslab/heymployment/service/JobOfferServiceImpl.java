package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.dto.JobOfferDto;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.repository.CompanyRepository;
import pl.coderslab.heymployment.repository.JobOfferRepository;

import java.util.List;
import java.util.Optional;

@Service
public class JobOfferServiceImpl implements JobOfferService {

    private final JobOfferRepository jobOfferRepository;

    public JobOfferServiceImpl(JobOfferRepository jobOfferRepository, CompanyRepository companyRepository) {
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
        return jobOffer.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }


    @Override
    public void deleteJobOffer(long id) {
        JobOffer jobOffer = findById(id);
        jobOffer.setCompany(null);
        jobOfferRepository.delete(jobOffer);
    }



    @Override
    public JobOffer saveJobOffer(JobOffer jobOffer) {
        return jobOfferRepository.save(jobOffer);
    }

    @Override
    public JobOffer createJobOfferFromForm(JobOfferDto jobOfferDto){
        JobOffer jobOffer = new JobOffer();
        jobOffer.setTitle(jobOfferDto.getTitle());
        jobOffer.setLocation(jobOfferDto.getLocation());
        jobOffer.setStatus(jobOfferDto.getStatus());
        return jobOffer;
    }

    @Override
    public List<JobOffer> offersThisMonth(long id, Integer month){
        return jobOfferRepository.findAllByUserIdAndUpdatedMonth(id, month);
    }

    @Override
    public List<JobOffer> offersThisYear(long id, Integer year) {
        return jobOfferRepository.findAllByUserIdAndUpdatedYear(id, year);
    }

}
