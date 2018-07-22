package util;

import java.util.UUID;

/**
 *
 * @author Jason
 */
public class IDUtils {
    //生成32位唯一序列（UUID）
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
    
    //生成随机6位字符（用于验证码生成）
    public static String getRandomCode() {
        return getUUID().substring(0, 6).toUpperCase();
    }
}
