/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import pojo.Admin;

/**
 *
 * @author hasee
 */
public interface ManagerService {
    Admin login(String mid,String mpass);
    void update(Admin admin);
    void freezeUser(String uid, int value);
}