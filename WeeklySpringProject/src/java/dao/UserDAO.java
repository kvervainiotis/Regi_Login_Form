/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

//import javax.sql.DataSource;
//import model.User;
//import org.springframework.jdbc.core.JdbcTemplate;
import helper.Helper;
import javax.sql.DataSource;
import mappers.UserMapper;
import model.User;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author krocos
 */
public class UserDAO {

    private DataSource dataSource;

    public UserDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public User checkLogin(String username, String password) {
        User user = null;
        String sql = "SELECT * FROM user WHERE username = ?;";
        try {
            JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
            user = jdbcTemplate.queryForObject(
                    sql, new UserMapper(), username);
            boolean arePasswordsTheSame = Helper.checkPasswordHashed(password, user);
            if (arePasswordsTheSame == true) {
                user.setPassword(null);
                return user;
            } else {
                return null;
            }
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public String findifUsernameExists(String username) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "SELECT username FROM user WHERE username = ?;";
        try {
            String name = jdbcTemplate.queryForObject(
                    sql, String.class, username);
            return name;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    public int addUser(User u) {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        String sql = "INSERT INTO user values('" + u.getUsername() + "', '" + u.getFirstname() + "', '" + u.getLastname() + "', '" + u.getPassword() + "', '" + u.getEmail() + "');";
        return jdbcTemplate.update(sql);
    }

}
