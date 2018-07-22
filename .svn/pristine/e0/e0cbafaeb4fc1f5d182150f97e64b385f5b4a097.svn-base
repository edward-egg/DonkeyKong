/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import pojo.FoodStore;
import pojo.FoodStoreComment;
import pojo.Report;
import pojo.Users;

/**
 *
 * @author hasee
 */
public interface FoodDao {

    void insertFood(FoodStore food);

    void deleteFood(String fid);

    void updateFood(FoodStore food);

    FoodStore getFoodById(String fid);
    FoodStoreComment getFoodStoreCommentById(String cid);

    ArrayList<FoodStore> getAllFood();

    ArrayList<FoodStore> getTopFood();

    ArrayList<FoodStore> getFoodByQD();

    public void insertStoreComment(FoodStoreComment storeComment);

    public ArrayList<FoodStoreComment> getAllComments(FoodStore store);

    public void updatePic(FoodStore food);

    public void deleteFoodCommentById(String storeCommentId);

    public void addFoodReport(Report report);
    

    boolean findReport(Users user, FoodStore food);
    boolean findReportComment(Users user, FoodStoreComment comment);
}
