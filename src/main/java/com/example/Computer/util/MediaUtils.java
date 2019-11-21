package com.example.Computer.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

//파일업로드를 드로그앤드랍으로 만든다. 이때 이미지이면 썸네일을 만들고 아니면 그냥 올린다. 	
public class MediaUtils {
	private static Map<String,MediaType> mediaMap;

	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	public static MediaType getMediaType(String type) {  //이미지인지 아니면 다른것인지를 확인한다.
		return mediaMap.get(type.toUpperCase());
	}
}
