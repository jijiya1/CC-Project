package com.kh.jhj.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import com.kh.jhj.domain.DoFileDto;

public class Do_UploadUtil {
	final static String SEP = File.separator;
	

	public static DoFileDto do_Upload(String uploadPath,  String fileName, byte[] fileData)
							throws Exception{
//		System.out.println("uploadPath : 얍! " + uploadPath);
		UUID uuid = UUID.randomUUID();
		String newName = uuid +"_" + fileName;	
		String dirPath = calPath(uploadPath);
		
		
		//파일 업로드
		String path = dirPath + SEP +newName;	
		File ff = new File(path);
		
		FileCopyUtils.copy(fileData, ff);
		
		String formatName = isFormat(fileName);
		String thumbPath = "";
		//이미지 파일 썸네일 생성
		if(formatName != null) {
			String thumbAddPath = dirPath + SEP +"thubm";
			File thf = new File(thumbAddPath);
			if(!thf.exists()) {
				thf.mkdirs();
			}
			
			 thumbPath =  thumbAddPath + SEP +newName;
			
			BufferedImage srcImg = ImageIO.read(ff);
			BufferedImage adjImage = Scalr.resize(srcImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,280);
			
			File thumbF = new File(thumbPath);
			ImageIO.write(adjImage, formatName, thumbF);
			
		}
		
		String updatePath = path.replace("\\","/");
		
		DoFileDto fileDto = new DoFileDto();
		fileDto.setF_name(fileName);
		fileDto.setF_path(updatePath);
		return fileDto;
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
	
	public static String calPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
			String year = "" + cal.get(Calendar.YEAR);
			String month = "" + (cal.get(Calendar.MONTH)+1);
			String date = "" + cal.get(Calendar.DATE);
		String datePath = year + SEP + month +SEP + date;
		String dirPath = uploadPath + SEP + datePath;
		
		File f = new File(dirPath);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		
		
		return dirPath;
	}
}
