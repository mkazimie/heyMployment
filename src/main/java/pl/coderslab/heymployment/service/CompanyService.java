package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.Company;

public interface CompanyService {

    Company findByName(String name);
    Company findById(long id);
    Company saveCompany(Company company);
}
