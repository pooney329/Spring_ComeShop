package com.example.Computer.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	private static final Logger logger =LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		//uuid 발급
		UUID uid = UUID.randomUUID();
		//uuid를 추가한 파일 이름
		String  savedName = uid.toString()+"_"+originalName;
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath);  //날짜별 디렉토리를 만든다
		File target = new File(uploadPath + savedPath, savedName);
		//임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사 , 파일을 업로드하면 서버의 임시디렉토리 에 파일이 올라간다, 하지만 우리가 원하는 디렉토리에 해야하니깐 파일카피한다. 
		FileCopyUtils.copy(fileData, target);
		//파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		String uploadedFileName = null;
		//이미지 파일은 썸네일 생성
		if(MediaUtils.getMediaType(formatName)!=null) {
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath,savedPath,savedName);
		} else { //이미지 파일이 아니면 아이콘 생성 
			uploadedFileName = makeIcon(uploadPath, savedPath ,savedName);
		}
		 return uploadedFileName;
		
	}
	private static String makeIcon(String uploadPath,String path, String fileName) throws Exception{
		//아이콘의 이름 
		String iconName = uploadPath +path +File.separator+fileName;
		//아이콘의 이름을 리턴 
		//File.separator : 디렉토리 구분자
		// 윈도우 \,  유닉스(리눅스) / 
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	//pom.xml에서 imgscalr 라이브러리 사용 
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		//이미지를 읽기 위한 버퍼 
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+path,fileName));
		//100픽셀 단위의 썸네일 생성 
		
		//썸네일의 이름
		String thumbnailName = uploadPath +path+ File.separator+"s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		System.out.println("여기여기여기여기여기여기여기여기"+thumbnailName);
		//썸네일 생성
		ImageIO.write(sourceImg, formatName.toUpperCase(),newFile);
		//썸네일의 이름을 리턴함 
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal =Calendar.getInstance();
		String yearPath = File.separator+cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH+1));
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		//디렉토리 생성
		makeDir(uploadPath,yearPath,monthPath,datePath);
		logger.info(datePath);
		return datePath;
	}
	// ...가변 사이즈 매개변수     ======  매개변수의 수가 다른데 paths에 배열형식으로 들어간다 
	private static void makeDir(String uploadPath ,String... paths) {
		//디렉토리가 존재하면 통과 
		if( new File(paths[paths.length-1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath +path);
			if(!dirPath.exists()) {//디렉토리가 존재하지 않으면
				dirPath.mkdir(); //디렉토리 생성
				
			}
		}
	}
	
}
