package dao;

import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pojo.Report;

/**
 *
 * @author Jason
 */
@Repository
public class ReportDaoImpl implements ReportDao{
    @Autowired
    SessionFactory factory;
    
    @Override
    public ArrayList<Report> getAllReports() {
        Session session = factory.openSession();
        ArrayList<Report> list = (ArrayList<Report>) session.createQuery("from Report order by reportTime asc").list();
        session.close();
        return list;
    }

    @Override
    public void deleteReport(String rid) {
        Session session = factory.openSession();
        Transaction trans = session.beginTransaction();
        Query q = session.createQuery("delete from Report where reportId = ?");
        q.setString(0, rid);
        q.executeUpdate();
        trans.commit();
        session.close();
    }

    @Override
    public Report getReportById(String rid) {
        Session session = factory.openSession();
        Report report = (Report) session.createQuery("from Report where reportId = ?").setString(0, rid).uniqueResult();
        session.close();
        return report;
    }
    
}
