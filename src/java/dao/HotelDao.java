/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;
import pojo.Hotel;
import pojo.HotelBook;
import pojo.HotelComment;
import pojo.HotelRoom;
import pojo.Report;
import pojo.ScenicComment;
import pojo.Users;

/**
 *
 * @author hasee
 */
public interface HotelDao {

    void insertHotel(Hotel hotel);

    void deleteHotel(String hid);

    void delBook(String bid);

    void update(Hotel hotel);

    Hotel getHotelById(String hid);

    HotelComment getHotelCommentById(String cid);

    ArrayList<Hotel> getAllHotel();

    ArrayList<HotelBook> getAllBookByUserId(String uid);

    void bookRoom(String hid, String uid, String rid, Timestamp ftime, Timestamp ttime);

    public void insertHotelComment(HotelComment hotelComment);

    public ArrayList<HotelComment> getAllComments(Hotel hotel);

    public Set<HotelRoom> getAllRoomsByHotel(Hotel hotel);

    ArrayList<Hotel> sortByLike();

    public void updatePic(Hotel hotel);

    public void deleteHotelCommentById(String hotelCommentId);

    public void addHotelReport(Report report);

    public boolean findReport(Users user, Hotel hotel);

    public boolean findReportComment(Users user, HotelComment comment);

    public boolean checkBook(String uid, String hid);
}