package com.khie.music;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

@Service //스프링에서 비지니스 로직을 수행할 때 붙이는 애노테이션
// 해당 Upload 하는 클래스는 비지니스 로직을 수행하는 클래스
public class Upload {
	
	private MultipartHttpServletRequest mRequest;
	
	public boolean UploadAudio(String file) {
		
		boolean isUpload = false;
		
		//각자 프로젝트에 맞게 경로 지정해주세요!
		String uploadPath = "D:\\ncs\\workspace(spring)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\final\\resources\\audio\\";
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH + 1);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		
		MultipartFile mfile =  mRequest.getFile(file);
		
		// 업로드한 파일의 이름을 구하는 메서드
		String orginfileName = mfile.getOriginalFilename();
		
		//폴더 만들기
		String dir = uploadPath+year+"-"+month+"-"+day;
		
		File daydir = new File(dir);
		
		if(!daydir.exists()) {
			daydir.mkdirs();
		}
		
		if(file != null) {
			file = System.currentTimeMillis() + "_" + file ;
			
			try {
				File origin = new File(dir+"\\"+file);
				
				// transferTo() : 파일 데이터를 지정한 폴더로 실제 저장시키는 메서드
				mfile.transferTo(origin);
				
				isUpload = true;
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
			
		return isUpload;
	}

}
