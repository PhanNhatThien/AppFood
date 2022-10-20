package com.appfood.validator;

import com.appfood.pojo.Product;
import com.appfood.utils.Utils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.text.ParseException;

@Component
public class ProductValidator implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return Product.class.equals(aClass);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Product product = (Product) target;

        // validate name
        if (product.getName().length() > 100)
            errors.rejectValue("name", "", "Tên bài viết không quá 100 ký tự");


        // validate description
        if (product.getDescription().length() > 100)
            errors.rejectValue("description", "", "Mo ta không quá 100 ký tự");


    }
}
