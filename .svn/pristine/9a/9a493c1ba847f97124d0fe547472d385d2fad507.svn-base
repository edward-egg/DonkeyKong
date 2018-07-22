/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.binary.Base64;

/**
 *
 * @author Jason
 */
public class DataUtils {
    //用于将iso编码方式，转成UTF-8格式
    public static String translate(String data) throws UnsupportedEncodingException{
         return (new String(data.getBytes("iso8859-1"),"utf-8"));
    }
    
    //用于图片重命名，转存
    public static String reloadImg(String source, String path){
        String type = source.substring(source.lastIndexOf('.')+1);
        String name = IDUtils.getUUID()+"."+type;
        try {
            File origin = new File(source);
            File img = new File(path+name);
            if(!img.exists())
                img.createNewFile();
            FileInputStream input = new FileInputStream(origin);
            FileOutputStream output = new FileOutputStream(img);
            byte[] buf = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buf)) != -1) {
                output.write(buf, 0, bytesRead);
            }
           
        } catch (IOException ex) {
            Logger.getLogger(DataUtils.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return name;
    }

    public static String saveImg(String source, String path) {           
        String type = source.substring(source.indexOf('/')+1,source.indexOf(';'));
        String name = IDUtils.getUUID()+"."+type;
        try {
            System.out.println("==========="+source.substring(23));
            System.out.println(path+name);
            byte[] buf;
            buf = Base64.decodeBase64(source.substring(source.indexOf(',')+1));
            File img = new File(path+name);
            if(!img.exists())
                img.createNewFile();
            OutputStream out = new FileOutputStream(img.getPath());  
            out.write(buf);  
            out.flush();  
            out.close();  
        } catch (IOException ex) {
            Logger.getLogger(DataUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }

    public static void deleteImg(String path) {
        File file = new File(path);
        if(file.exists())
            file.delete();
    }
}
