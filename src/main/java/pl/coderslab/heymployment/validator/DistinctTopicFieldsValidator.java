package pl.coderslab.heymployment.validator;

import pl.coderslab.heymployment.domain.dto.CourseDto;
import pl.coderslab.heymployment.domain.dto.UserDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class DistinctTopicFieldsValidator
        implements ConstraintValidator<DistinctTopicFields, Object> {

    @Override
    public void initialize(DistinctTopicFields constraintAnnotation) {
    }


    @Override
    public boolean isValid(Object obj, ConstraintValidatorContext context) {
        CourseDto course = (CourseDto) obj;
        if (!(course.getAdditionalTopic1().isEmpty() && course.getAdditionalTopic2().isEmpty())) {
            return !(course.getMainTopic().equalsIgnoreCase(course.getAdditionalTopic1()) || course.getMainTopic().equalsIgnoreCase(course.getAdditionalTopic2()) || course.getAdditionalTopic1().equalsIgnoreCase(course.getAdditionalTopic2()));
        }
        return !(course.getMainTopic().equalsIgnoreCase(course.getAdditionalTopic1()) || course.getMainTopic().equalsIgnoreCase(course.getAdditionalTopic2()));

    }
}