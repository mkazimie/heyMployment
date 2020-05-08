package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.Todo;

import java.util.List;

public interface TodoService {

    List<Todo> findAllByUserId(long id, boolean done);
    void deleteTodo(long id);
    Todo findById(long id);
    Todo saveTodo(Todo todo);

}
