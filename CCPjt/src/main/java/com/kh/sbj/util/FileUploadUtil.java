package com.kh.sbj.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;

public class FileUploadUtil {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		UUID uuid = UUID.randomUUID();
		
		String uuidName = uuid + "_" + originalName;
		System.out.println("uuidName = "+ uuidName);
		String datePath = calcPath(uploadPath); 
		System.out.println("datePath:" + datePath);
		// -> 2019/5/17
		String filePath = uploadPath + File.separator + datePath + File.separator + uuidName;
		System.out.println("filePath:" + filePath);
		// -> H:/upload/2019/5/17/fb94d409-77e4-4ed1-a6b1-24253ffcf3c6_Chrysanthemum.jpg
		
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		return datePath + File.separator + uuidName;
	}
	
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = "" + cal.get(Calendar.YEAR); // 2019
		String monthPath = yearPath + File.separator + (cal.get(Calendar.MONTH) + 1); // /2019/
		String datePath = monthPath + File.separator + cal.get(Calendar.DATE);
		// -> 2019/5/17
		
		String dirPath = uploadPath + File.separator + datePath;
		File f = new File(dirPath);
		// -> H:/upload/2019/5/19
		// 해당 경로가 존재하지 않는다면
		if (!f.exists()) {
			f.mkdirs();
		}
		return datePath; // 2019/5/17
	}
	
	public static String getFormatName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String formatName = fileName.substring(dotIndex+1);
		return formatName;
	}
}
