/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pojo.Admin;
import pojo.Tour;
import pojo.Users;
import util.DateUtils;
import util.EmailUtil;
import util.MD5Utils;

/**
 *
 * @author hasee
 */
@Repository
public class ManagerDaoImpl implements ManagerDao {

    @Autowired
    SessionFactory factory;

    @Override
    public Admin login(String mid) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        Admin temp = (Admin) session.get(Admin.class, mid);
        trans.commit();
        session.close();
        return temp;
    }

    @Override
    public void update(Admin admin) {

//        String hql = "UPDATE Admin as admin SET admin.password=? WHERE admin.adminId='admin'";    
        String hql = "from Admin where adminId='admin'";
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        Admin admin2 = (Admin) session.createQuery(hql).uniqueResult();
        admin2.setPassword(admin.getPassword());
        admin2.setUpdateTime(DateUtils.getTimestamp());
        session.update(admin2);
        trans.commit();
        System.out.println("更新成功！");
        System.out.println("-------------------->" + admin);
        session.close();
    }

    @Override
    public Users getUserById(String uid) {
        System.out.println(uid + "-------------uid");
        String hqltour = "from Users where userId=?";
        Session session = factory.openSession();
        Query querytour = session.createQuery(hqltour).setString(0, uid);
        ArrayList<Users> listtouri = (ArrayList<Users>) querytour.list();
        session.close();
        return listtouri.get(0);
    }

    @Override
    public void freezeUser(String uid, int value) {
        try {
            Users user = getUserById(uid);
            user.setFreeze(value);
            String text;
            if (value == 0) {
                text = "Your account is unfreezed by admin, if you have any problem please contact admin (Tel: 17806239018).";
            }else{
                text = "Your account is freezed by admin, if you have any problem please contact admin (Tel: 17806239018).";
            }
            EmailUtil.send_mail(user.getEmail(), text);
            Session session = factory.openSession();
            Transaction trans = session.beginTransaction();
            session.update(user);
            trans.commit();
            session.close();
        } catch (MessagingException ex) {
            Logger.getLogger(ManagerDaoImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
