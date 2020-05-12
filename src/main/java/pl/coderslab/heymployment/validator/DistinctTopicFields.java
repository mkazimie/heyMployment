package pl.coderslab.heymployment.validator;


import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DistinctTopicFieldsValidator.class)
@Documented
public @interface DistinctTopicFields {

    String message() default "*Unique values required";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
