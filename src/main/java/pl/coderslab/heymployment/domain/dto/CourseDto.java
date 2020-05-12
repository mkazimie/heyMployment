package pl.coderslab.heymployment.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.URL;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.heymployment.validator.DistinctTopicFields;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.time.LocalDate;


@Data
@AllArgsConstructor
@NoArgsConstructor
@DistinctTopicFields
public class CourseDto {


    @NotBlank
    @Size(min = 2, max = 50, message = "* Name must be between 5 and 50 character long")
    private String name;

    @Size(max = 1000, message = "* Description is too long")
    private String description;

    @NotEmpty
    private String status;

    @URL
    private String url;

    @Size(min = 2, max = 50, message = "* The organizing entity name must be between 5 and 50 character long")
    private String organizedBy;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate finishDate;

    @NotBlank
    @Size(max = 50, message = "* Topic name is too long")
    private String mainTopic;

    @Size(max = 50, message = "* Topic name is too long")
    private String additionalTopic1;

    @Size(max = 50, message = "* Topic name is too long")
    private String additionalTopic2;
}
