package pl.coderslab.heymployment.service;

import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;

public interface UserService {

    User findByUsername(String username);


    User registerUser(UserDto userDto) throws UserAlreadyExistsException;

}
