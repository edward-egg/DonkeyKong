/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Jason
 */
public class DateUtils {

    //生成当前时间的时间戳
    public static Timestamp getTimestamp() {
        return new Timestamp(new Date().getTime());
    }
    
    

    public static Date StringToDate(String str) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.parse(str);
    }
    public static Timestamp StringToTimestamp(String str) throws ParseException {
        Timestamp ts = new Timestamp(System.currentTimeMillis());  
        try {  
            ts = Timestamp.valueOf(str);  
            System.out.println(ts);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return ts;
    }

    public static int dayToDay(Date d1, Date d2) {
        int day=0;
        try {
            long diff = d1.getTime() - d2.getTime();//这样得到的差值是微秒级别  
             day= (int) (diff / (1000 * 60 * 60 * 24));

            int hours = (int) ((diff - day * (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            int minutes = (int) ((diff - day * (1000 * 60 * 60 * 24) - hours * (1000 * 60 * 60)) / (1000 * 60));
            
        } catch (Exception e) {
            System.out.println("daytoday error: "+e);
        }
        return day;
    }
}
