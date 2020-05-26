package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.JobOffer;

import java.time.Month;
import java.util.List;

@Repository
public interface JobOfferRepository extends JpaRepository<JobOffer, Long > {

    @Query("SELECT j FROM JobOffer j WHERE j.user.id = ?1 ORDER BY CASE WHEN j.updated > j.added THEN j.updated " +
            "ELSE j.added END DESC")
    List<JobOffer> findAllByUserId(long id);


    @Query("SELECT j FROM JobOffer j WHERE j.user.id = ?1 and j.status = ?2 ORDER BY CASE WHEN j.updated > j.added THEN j.updated " +
            "ELSE j.added END DESC")
    List<JobOffer> findAllByUserIdAndStatus(long id, String status);


    @Query(value = "SELECT * FROM job_offers WHERE user_id = ?1 AND MONTH(updated) =?2",
            nativeQuery = true)
    List<JobOffer> findAllByUserIdAndUpdatedMonth(long id, Integer month);

}