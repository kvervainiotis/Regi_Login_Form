/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import helper.Helper;
import jbcrypt.BCrypt;
import model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author krocos
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/createform.htm", method = RequestMethod.GET)
    public String login(ModelMap model) {
        User u = new User();
        model.addAttribute("user", u);
        return "login";
    }

    @RequestMapping(value = "/checkregistration.htm", method = RequestMethod.POST)
    public String receiveRegistrationForm(ModelMap model, User u) {
        if (Helper.checkForEmptyFields(u)) {
            model.addAttribute("message", "No empty fields are required!");
            model.addAttribute("user", u);
            return "login";
        }
        boolean isSamePasswords = Helper.checkPasswords(u.getPassword(), u.getConfirmPassword());
        if (isSamePasswords == true) {
            String k = userDao.findifUsernameExists(u.getUsername());
            if (k == null) {
                String hashed = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
                u.setPassword(hashed);
                userDao.addUser(u);
                return "registrationcomplete";
            } else {
                model.addAttribute("message", "Username already exists...");
                model.addAttribute("user", u);
                return "login";
            }
        } else {
            model.addAttribute("message", "Passwords must be the same...");
            model.addAttribute("user", u);
            return "login";
        }
    }

    @RequestMapping(value = "/checklogin.htm", method = RequestMethod.POST)
    public String receiveLoginForm(ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password) {
        User user = userDao.checkLogin(username, password);
        if (user == null) {
            model.addAttribute("message", "Incorrect username or password!");
            model.addAttribute("user", new User());
            return "login";
        } else {
            model.addAttribute(user);
            return "successlogin";
        }
    }

}
