package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.JobOffer;

import java.util.List;

@Repository
public interface JobOfferRepository extends JpaRepository<JobOffer, Long > {

    @Query("SELECT j FROM JobOffer j WHERE j.user.id = ?1 ORDER BY j.id DESC")
    List<JobOffer> findAllByUserId(long id);

    @Query("SELECT j FROM JobOffer j WHERE j.user.id = ?1 and j.status = ?2 ORDER BY j.id DESC")
    List<JobOffer> findAllByUserIdAndStatus(long id, String status);



}
