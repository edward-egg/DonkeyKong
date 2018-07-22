/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pojo.Report;
import pojo.Scenic;
import pojo.ScenicComment;
import pojo.Users;

/**
 *
 * @author hasee
 */
@Repository
public class ScenicDaoImpl implements ScenicDao {

    @Autowired
    SessionFactory factory;

    @Override
    public ArrayList<Scenic> getAllScenic() {
        String hql = "from Scenic";
        Session session = factory.openSession();
        ArrayList<Scenic> list = (ArrayList<Scenic>) session.createQuery(hql).list();
        session.close();
        return list;
    }

    @Override
    public void insert(Scenic scenic) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.save(scenic);
        trans.commit();
        session.close();
    }

    @Override
    public void delete(String sid) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.delete(getScenic(sid));
        trans.commit();
        session.close();
    }

    @Override
    public void update(Scenic scenic) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.update(scenic);
        trans.commit();
        session.close();
    }

    @Override
    public Scenic getScenic(String sid) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        Scenic temp = (Scenic) session.get(Scenic.class, sid);
        trans.commit();
        session.close();
        return temp;
    }

    @Override
    public ArrayList<Scenic> getTopScenic() {
        String hql = "from Scenic as s order by s.scenicLike desc";
        Session session = factory.openSession();
        Query query = session.createQuery(hql);
        query.setMaxResults(6);
        ArrayList<Scenic> topList = (ArrayList<Scenic>) query.list();
        session.close();

        return topList;
    }

    @Override
    public void insertScenicComment(ScenicComment scenicComment) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.save(scenicComment);
        trans.commit();
        session.close();
    }

    @Override
    public ArrayList<ScenicComment> getAllComments(Scenic scenic) {
        String hql = "from ScenicComment where scenic = ? order by commentTime desc";
        Session session = factory.openSession();
        Query query = session.createQuery(hql);
        ArrayList<ScenicComment> list = (ArrayList<ScenicComment>) query.setEntity(0, scenic).list();
        session.close();
        return list;
    }

    @Override
    public void updatePic(Scenic scenic) {
        Session session = factory.openSession();
        String hql = "update Scenic set scenicImg=?  where scenicId=?";
        Transaction trans = session.beginTransaction();
        Query query = session.createQuery(hql);
        query.setString(0, scenic.getScenicImg());
        query.setString(1, scenic.getScenicId());
        query.executeUpdate();
        trans.commit();
        session.close();
    }

    @Override
    public void deleteScenicCommentById(String scenicCommentId) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.createQuery("delete from ScenicComment where scenicCommentId = ?").setString(0, scenicCommentId).executeUpdate();
        trans.commit();
        session.close();
    }

    @Override
    public ScenicComment getScenicCommentById(String cid) {
        String hql = "from ScenicComment where scenicCommentId=?";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, cid);
        ScenicComment comment = (ScenicComment) query.uniqueResult();
        session.close();
        return comment;
    }

    @Override
    public boolean findReportComment(Users user, ScenicComment comment) {
        Session session = factory.openSession();
        Query q = session.createQuery("from Report where user = ? and scenicComment = ?");
        q.setString(0, user.getUserId());
        q.setString(1, comment.getScenicCommentId());
        Report report = (Report) q.uniqueResult();
        if (report == null) {
            return false;
        }
        return true;
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
    public ArrayList<Scenic> getScenicByQD() {
        String hql = "from Scenic as s  where s.areas.areaName='Shandong'";
        Session session = factory.openSession();
        Query query = session.createQuery(hql);  
        ArrayList<Scenic> topList = (ArrayList<Scenic>)query.list();
        session.close();
        
        return topList;
    }

}