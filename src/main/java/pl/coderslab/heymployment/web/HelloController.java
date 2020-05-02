package pl.coderslab.heymployment.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/")
public class HelloController {


    @GetMapping
    public String displayHomePage(){
        return "hello";
    }

}
