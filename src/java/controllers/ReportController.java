package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Report;
import services.FoodService;
import services.HotelService;
import services.NoteService;
import services.ReportService;
import services.ScenicService;
import services.TravelService;
import services.UsersService;

/**
 *
 * @author Jason
 */
@Controller
@RequestMapping(value = "report")
public class ReportController {
    @Autowired
    ReportService rs;
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
    
    //only delete this report
    @RequestMapping(value = "/delete" , method = RequestMethod.POST)
    @ResponseBody
    public String deleteReport(String rid){
        rs.deleteReport(rid);
        return "manager/toReportManage";
    }
    
    //delete all the things that people reported
    @RequestMapping(value = "/erase" , method = RequestMethod.POST)
    @ResponseBody
    public String eraseAll(String rid){
        Report report = rs.getReportById(rid);
        if(report.getFoodStore() != null){
            fs.deleteFood(report.getFoodStore().getFoodStoreId());
        }
        else if(report.getHotel() != null){
            hs.deleteHotel(report.getHotel().getHotelId());
        }
        else if(report.getNote() != null){
            ns.deleteNote(report.getNote().getNoteId());
        }
        else if(report.getFoodStoreComment() != null){
            fs.deleteFoodCommentById(report.getFoodStoreComment().getStoreCommentId());
        }
        else if(report.getHotelComment() != null){
            hs.deleteHotelCommentById(report.getHotelComment().getHotelCommentId());
        }
        else if(report.getNoteComment() != null){
            ns.deleteNoteCommentById(report.getNoteComment().getNoteCommentId());
        }
        else if(report.getScenicComment() != null){
            ss.deleteScenicCommentById(report.getScenicComment().getScenicCommentId());
        }
        rs.deleteReport(rid);
        return "manager/toReportManage";
    }
}
