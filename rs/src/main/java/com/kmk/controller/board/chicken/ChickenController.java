package com.kmk.controller.board.chicken;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kmk.domain.SampleBoard;
import com.kmk.domain.Test;
import com.kmk.service.board.chicken.ChickenService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@CrossOrigin
@RequestMapping("board/chicken/")
@Controller
public class ChickenController {
	@Autowired ChickenService chickenService;
	
	@RequestMapping("list")
	public String list(Model model) {
		Test test = new Test();
		test.setName("testName");
		
//		log.info("test : {}", chickenService.getList());
		
		model.addAttribute("list", chickenService.getList());
	    model.addAttribute("classActiveSettings","active");
	    return "board/chicken/list";
	}
	
	@RequestMapping("sampleList")
	public String sampleList(Model model) {
		SampleBoard sampleBoard = new SampleBoard();
		
		model.addAttribute("list", chickenService.selectSampleBoard());
		model.addAttribute("classActiveSettings","샘플 게시판");
		return "board/chicken/list";
	}
	
	@RequestMapping("sample_w_index")
	public String sample_w_index(Model model) {
		return "page/test/index";
	}
	
	@RequestMapping("sample_write_insert")
	//public String sample_write_insert(@ModelAttribute("SampleBoard") SampleBoard sampleBoard) {
	public String sample_write_insert(SampleBoard sampleBoard) {
		chickenService.insertBoard(sampleBoard);
		return "redirect:sampleList";
	}
    
	@RequestMapping("/file_uploader_html5")
	public void file_uploader_html5(HttpServletRequest request, HttpServletResponse response){
		try {
			 //한글
			 String sFileInfo = "";
			 //���ϸ��� �޴´� - �Ϲ� �������ϸ�
			 String filename = request.getHeader("file-name");
			 //���� Ȯ����
			 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
			 //Ȯ���ڸ��ҹ��ڷ� ����
			 filename_ext = filename_ext.toLowerCase();
			 	
			 //�̹��� ���� �迭����
			 String[] allow_file = {"jpg","png","bmp","gif"};

			 //�����鼭 Ȯ���ڰ� �̹������� 
			 int cnt = 0;
			 for(int i=0; i<allow_file.length; i++) {
			 	if(filename_ext.equals(allow_file[i])){
			 		cnt++;
			 	}
			 }

			 //�̹����� �ƴ�
			 if(cnt == 0) {
				 PrintWriter print = response.getWriter();
				 print.print("NOTALLOW_"+filename);
				 print.flush();
				 print.close();
			 } else {
			 //�̹����̹Ƿ� �ű� ���Ϸ� ���丮 ���� �� ���ε�	
			 //���� �⺻���
			 String dftFilePath = request.getSession().getServletContext().getRealPath("/");
			 //���� �⺻��� _ �󼼰��
			 String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
			 File file = new File(filePath);
			 if(!file.exists()) {
			 	file.mkdirs();
			 }
			 String realFileNm = "";
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			 String today= formatter.format(new java.util.Date());
			 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
			 String rlFileNm = filePath + realFileNm;
			 ///////////////// ������ ���Ͼ��� ///////////////// 
			 InputStream is = request.getInputStream();
			 OutputStream os=new FileOutputStream(rlFileNm);
			 int numRead;
			 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
			 //byte b[] = request.getHeader("file-bin-file").getBytes("UTF-8");
			 
			//(assuming you have a ResultSet named RS)
//			 String fileBinFile = request.getHeader("file-bin-file").getBytes("UTF-8");
//			 //Blob blob = blob.getBinaryStream(0.0,Long.parseLong((fileBinFile)));
//			 Blob blob = blob.getBinaryStream(Long.parseLong((fileBinFile)),Long.parseLong((fileBinFile)));
//
//			 int blobLength = (int) blob.length();   
//			 byte b[]  = blob.getBytes(1, blobLength);

			 
			 
			 /*
			 while((numRead = is.read(b,0,b.length)) != -1){
			 //while((numRead = is.read()) != -1){
			 	os.write(b,0,numRead);
			 }
			 
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 */
			 
			 int len = 0;
			 
			 while(len != -1){
				len = is.read(b, 0, b.length);
			 }
			 
			 os.write(b);
			 
			 if(is != null) {
			 	is.close();
			 }
			 os.flush();
			 os.close();
			 
			 
			 ///////////////// ������ ���Ͼ��� /////////////////

			 // ���� ���
			 sFileInfo += "&bNewLine=true";
			 // img �±��� title �Ӽ��� �������ϸ����� ��������ֱ� ����
			 sFileInfo += "&sFileName="+ filename;;
			 sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm;
			 PrintWriter print = response.getWriter();
			 print.print(sFileInfo);
			 print.flush();
			 print.close();
			 }	
		} catch (Exception e) {
			e.printStackTrace();
		}
 }
	

}
