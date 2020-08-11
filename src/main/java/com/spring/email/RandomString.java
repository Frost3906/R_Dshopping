package com.spring.email;

import java.security.SecureRandom;

public class RandomString {
	private static SecureRandom random = new SecureRandom();

	/** 랜덤 문자열을 생성한다 **/
    public static String generate(String DATA, int length) {
        if (length < 1) throw new IllegalArgumentException("length must be a positive number.");
        StringBuilder sb = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            sb.append( DATA.charAt(
            		random.nextInt(DATA.length())
            		));
        }
        return sb.toString();
    }
}
