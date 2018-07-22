/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.sql.Timestamp;

/**
 *
 * @author Jason
 */
public class ScenicComment implements java.io.Serializable {
    private String scenicCommentId;
    private Scenic scenic;
    private Users users;
    private String commentContent;
    private Timestamp commentTime;

    public ScenicComment() {
    }

    public ScenicComment(String scenicCommentId, Scenic scenic, Users users, String commentContent, Timestamp commentTime) {
        this.scenicCommentId = scenicCommentId;
        this.scenic = scenic;
        this.users = users;
        this.commentContent = commentContent;
        this.commentTime = commentTime;
    }

    public Timestamp getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Timestamp commentTime) {
        this.commentTime = commentTime;
    }

    public String getScenicCommentId() {
        return scenicCommentId;
    }

    public void setScenicCommentId(String scenicCommentId) {
        this.scenicCommentId = scenicCommentId;
    }

    public Scenic getScenic() {
        return scenic;
    }

    public void setScenic(Scenic scenic) {
        this.scenic = scenic;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }
    
}
