package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.Company;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.JobOfferDto;

import java.util.List;

public interface CompanyService {

    Company findByName(String name);

    Company findById(long id);

    Company saveCompany(Company company);

    void deleteCompany(long id);

    List<Company> findAllByUser(User user);

    Company getCompanyOrCreateNew (JobOfferDto jobOfferDto);

    }
