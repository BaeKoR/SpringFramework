package mul.cam.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import mul.cam.a.dto.PdsDto;
import mul.cam.a.service.PdsService;
import mul.cam.a.util.PdsUtil;

@Controller
public class PdsController {
	@Autowired
	PdsService service;
	
	@RequestMapping(value = "pdslist.do", method = RequestMethod.GET)
	public String pdslist(Model model) {
		List<PdsDto> list = service.pdslist();
		
		model.addAttribute("pdslist", list);
		
		return "pdslist";
	}
	
	@GetMapping(value = "pdswrite.do")
	public String pdswrite() {
		return "pdswrite";
	}
	
	@PostMapping(value = "pdsupload.do")
	public String pdsupload(PdsDto dto, @RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) { // HttpServletRequest는 업로드 경로를 수정하기 위해 사용 됨
		// filename 취득
		String filename = fileload.getOriginalFilename(); // 원본의 파일명
		
		dto.setFilename(filename);
		
		// upload의 경로 설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더 (client)
		//String fupload = "c:\\temp";
		
		System.out.println("fupload: " + fupload);
		
		// 파일명을 충돌하지 않는 이름(Date)으로 변경
		String newfilename = PdsUtil.getNewFileName(filename);
		
		dto.setNewfilename(newfilename); // 변경된 파일명
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			// 실제 파일 생성 + 기입 = 업로드
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			service.uploadPds(dto);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/pdslist.do";
	}
	
	@PostMapping(value = "filedownLoad.do")
	public String filedownLoad(int seq, String filename, String newfilename, Model model, HttpServletRequest req) {
		// 경로 취득
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
				
		// 폴더 (client)
		//String fupload = "c:\\temp";
		
		// 다운로드 받을 파일
		File downloadFile = new File(fupload + "/" + newfilename);
		
		model.addAttribute("downloadFile", downloadFile); // (file) 실제 업로드 되어있는 파일명 23643623.txt
		model.addAttribute("filename", filename); // (String) 원래 파일명 abc.txt
		model.addAttribute("seq", seq); // (int) download 카운트를 증가
		
		return "downloadView"; // file-context로 이동 후 DownloadView.java로 이동
	}
	
	@GetMapping(value = "pdsdetail.do")
	public String pdsdetail(int seq, Model model) {
		PdsDto pds = service.getPds(seq);
		
		model.addAttribute("pds", pds);
		
		return "pdsdetail";
	}
	
	@GetMapping(value = "pdsupdate.do")
	public String pdsupdate(int seq, Model model) {
		PdsDto pds = service.getPds(seq);
		
		model.addAttribute("pds", pds);
		
		return "pdsupdate";
	}
	
	@PostMapping(value = "pdsupdateAf.do")
	public String pdsupdateAf(PdsDto dto, @RequestParam(value = "fileload", required = false) MultipartFile fileload, HttpServletRequest req) {
		String originalFileName = fileload.getOriginalFilename();
		System.out.println("check");
		if (originalFileName != null && !originalFileName.equals("")) { // 파일이 변경됨
			String newfilename = PdsUtil.getNewFileName(originalFileName);
			
			dto.setFilename(originalFileName);
			dto.setNewfilename(newfilename);
			
			String fupload = req.getServletContext().getRealPath("/upload");
			File file = new File(fupload + "/" + newfilename);
			
			try {
				// 새로운 파일로 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// db 갱신
				service.updatePds(dto);
			}
			catch (IOException e) {
				e.printStackTrace();
			}
		}
		else { // 파일이 변경되지 않음
			service.updatePds(dto);
		}
		
		return "redirect:/pdsdetail.do?seq=" + dto.getSeq();
	}
	
	@GetMapping(value = "pdsdelete.do")
	public String pdsdelete(int seq) {
		service.deletePds(seq);
		
		return "redirect:/pdslist.do";
	}
}





























