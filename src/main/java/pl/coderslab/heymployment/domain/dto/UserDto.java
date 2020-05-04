package pl.coderslab.heymployment.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;
import pl.coderslab.heymployment.validator.PasswordMatches;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;


@Data
@NoArgsConstructor
@AllArgsConstructor
@PasswordMatches
public class UserDto {


    @NotBlank
    private String firstName;

    @NotBlank
    private String lastName;

    @NotBlank
    @Length(min = 5, message = "Your username must have at least 5 characters")
    private String username;

    @NotBlank
    @Length(min = 5, message = "Your password must have at least 5 characters")
    private String password;

    @NotBlank
    private String matchingPassword;

    @NotBlank
    @Email
    private String email;


}
