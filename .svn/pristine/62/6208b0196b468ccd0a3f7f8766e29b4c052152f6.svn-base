/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Tour;
import pojo.TourApply;
import pojo.Users;
import services.TravelService;
import util.ConvertDate;
import util.DateUtils;
import util.IDUtils;

/**
 *
 * @author hasee
 */
@Controller
@RequestMapping(value = "travel")
public class TravelController {

    @Autowired
    TravelService ts;
    IDUtils id=new IDUtils();
    @Autowired
    SessionFactory factory;
    
    String tourId;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addTravel(ConvertDate convert, Model model, HttpSession session) {
        try {
            Users u = (Users) session.getAttribute("CURRENT_USER");
            StringBuffer beginTime1=new StringBuffer(convert.getTourBeginTime());
            beginTime1.append("  12:00:00");
            String beginTime=new String(beginTime1);
            StringBuffer endTime1=new StringBuffer(convert.getTourEndTime());
            endTime1.append("  12:00:00");
            String endTime=new String(endTime1);
            StringBuffer applyTime1=new StringBuffer(convert.getApplyEndTime());
            applyTime1.append("  12:00:00");
            String applyTime=new String(applyTime1);
            Tour t=new Tour(IDUtils.getUUID(), convert.getTourTitle(), convert.getScenicName(),
                    convert.getTourPrice(), convert.getLimitNum(), convert.getTripMode(), convert.getHotelName()
                    , convert.getIsApprove(), DateUtils.StringToDate(beginTime), DateUtils.StringToDate(endTime), DateUtils.StringToDate(applyTime));
            
            TourApply tr=new TourApply(IDUtils.getUUID(), t, u);
            ts.addTravel(t);
            ts.addTravelApply(tr);
            model.addAttribute("travelList", ts.getAllTravel());
            
        } catch (ParseException ex) {
            Logger.getLogger(TravelController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "user/goTravel";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public void deleteTravel(String tid) {
        tid=tourId;
        ts.deleteTravel(tid);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editTravel(ConvertDate convert, Model model) {
        try {
            Tour t=new Tour(convert.getTourId(), convert.getTourTitle(), convert.getScenicName(),
                    convert.getTourPrice(), convert.getLimitNum(), convert.getTripMode(), convert.getHotelName()
                    , convert.getIsApprove(), DateUtils.StringToDate(convert.getTourBeginTime()), DateUtils.StringToDate(convert.getTourBeginTime())
                    , DateUtils.StringToDate(convert.getTourBeginTime()));
            ts.updateTravel(t);
            model.addAttribute("travelList", ts.getAllTravel());
            
        } catch (ParseException ex) {
            System.out.println("update tour error "+ex);
        }
        return "user/goTravel";
    }

    @RequestMapping(value = "/showAll", method = RequestMethod.GET)
    public String showAllTravel(Model model) {
        model.addAttribute("travelList", ts.getAllTravel());
        return "user/goTravel";
    }
    
    
    @RequestMapping(value = "/approve", method = RequestMethod.POST)
    public String approveTravel(String id, Model model) {
        ts.approveTravel(id);
        return "manager/travelManage";
    }
    //getTourId
    @RequestMapping(value = "/getTourId", method = RequestMethod.POST)
    public String getTourId(String tid, Model model) {
        tourId=tid;
        return "manager/travelManage";
    }
    //deleteMember
    @RequestMapping(value = "/delMember", method = RequestMethod.POST)
    public String delMember(String tid, String uid, Model model) {
        tid=tourId;
        ts.delMember(tid, uid);
        return "manager/travelManage";
    }
    //delTravelJoin
    @RequestMapping(value = "/delTravelJoin", method = RequestMethod.POST)
    public String delTravelJoin(String tid, String uid, Model model, HttpSession session) {
        Users user=(Users) session.getAttribute("CURRENT_USER");
        uid=user.getUserId();
        ts.delMember(tid, uid);
        return "manager/travelManage";
    }

}
