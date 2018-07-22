/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.FoodDao;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.FoodStore;
import pojo.FoodStoreComment;
import pojo.Report;
import pojo.Users;

/**
 *
 * @author hasee
 */
@Service
public class FoodServiceImpl implements FoodService{

    @Autowired
    FoodDao fd;
    
    @Override
    public void addFood(FoodStore food) {
        fd.insertFood(food);
    }

    @Override
    public void deleteFood(String fid) {
        fd.deleteFood(fid);
    }

    @Override
    public void updateFood(FoodStore food) {
        fd.updateFood(food);
    }

    @Override
    public ArrayList<FoodStore> getAllFood() {
        return fd.getAllFood();
    }

    @Override
    public FoodStore getFoodById(String fid) {
        return fd.getFoodById(fid);
    }

    @Override
    public ArrayList<FoodStore> getTopFood() {
        return fd.getTopFood();
    }

    @Override
    public void addStoreComment(FoodStoreComment storeComment) {
        System.out.println("service");
        fd.insertStoreComment(storeComment);
    }

    @Override
    public ArrayList<FoodStoreComment> getAllComments(FoodStore store) {
        return fd.getAllComments(store);
    }

    @Override
    public ArrayList<FoodStore> getFoodByQD() {
        return fd.getFoodByQD();
    }

    @Override
    public void updatePic(FoodStore food) {
        fd.updatePic(food);
    }

    @Override
    public void addFoodReport(Report report) {
        fd.addFoodReport(report);
    }

    @Override
    public boolean findReport(Users user, FoodStore food) {
        return fd.findReport(user, food);
        
    }

    @Override
    public void deleteFoodCommentById(String storeCommentId) {
        fd.deleteFoodCommentById(storeCommentId);
    }

    @Override
    public boolean findReportComment(Users user, FoodStoreComment comment) {
        return fd.findReportComment(user, comment);
    }

    @Override
    public FoodStoreComment getFoodStoreCommentById(String cid) {
        return fd.getFoodStoreCommentById(cid);
    }
    
}
