/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import pojo.Tour;
import pojo.Users;

/**
 *
 * @author hasee
 */
public interface UserDao {

    Users getAUser(String uid);

    void save(Users user);

    void update(Users user);

    void delete(String uid);

    void updatePass(Users user);

    ArrayList<Users> getAllUsers();

    void joinTravel(String uid, String tid);

    void updatePic(Users user);

    boolean checkJoinTravel(String uid, String tid);

    public String checkExist(Users user);
}
