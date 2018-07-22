/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import com.google.gson.*;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.io.IOUtils;


/**
 *
 * @author hasee
 */
public class Weather {
    static JsonParser parse =new JsonParser();  //创建json解析器
    public static void json() throws Exception {
        //参数url化
        String city = java.net.URLEncoder.encode("青岛", "utf-8");

        //拼地址
        String apiUrl = String.format("https://www.sojson.com/open/api/weather/json.shtml?city=%s", city);
        //开始请求
        URL url = new URL(apiUrl);
        URLConnection open = url.openConnection();
        InputStream input = open.getInputStream();
        //这里转换为String，带上包名，怕你们引错包
        String result = IOUtils.toString(input, "utf-8");
        
        JsonObject json=(JsonObject) parse.parse(result);
        System.out.println("date: "+ json.get("date").getAsString());
        JsonObject data = json.get("data").getAsJsonObject();
        JsonObject yesterday = data.get("yesterday").getAsJsonObject();
        System.out.println("yesterday sunrise "+yesterday.get("sunrise").getAsString());
        JsonArray forecast = data.get("forecast").getAsJsonArray();
        for(int i = 0; i < forecast.size(); i++){
            JsonObject today = forecast.get(i).getAsJsonObject();
            System.out.println("Date: "+today.get("date").getAsString()+", "+" Weather: "+today.get("type").getAsString()+", "+"Notice: "+today.get("notice").getAsString());
        }
        
        //输出
        System.out.println(result);
        
//        String path = "D:\\myapp\\DonkeyKong\\web\\resource\\weather.json";
//        File file = new File(path);
//        if(!file.getParentFile().exists()){
//            file.getParentFile().mkdirs();
//        }
//        try{
//            file.delete();
//            file.createNewFile();
//        }catch(IOException e){
//            e.printStackTrace();
//        }
//        try {
//            FileWriter fw = new FileWriter(file, true);
//            fw.write(result);
//            fw.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        
    }
    public static void main(String[] args) {
        try {
            json();
        } catch (Exception ex) {
            Logger.getLogger(Weather.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
