package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    User findByEmail(String email);

    User findById(long id);

    void registerUser(UserDto userDto) throws UserAlreadyExistsException;

    User updateUser(User user);

    //admin options
    List<User> getAllUsers();


    //admin options
    void deleteUser(long id);

    void blockUser(long id);

    void unblockUser(long id);

    //admin options
    User createUser(User newUser) throws UserAlreadyExistsException;


}
