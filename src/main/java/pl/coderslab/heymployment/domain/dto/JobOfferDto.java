package pl.coderslab.heymployment.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JobOfferDto {

    @NotBlank
    @Size(min = 5, max = 50, message = "* Title must be between 5 and 50 character long")
    private String title;

    @NotBlank
    @Size(min = 3, max = 50, message = "* Location must be between 5 and 50 character long")
    private String location;

    @NotBlank
    @Size(min = 5, max = 50, message = "* Name must be between 5 and 50 characters long")
    private String companyName;

    @NotEmpty
    private String status;


}
