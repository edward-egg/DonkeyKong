package pojo;

import java.sql.Timestamp;

/**
 *
 * @author Jason
 */
public class Report implements java.io.Serializable {
    private String reportId;
    private Users user;
    private FoodStore foodStore;
    private Hotel hotel;
    private Note note;
    private FoodStoreComment foodStoreComment;
    private HotelComment hotelComment;
    private NoteComment noteComment;
    private ScenicComment scenicComment;
    private String reportContent;
    private Timestamp reportTime;

    public Report() {
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public FoodStore getFoodStore() {
        return foodStore;
    }

    public void setFoodStore(FoodStore foodStore) {
        this.foodStore = foodStore;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Note getNote() {
        return note;
    }

    public void setNote(Note note) {
        this.note = note;
    }

    public FoodStoreComment getFoodStoreComment() {
        return foodStoreComment;
    }

    public void setFoodStoreComment(FoodStoreComment foodStoreComment) {
        this.foodStoreComment = foodStoreComment;
    }

    public HotelComment getHotelComment() {
        return hotelComment;
    }

    public void setHotelComment(HotelComment hotelComment) {
        this.hotelComment = hotelComment;
    }

    public NoteComment getNoteComment() {
        return noteComment;
    }

    public void setNoteComment(NoteComment noteComment) {
        this.noteComment = noteComment;
    }

    public ScenicComment getScenicComment() {
        return scenicComment;
    }

    public void setScenicComment(ScenicComment scenicComment) {
        this.scenicComment = scenicComment;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public Timestamp getReportTime() {
        return reportTime;
    }

    public void setReportTime(Timestamp reportTime) {
        this.reportTime = reportTime;
    }
    
    
    
}
