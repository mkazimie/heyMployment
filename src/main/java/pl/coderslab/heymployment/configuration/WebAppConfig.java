package pl.coderslab.heymployment.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pl.coderslab.heymployment.domain.Topic;
import pl.coderslab.heymployment.formatter.TopicsConverter;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
//        registry.addViewController("/").setViewName("hello");
        registry.addViewController("/403").setViewName("403");
        registry.addViewController("/login/error").setViewName("login-error");
        registry.addViewController("/logout").setViewName("logout");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedMethods("GET", "POST", "PUT", "DELETE")
                .allowedOrigins("http://localhost");
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(topicsConverter());
    }

    @Bean
    public Converter<String, Topic> topicsConverter(){
        return new TopicsConverter();
    }
}
