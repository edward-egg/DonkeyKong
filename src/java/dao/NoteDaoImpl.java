/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pojo.Note;
import pojo.NoteComment;
import pojo.Report;
import pojo.Users;

/**
 *
 * @author hasee
 */
@Repository
public class NoteDaoImpl implements NoteDao{

    @Autowired
    SessionFactory factory;
    
    @Override
    public void insertNote(Note note) {
        Session session=factory.openSession();
        Transaction trans=session.beginTransaction();
        session.save(note);
        trans.commit();
        session.close();
    }

    @Override
    public void deleteNote(String nid) {
        Session session=factory.openSession();
        Transaction trans=session.beginTransaction();
        session.delete(getNoteById(nid));
        trans.commit();
        session.close();
    }

    @Override
    public void updateNote(Note note) {
        Session session=factory.openSession();
        Transaction trans=session.beginTransaction();
        session.update(note);
        trans.commit();
        session.close();
    }

    @Override
    public Note getNoteById(String nid) {
        String hql = "from Note where noteId=?";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, nid);
        Note note = (Note) query.uniqueResult();
        session.close();
        return note;
    }

    @Override
    public ArrayList<Note> getAllNotes() {
        String hql = "from Note";
        Session session=factory.openSession();
        ArrayList<Note> list = (ArrayList<Note>) session.createQuery(hql).list();
        session.close();
        return list;
    }

    @Override
    public void insertNoteComment(NoteComment noteComment) {
        Session session = factory.openSession();
        Transaction trans=session.beginTransaction();
        session.save(noteComment);
        trans.commit();
        session.close();
    }
    
    @Override
    public ArrayList<NoteComment> getAllComments(Note note) {
        String hql = "from NoteComment where note = ? order by commentTime desc";
        Session session=factory.openSession();
        Query query = session.createQuery(hql);     
        ArrayList<NoteComment> list = (ArrayList<NoteComment>)query.setEntity(0, note).list();       
        session.close();
        System.out.println("DAO LAYOR=====>"+list.size());
        return list;
    }

    @Override
    public ArrayList<Note> getTopNotes() {
        String hql = "from Note as n order by n.noteLike desc";
        Session session = factory.openSession();
        Query query = session.createQuery(hql);  
        query.setMaxResults(6);
        ArrayList<Note> topList = (ArrayList<Note>)query.list();
        session.close();
        
        return topList;
    }

    @Override
    public ArrayList<Note> getAllNotesByUserId(String userId) {
        String hql = "from Note where users = ?";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, userId);
        ArrayList<Note> list = (ArrayList<Note>) query.list();
        return list;
    }

    @Override
    public ArrayList<Note> sortLikeNotes() {
        Comparator<Note> c = new Comparator<Note>() {
            @Override
            public int compare(Note o1, Note o2) {
                if (o1.getNoteLike() < o2.getNoteLike()) {
                    return 1;
                } else {
                    return -1;
                }
            }
        };
        ArrayList<Note> list = getAllNotes();
        list.sort(c);
        return list;
    }

    @Override
    public ArrayList<Note> sortReleaseNotes() {
        Comparator<Note> c = new Comparator<Note>() {
            @Override
            public int compare(Note o1, Note o2) {
                try {  
                    Date dt1 = o1.getUpdateTime();  
                    Date dt2 = o2.getUpdateTime();  
                    if (dt1.getTime() > dt2.getTime()) {  
                        return 1;  
                    } else if (dt1.getTime() < dt2.getTime()) {  
                        return -1;  
                    } else {  
                        return 0;  
                    }  
                } catch (Exception e) {  
                    System.out.println("sort release time error: "+e);  
                }  
                return 0;  
            }
        };
        ArrayList<Note> list = getAllNotes();
        list.sort(c);
        return list;
    }

    @Override
    public void addNoteReport(Report report) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.save(report);
        trans.commit();
        session.close();
    }

    @Override
    public boolean findReport(Users user, Note note) {
        Session session = factory.openSession();
        Query q = session.createQuery("from Report where user = ? and note = ?");
        q.setString(0, user.getUserId());
        q.setString(1, note.getNoteId());
        Report report = (Report) q.uniqueResult();
        if(report == null){
            return false;
        }
        return true;
    }

    @Override
    public void deleteNoteCommentById(String noteCommentId) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.createQuery("delete from NoteComment where noteCommentId = ?").setString(0, noteCommentId).executeUpdate();
        trans.commit();
        session.close();
    }

    @Override
    public NoteComment getCommentById(String cid) {
        String hql = "from NoteComment where noteCommentId=?";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, cid);
        NoteComment comment = (NoteComment) query.uniqueResult();
        session.close();
        return comment;
    }

    @Override
    public boolean findReportComment(Users user, NoteComment comment) {
        Session session = factory.openSession();
        Query q = session.createQuery("from Report where user = ? and noteComment = ?");
        q.setString(0, user.getUserId());
        q.setString(1, comment.getNoteCommentId());
        Report report = (Report) q.uniqueResult();
        if(report == null){
            return false;
        }
        return true;
    }
    
    
}