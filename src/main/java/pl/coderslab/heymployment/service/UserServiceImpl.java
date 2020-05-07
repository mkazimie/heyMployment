package pl.coderslab.heymployment.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.heymployment.domain.Role;
import pl.coderslab.heymployment.domain.User;
import pl.coderslab.heymployment.domain.dto.UserDto;
import pl.coderslab.heymployment.exception.UserAlreadyExistsException;
import pl.coderslab.heymployment.repository.RoleRepository;
import pl.coderslab.heymployment.repository.UserRepository;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }


    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public User findById(long id) {
        Optional<User> user = userRepository.findById(id);
        return user.get();
    }

    @Override
    public void registerUser(UserDto userDto)
            throws UserAlreadyExistsException {

        if (findByUsername(userDto.getUsername()) != null || findByEmail(userDto.getEmail()) != null) {
            throw new UserAlreadyExistsException("An account for that username/email already exists");
        } else {
            User user = new User();
            user.setFirstName(userDto.getFirstName());
            user.setLastName(userDto.getLastName());
            user.setUsername(userDto.getUsername());
            user.setEmail(userDto.getEmail());
            user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            user.setEnabled(1);
            Role userRole = roleRepository.findByName("ROLE_USER");
            user.setRoles(new HashSet<>(Arrays.asList(userRole)));
            userRepository.save(user);
        }
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @Override
    public User updateUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    //temporarily rejected method
//    @Override
//    public void deleteUser(long id) {
//        User user = findById(id);
//        user.setRoles(null);
//        userRepository.delete(user);
//    }

    @Override
    public void blockUser(long id) {
        User user = findById(id);
        user.setEnabled(0);
        userRepository.save(user);
    }

    @Override
    public void unblockUser(long id) {
        User user = findById(id);
        user.setEnabled(1);
        userRepository.save(user);
    }

    @Override
    public User createUser(User newUser) throws UserAlreadyExistsException {
        if (findByUsername(newUser.getUsername()) != null || findByEmail(newUser.getEmail()) != null) {
            throw new UserAlreadyExistsException("An account for that username/email already exists");
        } else {
            newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
            return userRepository.save(newUser);
        }
    }

    //use only for creating first user after DB drop
    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }



}

