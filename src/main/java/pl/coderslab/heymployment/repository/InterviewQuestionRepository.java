package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.InterviewCategory;
import pl.coderslab.heymployment.domain.InterviewQuestion;

import java.util.List;

@Repository
public interface InterviewQuestionRepository extends JpaRepository<InterviewQuestion, Long > {

    @Query("SELECT q FROM InterviewQuestion q WHERE q.interviewCategory.name = ?1 ORDER BY q.added DESC")
    List<InterviewQuestion> findAllByInterviewCategoryName(String name);

    @Query("SELECT q FROM InterviewQuestion q WHERE q.interviewCategory.id = ?1 ORDER BY q.added DESC")
    List<InterviewQuestion> findAllByInterviewCategoryId(long id);

    @Query("SELECT q FROM InterviewQuestion q WHERE q.interviewCategory.id = ?1 AND q.question LIKE %?2% OR q.answer " +
            "LIKE %?2%")
    List<InterviewQuestion> findAllByQuestionLikeOrAnswerLike(long id, String keyword);
}
