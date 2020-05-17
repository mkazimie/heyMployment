package pl.coderslab.heymployment.domain.dto;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDto {

    @NotBlank
    @Size(min = 5, max = 250, message = "* Question must contain between 5 and 250 characters")
    private String question;

    @Size(max = 1000, message = "* Answer can't contain more than 1000 characters")
    private String answer;

    private String difficulty;

    private boolean ready;

    private String interviewCategory;
}
