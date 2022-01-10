package com.qst.itoffer.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

public class CookieEncryptTool {
    /**
     * Base64 加密
     * @param cleartext
     * @return
     */
    public static String encodeBase64(String cleartext) {
        Base64.Encoder baseen = Base64.getEncoder();
        try {
            cleartext = baseen.encodeToString(cleartext.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return cleartext;
    }

    /**
     * Base64 解密
     * @param ciphertext
     * @return
     */
    public static String decodeBase64(String ciphertext) {
        Base64.Decoder basede = Base64.getDecoder();
        try {
            ciphertext = new String(basede.decode(ciphertext), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return ciphertext;
    }
}
