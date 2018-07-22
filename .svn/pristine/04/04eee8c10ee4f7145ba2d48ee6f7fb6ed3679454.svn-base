/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.util.ArrayList;
import pojo.Note;
import pojo.NoteComment;
import pojo.Report;
import pojo.Users;

/**
 *
 * @author hasee
 */
public interface NoteService {
    void addNote(Note note);
    void deleteNote(String nid);
    void updateNote(Note note);
    ArrayList<Note> getAllNotes();
    ArrayList<Note> sortLikeNotes();
    ArrayList<Note> sortReleaseNotes();
    Note getNoteById(String nid);
    ArrayList<Note> getTopNotes();

    public void addNoteComment(NoteComment noteComment);
    public ArrayList<NoteComment> getAllComments(Note note);

    public ArrayList<Note> getAllNotesByUserId(String user);

    public void addNoteReport(Report report);

    public boolean findReport(Users user, Note note);
    public boolean findReportComment(Users user, NoteComment comment);

    public void deleteNoteCommentById(String noteCommentId);
    
    NoteComment getCommentById(String cid);
}
