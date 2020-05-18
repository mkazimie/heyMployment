package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.RecordAlreadyExistsException;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    User findByEmail(String email);

    User findById(long id);

    void registerUser(UserDto userDto) throws RecordAlreadyExistsException;

    User updateUser(User user);

//    admin option temporarily rejected
//    void deleteUser(long id);

    //admin option
    List<User> getAllUsers();

    //admin option
    void blockUser(long id);

    //admin option
    void unblockUser(long id);

    //admin option
    User createUser(User newUser) throws RecordAlreadyExistsException;

    //create first user after DB drop
    void saveUser(User user);


}
