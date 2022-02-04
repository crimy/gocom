package com.gocom.Util;

public class ImageUtil {
	public static String path() {
		String t = System.getProperty("os.name");
		String upload = "/pukyung05/upload/";
		if( t.indexOf("indows") != -1 ) {
			upload = "views/upload";
		}
		return upload;
	}
}
