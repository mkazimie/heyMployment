package pl.coderslab.heymployment.service;


import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.repository.CompanyRepository;

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
    public Company findById(long id) {
        Optional<Company> company = companyRepository.findById(id);
        return company.get();
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
}
