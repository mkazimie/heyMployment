package pl.coderslab.heymployment.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDto {


    @NotBlank(message = "* This field can't be empty")
    @Size(min = 2, max = 20, message = "* Name must contain between 2 and 20 characters")
    private String name;


}

