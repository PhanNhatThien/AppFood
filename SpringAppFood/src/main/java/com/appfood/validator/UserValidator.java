package com.appfood.validator;

import com.appfood.pojo.Category;
import com.appfood.pojo.User;
import com.appfood.utils.Utils;
import com.appfood.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class UserValidator implements Validator {

    @Autowired
    private UserService userService;


    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;
//        int usernameMinLength = 3;
//        int usernameMaxLength = 15;
//        int passwordMinLength = 6;

        // validate username
//        if (userService.getUsers(user.getUsername(), 0).size() > 0)
//            errors.rejectValue("username", "", "Tên đăng nhập đã tồn tại");

        if (user.getUsername().isEmpty())
            errors.rejectValue("username", "", "Tên đăng nhập không được bỏ trống");


        if (user.getFirstName().isEmpty())
            errors.rejectValue("firstName", "", "Tên không được bỏ trống");
//
//        if (user.getUsername().length() < usernameMinLength)
//            errors.rejectValue("username", "", "Tên đăng nhập không ít hơn " + usernameMinLength + " ký tự");
//
//        if (user.getUsername().length() > usernameMaxLength)
//            errors.rejectValue("username", "", "Tên đăng nhập không quá " + usernameMaxLength + " ký tự");
//
//        // validate password
        if (user.getPassword().isEmpty())
            errors.rejectValue("password", "", "Mật khẩu không được bỏ trống");

//        if (!user.getPassword().equals(user.getConfirmPassword()))
//            errors.rejectValue("password", "", "Mật khẩu và xác nhận mật khẩu chưa trùng khớp");
//
        if (user.getPassword().contains(" "))
            errors.rejectValue("password", "", "Mật khẩu không chứa khoảng trắng");
//
//        if (user.getPassword().length() < passwordMinLength)
//            errors.rejectValue("password", "", "Mật khẩu cần có tối thiểu " + passwordMinLength + " ký tự");

        // validate email
//        if (userService.getByEmail(user.getEmail()).size() > 0)
//            errors.rejectValue("email", "", "Email đã tồn tại");
//
//        if (!utils.isValidEmail(user.getEmail()))
//            errors.rejectValue("email", "", "Email chưa đúng định dạng");

        // validate phone
//        if (userService.getByPhone(user.getPhone()).size() > 0)
//            errors.rejectValue("phone", "", "Số điện thoại đã tồn tại");
//
//        if (!utils.isValidMobile(user.getPhone()))
//            errors.rejectValue("phone", "", "Số điện thoại không hợp lệ");
    }
}