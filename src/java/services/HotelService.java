/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

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
public interface HotelService {

    void addHotel(Hotel hotel);

    void updateHotel(Hotel hotel);

    void deleteHotel(String hid);

    void delBook(String bid);

    ArrayList<Hotel> getAllHotel();

    ArrayList<HotelBook> getAllBookByUserId(String uid);

    ArrayList<Hotel> sortByLike();

    Hotel getAHotel(String hid);

    void bookRoom(String hid, String uid, String rid, Timestamp ftime, Timestamp ttime);

    public void addHotelComment(HotelComment hotelComment);

    public boolean checkBook(String uid, String hid);

    public ArrayList<HotelComment> getAllComments(Hotel hotel);

    public Set<HotelRoom> getAllRoomsByHotel(Hotel hotel);

    public void updatePic(Hotel hotel);

    public void deleteHotelCommentById(String hotelCommentId);

    public void addHotelReport(Report report);

    public boolean findReport(Users user, Hotel hotel);

    public boolean findReportComment(Users user, HotelComment comment);

    HotelComment getHotelCommentById(String cid);
}