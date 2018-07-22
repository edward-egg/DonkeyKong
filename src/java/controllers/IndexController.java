/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import services.FoodService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pojo.Note;
import pojo.Report;
import pojo.Tour;
import pojo.Users;
import services.HotelService;
import services.NoteService;
import services.ReportService;
import services.ScenicService;
import services.TravelService;
import services.UsersService;

/**
 *
 * @author hasee
 */
@Controller
public class IndexController {

    @Autowired
    FoodService fs;
    @Autowired
    UsersService us;
    @Autowired
    HotelService hs;
    @Autowired
    ScenicService ss;
    @Autowired
    NoteService ns;
    @Autowired
    TravelService ts;
    @Autowired
    ReportService rs;

    int HotelSort = 0;
    int NoteLikeSort = 0;
    int NoteReleaseSort = 0;
    int TravelDaysSort = 0;
    int TravelCostSort = 0;

    /////////////////////Main Page////////////////////////
    @RequestMapping(value = {"/", "main.htm"})
    public String main(Model model) {
        model.addAttribute("topScenicList", ss.getTopSenic());
        model.addAttribute("noteTopList", ns.getTopNotes());
        return "main";
    }

    @RequestMapping(value = "redirect/main")
    public String mainPage(Model model) {
        model.addAttribute("topScenicList", ss.getTopSenic());
        model.addAttribute("noteTopList", ns.getTopNotes());
        return "main";
    }

