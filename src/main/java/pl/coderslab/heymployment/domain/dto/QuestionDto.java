package pl.coderslab.heymployment.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QuestionDto {

    @NotBlank
    @Size(min = 5, max = 250)
    private String question;

    @Size(max = 1000)
    private String answer;

    private String difficulty;

    private boolean ready;

    private String interviewCategory;

    private String topic;
}
