package pl.coderslab.heymployment.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.heymployment.domain.Todo;

import java.util.List;

@Repository
public interface TodoRepository extends JpaRepository<Todo, Long > {

    @Query("SELECT t FROM Todo t WHERE t.user.id = ?1 and t.done = ?2 ORDER BY t.deadline DESC")
    List<Todo> findAllByUserId(long id, boolean done);
}

