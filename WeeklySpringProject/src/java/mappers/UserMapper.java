/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mappers;

import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author krocos
 */
public class UserMapper implements RowMapper<User> {

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        User u = new User();
        u.setUsername(rs.getString(1));
        u.setFirstname(rs.getString(2));
        u.setLastname(rs.getString(3));
        u.setPassword(rs.getString(4));
        u.setEmail(rs.getString(5));
        return u;
    }

}
