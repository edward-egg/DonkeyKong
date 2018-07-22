
package services;

import dao.ReportDao;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Report;

/**
 *
 * @author Jason
 */
@Service
public class ReportServiceImpl implements ReportService{
    @Autowired
    ReportDao rd;
    
    @Override
    public ArrayList<Report> getAllReports() {
        return rd.getAllReports();
    }

    @Override
    public void deleteReport(String rid) {
        rd.deleteReport(rid);
    }

    @Override
    public Report getReportById(String rid) {
        return rd.getReportById(rid);
    }
    
}