    @RequestMapping(value = "redirect/login")
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "redirect/register")
    public String registerPage() {
        return "register";
    }

    @RequestMapping(value = "redirect/userPage")
    public String userPage() {
        return "user/userPage";
    }

    @RequestMapping(value = "redirect/scenicPage")
    public String scenicPage(Model model) {
        model.addAttribute("scenicList", ss.getAllScenic());
        model.addAttribute("topScenicList", ss.getTopSenic());
        model.addAttribute("topScenicByQD", ss.getScenicByQD());
        return "scenicPage";
    }

    @RequestMapping(value = "redirect/foodPage")
    public String foodPage(Model model) {
        model.addAttribute("topFoodList", fs.getTopFood());
        model.addAttribute("foodList", fs.getAllFood());
        model.addAttribute("foodListByQD", fs.getFoodByQD());
        return "foodPage";
    }

    @RequestMapping(value = "redirect/notePage")
    public String notePage(Model model) {
        if ((NoteLikeSort == 0 && NoteReleaseSort == 0) || (NoteLikeSort == 1 && NoteReleaseSort == 1)) {
            model.addAttribute("noteTopList", ns.getTopNotes());
            model.addAttribute("noteList", ns.getAllNotes());
        } else if (NoteLikeSort == 1) {
            model.addAttribute("noteTopList", ns.getTopNotes());
            model.addAttribute("noteList", ns.sortLikeNotes());
        } else if (NoteReleaseSort == 1) {
            model.addAttribute("noteTopList", ns.getTopNotes());
            model.addAttribute("noteList", ns.sortReleaseNotes());
        }

        return "notePage";
    }

    @RequestMapping(value = "redirect/noteLikeSort")
    public String notePageLikeSort(Model model) {
        if (NoteLikeSort == 0) {
            NoteLikeSort = 1;
        } else {
            NoteLikeSort = 0;
        }
        return "notePage";
    }

    @RequestMapping(value = "redirect/noteReleaseSort")
    public String notePageReleaseSort(Model model) {
        if (NoteReleaseSort == 0) {
            NoteReleaseSort = 1;
        } else {
            NoteReleaseSort = 0;
        }
        return "notePage";
    }

    @RequestMapping(value = "redirect/travelPage")
    public String travelPage(Model model) {
        if ((TravelCostSort == 0 && TravelDaysSort == 0) || (TravelCostSort == 1 && TravelDaysSort == 1)) {
            model.addAttribute("travelList", ts.getAllTravel());
        } else if (TravelDaysSort == 1) {
            model.addAttribute("travelList", ts.sortDaysTravel());
        } else if (TravelCostSort == 1) {
            model.addAttribute("travelList", ts.sortCostTravel());
        }
        return "travelPage";
    }

    @RequestMapping(value = "redirect/travelPageDaysSort")
    public String travelPageDaysSort(Model model) {
        if (TravelDaysSort == 0) {
            TravelDaysSort = 1;
        } else {
            TravelDaysSort = 0;
        }
        return "travelPage";
    }

    @RequestMapping(value = "redirect/travelPageCostSort")
    public String travelPageCostSort(Model model) {
        if (TravelCostSort == 0) {
            TravelCostSort = 1;
        } else {
            TravelCostSort = 0;
        }
        return "travelPage";
    }

    @RequestMapping(value = "redirect/hotelPage")
    public String hotelPage(Model model) {
        if (HotelSort == 1) {
            model.addAttribute("hotelList", hs.sortByLike());
        } else {
            model.addAttribute("hotelList", hs.getAllHotel());
        }
        return "hotelPage";
    }

    @RequestMapping(value = "redirect/hotelPageSort")
    public String hotelPageSort(Model model) {
        if (HotelSort == 0) {
            HotelSort = 1;
        } else {
            HotelSort = 0;
        }
        return "hotelPage";
    }

    @RequestMapping(value = "redirect/manager")
    public String manager() {
        return "manager/manager";
    }

    ///////////////Page Detail////////////////
    @RequestMapping(value = "toTravelDetail")
    public String travelDetail() {
        return "travelDetail";
    }

    @RequestMapping(value = "toFoodDetail")
    public String foodDetail() {
        return "foodDetail";
    }

    @RequestMapping(value = "toHotelDetail")
    public String hotelDetail() {
        return "hotelDetail";
    }

    @RequestMapping(value = "toScenicDetail")
    public String scenicDetail() {
        return "scenicDetail";
    }

    @RequestMapping(value = "toNoteDetail")
    public String noteDetail() {
        return "noteDetail";
    }

    ////////////////////////////Manager Page/////////////////////////////////
    @RequestMapping(value = "toChangePass")
    public String toChangePass() {
        return "manager/changePass";
    }

    @RequestMapping(value = "toUserManage")
    public String toUserManage(Model model) {
        model.addAttribute("userList", us.getUsers());
        return "manager/userManage";
    }

    @RequestMapping(value = "toFoodManage")
    public String toFoodManage(Model model) {
//        model.addAttribute("foodList", fs.getAllFood());
//        System.out.println(fs.getAllFood());
        return "manager/foodManage";
    }

    @RequestMapping(value = "toHotelManage")
    public String toHotelManage(Model model) {
        model.addAttribute("hotelList", hs.getAllHotel());
        return "manager/hotelManage";
    }

    @RequestMapping(value = "toScenicManage")
    public String toScenicManage(Model model) {
        model.addAttribute("scenicList", ss.getAllScenic());
        return "manager/scenicManage";
    }

    @RequestMapping(value = "toReportManage")
    public String toReportManage(Model model) {
        ArrayList<Report> list = rs.getAllReports();
        for(Report r : list){
            if(r.getFoodStore() != null){
                r.setFoodStore(fs.getFoodById(r.getFoodStore().getFoodStoreId()));
            }
            if(r.getHotel() != null){
                r.setHotel(hs.getAHotel(r.getHotel().getHotelId()));
            }
            if(r.getNote() != null){
                r.setNote(ns.getNoteById(r.getNote().getNoteId()));
            }
        }
        model.addAttribute("reportList", list);
        return "manager/reportManage";
    }

    @RequestMapping(value = "toTravelManage")
    public String toTravelManage(Model model) {
        model.addAttribute("travelList", ts.getAllTravelNotApproved());
        return "manager/travelManage";
    }

    /////////////////////////User Page////////////////////
    @RequestMapping(value = "toUserDetail")
    public String userDetail(Model model, Users user) {
        model.addAttribute("user", user);
        return "user/userDetail";
    }

    @RequestMapping(value = "toMyNote")
    public String myNote(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("CURRENT_USER");
        model.addAttribute("noteList", ns.getAllNotesByUserId(user.getUserId()));
        return "user/myNote";
    }
    
    @RequestMapping(value="toHotelBooking")
    public String myHotel(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("CURRENT_USER");
        model.addAttribute("bookList", hs.getAllBookByUserId(user.getUserId()));
        return "user/hotelBook";
    }

    @RequestMapping(value = "toGoTravel")
    public String goTravel(Model model, HttpSession session) {
        Users user = (Users) session.getAttribute("CURRENT_USER");
        model.addAttribute("travelList", ts.getAllTravelByUserId(user.getUserId()));
        model.addAttribute("travelJoinList", ts.getTravelById(user.getUserId()));
        session.setAttribute("USER_TRAVEL", ts.getAllTravelByUserId(user.getUserId()));
        ArrayList<Tour> list = (ArrayList<Tour>) session.getAttribute("USER_TRAVEL");
        if (ts.getAllTravelByUserId(user.getUserId()).size() != 0) {
            for (int i = 0; i < list.size(); i++) {
                model.addAttribute("applyList", ts.getApplyUsersId(list.get(i).getTourId()));
            }
        }
        if (list.size() > 0) {
            model.addAttribute("applyList", ts.getApplyUsersId(list.get(0).getTourId()));
        }
        return "user/goTravel";
    }

}
