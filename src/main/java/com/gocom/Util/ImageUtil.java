package com.gocom.Util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class ImageUtil {
	public static String path() {
		String t = System.getProperty("os.name");
		String upload = "/pukyung05/tomcat/webapps/gocom/resources/upload/";
		if( t.indexOf("indows") != -1 ) {
			upload = "C:/Users/tmddn/git/gocom/gocom/src/main/webapp/resources/images";
		}
		return upload;
	}
	
	public static String createFsn(MultipartFile file) throws Exception {
		String ofn = file.getOriginalFilename();
		UUID uuid = UUID.randomUUID();
		String fsn = uuid.toString();
		File saveFile = new File( path() , fsn + "_" + ofn );
		try {
			if(file.getSize() != 0) {
            if(!saveFile.exists()) {
                if(saveFile.getParentFile().mkdir()) {
                    saveFile.createNewFile();
                }
            }
            file.transferTo(new File( path() , fsn + "_" + ofn ));
			}
		} catch( Exception e ) {
			e.printStackTrace();
		}
		

		return fsn + "_" + ofn;
	}
}
