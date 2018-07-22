/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import pojo.Admin;
import pojo.Users;


/**
 *
 * @author hasee
 */
public interface ManagerDao {
    public Admin login(String mid);
    Users getUserById(String uid);
    void update(Admin admin);
    void freezeUser(String uid, int value);
}
