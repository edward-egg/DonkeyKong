 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.Comparator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pojo.Note;
import pojo.Tour;
import pojo.TourApply;
import pojo.TourJoin;
import pojo.Users;
import util.DateUtils;

/**
 *
 * @author hasee
 */
@Repository
public class TravelDaoImpl implements TravelDao{

    @Autowired
    SessionFactory factory;
    
    @Override
    public void insertTravel(Tour tour) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.save(tour);
        trans.commit();
        session.close();
    }
    @Override
    public void addTravelApply(TourApply tr){
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.save(tr);
        trans.commit();
        session.close();
    }

    @Override
    public void deleteTravel(String tid) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.delete(getTourById(tid));
        trans.commit();
        session.close();
    }

    @Override
    public void updateTravel(Tour tour) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.update(tour);
        trans.commit();
        session.close();
    }

    @Override
    public Tour getTourById(String tid) {
        System.out.println(tid+"-------------tid");
        String hqltour = "from Tour where tourId=?";
        Session session = factory.openSession();
        Query querytour = session.createQuery(hqltour).setString(0, tid);
        ArrayList<Tour> listtouri = (ArrayList<Tour>) querytour.list();
        session.close();
        return listtouri.get(0);
    }

    @Override
    public ArrayList<Tour> getAllTravel() {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        String hql = "from Tour where isApprove=1";
        ArrayList<Tour> list = (ArrayList<Tour>) session.createQuery(hql).list();
        trans.commit();
        session.close();
        return list;
    }

    @Override
    public ArrayList<Tour> getAllTravelByUserId(String uid) {
        String hql = "select n.tour.tourId from TourApply as n where users=?";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, uid);
        ArrayList<String> list = (ArrayList<String>) query.list();
        ArrayList<Tour> temp = new ArrayList<Tour>();
        for(int i=0; i<list.size(); i++){
                temp.add(getTourById(list.get(i)));
        }
        session.close();
        return temp;
    }

    @Override
    public ArrayList<String> getApplyUsersId(String tid) {
        String hql = "select t.users.userId from TourJoin as t where t.tour=? ";
        Session session = factory.openSession();
        Query query = session.createQuery(hql).setString(0, tid);
        ArrayList<String> list = (ArrayList<String>) query.list();
        session.close();
        return list;
    }

    @Override
    public void approveTravel(String id) {
        Tour t=getTourById(id);
        t.setIsApprove(1);
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        session.update(t);
        trans.commit();
        session.close();
    }

    @Override
    public ArrayList<Tour> sortDaysTravel() {
        Comparator<Tour> c = new Comparator<Tour>() {
            @Override
            public int compare(Tour o1, Tour o2) {
                if (o1.getTourPrice()< o2.getTourPrice()) {
                    return -1;
                } else {
                    return 1;
                }
            }
        };
        ArrayList<Tour> list = getAllTravel();
        list.sort(c);
        return list;
    }

    @Override
    public ArrayList<Tour> sortCostTravel() {
        Comparator<Tour> c = new Comparator<Tour>() {
            @Override
            public int compare(Tour o1, Tour o2) {
                int d1=DateUtils.dayToDay(o1.getTourBeginTime(), o1.getTourEndTime());
                int d2=DateUtils.dayToDay(o2.getTourBeginTime(), o2.getTourEndTime());
                if (d1< d2) {
                    return -1;
                } else {
                    return 1;
                }
            }
        };
        ArrayList<Tour> list = getAllTravel();
        list.sort(c);
        return list;
    }

    @Override
    public void delMember(String tid, String uid) {
        System.out.println(tid+" "+uid);
        String hql="from TourJoin where users=? and tour=?";
        Session session=factory.openSession();
        Transaction trans=session.beginTransaction();
        Query query=session.createQuery(hql);
        query.setString(0, uid);
        query.setString(1, tid);
        TourJoin tj=(TourJoin) query.uniqueResult();
        System.out.println(tj.getUsers()+"---------users");
        session.delete(tj);
        trans.commit();
        session.close();
    }

    @Override
    public ArrayList<TourJoin> getTravelById(String uid) {
        String hql="from TourJoin where users=?";
        Session session=factory.openSession();
        Transaction trans=session.beginTransaction();
        ArrayList<TourJoin> list = (ArrayList<TourJoin>) session.createQuery(hql).setString(0, uid).list();
        trans.commit();
        session.close();
        return list;
    }

    @Override
    public ArrayList<Tour> getAllTravelNotApproved() {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        String hql = "from Tour where isApprove=0";
        ArrayList<Tour> list = (ArrayList<Tour>) session.createQuery(hql).list();
        trans.commit();
        session.close();
        return list;
    }
    
}
