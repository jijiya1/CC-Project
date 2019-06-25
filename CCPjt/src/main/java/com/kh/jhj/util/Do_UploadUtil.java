package com.kh.jhj.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class Do_UploadUtil {
	final static String sep = File.separator;

	public static String do_Upload(String uploadPath, String fileName, byte[] fileData)
							throws Exception{
		
		UUID uuid = UUID.randomUUID();
		
		String datePath = calPath();	
		
		//파일 업로드
		String path = uploadPath + sep + datePath + sep +uuid + "_" + fileName;	
		File ff = new File(path);
		FileCopyUtils.copy(fileData, ff);
		
		String formatName = isFormat(fileName);
		//이미지 파일 썸네일 생성
		if(formatName != null) {
			String thumbAddPath = sep +"thubm"+sep;
			String thumbPath = uploadPath +sep+ datePath + thumbAddPath+uuid+"_" +fileName;
			
			BufferedImage srcImg = ImageIO.read(ff);
			BufferedImage adjImage = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,280);
			
			File thumbF = new File(thumbPath);
			ImageIO.write(adjImage, formatName, thumbF);
			
		}
		
		return null;
	}
	
	public static String isFormat(String fileName) {
		int lastDot = fileName.lastIndexOf(".");
		String formatN = fileName.substring(lastDot+1);
		
		String[] imgFormat = {"JPG","PNG","GIF"};
		for(String aa : imgFormat) {
			if(formatN.toUpperCase().equals(aa)) {
				return formatN;
			}
		}
		return null;
	}
	
	public static String calPath() {
		Calendar cal = Calendar.getInstance();
			String year = "" + cal.get(Calendar.YEAR);
			String month = "" + cal.get(Calendar.MONTH)+1;
			String date = "" + cal.get(Calendar.DATE);
		String datePath = year + sep + month +sep + date;
		
		return datePath;
	}
}
