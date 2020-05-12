package pl.coderslab.heymployment.service;


import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.JobOfferDto;
import pl.coderslab.heymployment.exception.NoRecordFoundException;
import pl.coderslab.heymployment.repository.CompanyRepository;

import java.text.Normalizer;
import java.util.List;
import java.util.Optional;

@Service
public class CompanyServiceImpl implements CompanyService {

    private final CompanyRepository companyRepository;

    public CompanyServiceImpl(CompanyRepository companyRepository) {
        this.companyRepository = companyRepository;
    }

    @Override
    public Company findByName(String name) {
        return companyRepository.findByName(name);
    }

    @Override
    //FIX OK?
    public Company findById(long id) {
        Optional<Company> company = companyRepository.findById(id);
        return company.orElseThrow(() -> new NoRecordFoundException("No Such Record Found in the Database"));
    }

    @Override
    public Company saveCompany(Company company) {
        return companyRepository.save(company);
    }



    @Override
    public void deleteCompany(long id) {
        companyRepository.delete(findById(id));
    }

    @Override
    public List<Company> findAllCompanies() {
        return companyRepository.findAll();
    }

    @Override
    public List<Company> findAllByUser(User user) {
        return companyRepository.findAllByUser(user);
    }

    @Override
    public Company getCompanyOrCreateNew (JobOfferDto jobOfferDto) {
        String companyName = jobOfferDto.getCompanyName();
        Company company = companyRepository.findByName(companyName);
        if (company == null) {
            company = new Company();
            company.setName(companyName);
            company.setLocation(jobOfferDto.getLocation());
            companyRepository.save(company);
        }
        return company;
    }

}
