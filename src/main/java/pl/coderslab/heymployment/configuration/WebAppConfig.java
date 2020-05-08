package pl.coderslab.heymployment.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//import pl.coderslab.heymployment.formatter.JobOfferConverter;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry){
        registry.addViewController("/").setViewName("hello");
        registry.addViewController("/403").setViewName("403");
        registry.addViewController("/login/error").setViewName("login-error");
        registry.addViewController("/logout").setViewName("logout");
    }


}
