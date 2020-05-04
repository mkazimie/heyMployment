package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.JobOffer;

@Repository
public interface JobOfferRepository extends JpaRepository<JobOffer, Long > {

}
