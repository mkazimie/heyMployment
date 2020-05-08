package pl.coderslab.heymployment.service;

import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Todo;
import pl.coderslab.heymployment.repository.TodoRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TodoServiceImpl implements TodoService {

    private final TodoRepository todoRepository;

    public TodoServiceImpl(TodoRepository todoRepository) {
        this.todoRepository = todoRepository;
    }

    @Override
    public List<Todo> findAllByUserId(long id, boolean done) {
        return todoRepository.findAllByUserId(id, done);
    }


    @Override
    public void deleteTodo(long id) {
        todoRepository.delete(findById(id));

    }

    @Override
    public Todo findById(long id) {
        Optional<Todo> todo = todoRepository.findById(id);
        return todo.get();
    }

    @Override
    public Todo saveTodo(Todo todo) {
        return todoRepository.save(todo);
    }

}
