/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import jbcrypt.BCrypt;
import model.User;

/**
 *
 * @author krocos
 */
public class Helper {
    
    public static boolean checkForEmptyFields(User u){
        if(u.getUsername() == null && u.getUsername().isEmpty())return false;
        if(u.getPassword()== null && u.getPassword().isEmpty())return false;
        if(u.getFirstname()== null && u.getFirstname().isEmpty())return false;
        if(u.getLastname()== null && u.getLastname().isEmpty())return false;
        if(u.getEmail()== null && u.getEmail().isEmpty())return false;
        if(u.getConfirmPassword()== null && u.getConfirmPassword().isEmpty())return false;
        return true;
    }

    public static boolean checkPasswords(String password, String confirmPassword) {
        if (password.equals(confirmPassword)) {
            return true;
        } else {
            return false;
        }
    }

    public static boolean checkPasswordHashed(String password, User u) {
        if (BCrypt.checkpw(password, u.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

}
