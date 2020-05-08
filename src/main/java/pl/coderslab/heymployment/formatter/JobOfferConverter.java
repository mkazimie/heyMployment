package pl.coderslab.heymployment.formatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import pl.coderslab.heymployment.domain.JobOffer;
import pl.coderslab.heymployment.service.JobOfferService;

@Component
public class JobOfferConverter implements Converter<String, JobOffer> {

    @Autowired
    private JobOfferService jobOfferService;

    @Override
    public JobOffer convert(String id) {
        return jobOfferService.findById(Long.parseLong(id));
    }
}
