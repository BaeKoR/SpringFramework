package mul.cam.a.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import mul.cam.a.service.PdsService;

public class DownloadView extends AbstractView{ // 추상 뷰 생성 (다운로드 기능 수행)
	@Autowired
	PdsService service;

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("DownloadView renderMergedOutputModel");
		
		File downloadFile =  (File)model.get("downloadFile");
		String filename = (String)model.get("filename");; // 원본 파일명
		int seq = (Integer)model.get("seq");
		
		response.setContentType(this.getContentType());
		response.setContentLength((int)downloadFile.length());
		
		// 이 설정은  한글명 파일의 경우 적용된다
		filename = URLEncoder.encode(filename, "utf-8");
		
		// 다운로드를 실제로 수행하는 코드
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";"); // 원본 파일 이름으로 다시 변경
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Length", "" + downloadFile.length()); // 내용의 길이
		response.setHeader("Pragma", "no-cache;");  // 임시 저장을 할 것인가? (no-cache: 안함)
		response.setHeader("Expires", "-1;"); // 기한 (-1: 기한이 필요없다)
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(downloadFile);
		
		// 실제 데이터를 기입
		FileCopyUtils.copy(fis, os);
		
		// download count 증가
		//service.downcount(seq);
		
		if (fis != null) {
			fis.close();
		}
	}
}

