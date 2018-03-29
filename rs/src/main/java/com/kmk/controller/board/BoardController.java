package com.kmk.controller.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kmk.base.PaginationUtils;
import com.kmk.domain.Board;
import com.kmk.domain.Reply;
import com.kmk.domain.common.CommCode;
import com.kmk.domain.common.CommCodeSearch;
import com.kmk.domain.sample.SampleBoard;
import com.kmk.domain.user.LoginUser;
import com.kmk.service.BoardService;
import com.kmk.service.common.CommonService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin
@RequestMapping("board/")
@Controller
public class BoardController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    BoardService boardService;

    @Autowired
    CommonService commonService;

    @ModelAttribute("commCodeSearch")
    public CommCodeSearch getCommCodeSearch() {
        return new CommCodeSearch();
    }

    /**
     * 조회
     * 
     * @param model
     * @return
     */
    @RequestMapping("bizBoardList")
    public String bizBoardList(Board board, Model model) {

        logger.info(" @@@@@@@@@@@@@ boardList start @@@@@@@@@@@@@@@ ");
        logger.info(" @@@@@@@@@@@@@ boardList 공통분기처리::: 카데고리명 ::: " + board.getCategorynm());

        String returnPage = "";
        if (board.getCategorynm() != null) {
            switch (board.getCategorynm()) {
            /*********************
             * 업소정보 카테고리
             */
            case "CG0101":
                model.addAttribute("captionTitle", "오피스텔");
                board.setCategory("CG0101");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "CG0102":
                model.addAttribute("captionTitle", "건마");
                board.setCategory("CG0102");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "CG0103":
                model.addAttribute("captionTitle", "안마");
                board.setCategory("CG0103");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "CG0104":
                model.addAttribute("captionTitle", "유흥주점");
                board.setCategory("CG0104");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "CG0105":
                model.addAttribute("captionTitle", "휴게텔");
                board.setCategory("CG0105");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "CG0106":
                model.addAttribute("captionTitle", "립카페/핸플/키스");
                board.setCategory("CG0106");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            /*********************
             * 업소후기 카테고리
             */
            case "CG0201":
                model.addAttribute("captionTitle", "오피스텔 후기");
                board.setCategory("CG0201");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "CG0202":
                model.addAttribute("captionTitle", "건마 후기");
                board.setCategory("CG0202");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "CG0203":
                model.addAttribute("captionTitle", "안마방 후기");
                board.setCategory("CG0203");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "CG0204":
                model.addAttribute("captionTitle", "유흥주점 후기");
                board.setCategory("CG0204");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "CG0205":
                model.addAttribute("captionTitle", "휴게텔 후기");
                board.setCategory("CG0205");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "CG0206":
                model.addAttribute("captionTitle", "립카페/핸플/키스 후기");
                board.setCategory("CG0206");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            /*********************
             * 업소언니정보 카테고리
             */
            case "CG03":
                model.addAttribute("captionTitle", "업소언니정보");
                board.setCategory("CG03");
                returnPage = "board/bizWm/bizWmBoardList";
                break;

            /*********************
             * 파트너공유 카테고리
             */
            case "CG04":
                model.addAttribute("captionTitle", "파트너공유");
                board.setCategory("CG04");
                returnPage = "board/partnerShare/partnerShareBoardList";
                break;

            /*********************
             * 업체문의게시판 카테고리
             */
            case "CG05":
                model.addAttribute("captionTitle", "업체문의게시판");
                board.setCategory("CG05");
                returnPage = "board/bizQna/bizQnaBoardList";
                break;
            }
        } else {
            return "redirect:/";
        }

        CommCode commCode = new CommCode();
        CommCode commCode2 = new CommCode();
        commCode.setCd_grp("ZZ");
        commCode.setCd(null);
        
        commCode2.setCd_grp("AA");
        commCode2.setParent_cd(board.getArea_cd());
        
        log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");        
        log.debug("getArea_cd = " + board.getArea_cd());
        log.debug("getDtl_area_cd = " + board.getDtl_area_cd());        
        log.debug("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
        

        // List<CamelCaseMap> recvList = vocmService.findRecvList(vocmWebSearch);
        List<Board> list = new ArrayList<Board>();
        list = boardService.selectBoard(board);

        PaginationUtils.bindTotalRecordCount(board.getPagination(), list, "tot_cnt");
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getCurrentPageNo : {} ",
                board.getPagination().getCurrentPageNo());
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getPageSize : {} ", board.getPagination().getPageSize());
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getTotalRecordCount : {} ",
                board.getPagination().getTotalRecordCount());
        
        log.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        log.debug("commCode.getCd_grp = " + commCode.getCd_grp());
        log.debug("commCode.getCd_grp = " + commCode.getCd_grp_nm());
        log.debug("getArea_cd = " + board.getArea_cd());
        log.debug("getDtl_area_cd = " + board.getDtl_area_cd());        
        log.debug("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
        model.addAttribute("comboDtlAreaCdList", commonService.findComboAreaCdList(commCode2));
        model.addAttribute("list", list);
        model.addAttribute("board", board);

        return returnPage;
    }

    @RequestMapping("bizBoardDetail")
    public String bizBoardDetail(@RequestParam int seq, @RequestParam String categorynm,
            @RequestParam(defaultValue = "0") int success, Model model, HttpSession session) {

        logger.info(" @@@@@@@@@@@@@ boardDetail 공통분기처리::: 카데고리명 ::: " + categorynm);

        String returnPage = "";

        Board board = new Board();
        board.setCategorynm(categorynm);
        model.addAttribute("board", board);

        switch (categorynm) {

        /*********************
         * 업소정보 카테고리
         */
        case "CG0101":
            logger.info(" op return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0101");
            model.addAttribute("captionTitle", "오피스텔");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "CG0102":
            logger.info(" gunma return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0102");
            model.addAttribute("captionTitle", "건마");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "CG0103":
            logger.info(" anma return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0103");
            model.addAttribute("captionTitle", "안마");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "CG0104":
            logger.info(" play return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0104");
            model.addAttribute("captionTitle", "유흥주점");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "CG0105":
            logger.info(" tel return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0105");
            model.addAttribute("captionTitle", "휴게텔");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "CG0106":
            logger.info(" lib return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0106");
            model.addAttribute("captionTitle", "립카페/핸플/키스");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        /*********************
         * 업소후기 카테고리
         */
        case "CG0201":
            logger.info(" oph return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0201");
            model.addAttribute("captionTitle", "후기 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "CG0202":
            logger.info(" gunmah return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0202");
            model.addAttribute("captionTitle", "건마 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "CG0203":
            logger.info(" anmah return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0203");
            model.addAttribute("captionTitle", "안마 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "CG0204":
            logger.info(" playh return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0204");
            model.addAttribute("captionTitle", "유흥주점 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "CG0205":
            logger.info(" telh return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0205");
            model.addAttribute("captionTitle", "휴게텔 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "CG0206":
            logger.info(" libh return page setting " + categorynm);
            model.addAttribute("categorynm", "CG0206");
            model.addAttribute("captionTitle", "립카페/핸플/키스 후기");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        /*********************
         * 업소언니정보 카테고리
         */
        case "CG03":
            logger.info(" bizwm return page setting " + categorynm);
            model.addAttribute("categorynm", "CG03");
            model.addAttribute("captionTitle", "업소언니정보");
            returnPage = "board/bizWm/bizWmDetail";
            break;

        /*********************
         * 파트너공유 카테고리
         */
        case "CG04":
            logger.info(" partner return page setting " + categorynm);
            model.addAttribute("categorynm", "CG04");
            model.addAttribute("captionTitle", "파트너공");
            returnPage = "board/partnerShare/partnerShareBoardDetail";
            break;

        /*********************
         * 업체문의게시판 카테고리
         */
        case "CG05":
            logger.info(" bizqna return page setting " + categorynm);
            model.addAttribute("categorynm", "CG05");
            model.addAttribute("captionTitle", "업체문의게시판");
            returnPage = "board/bizQna/bizQnaBoardDetail";
            break;

        }

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

        logger.info(" @@@@@@@@@@@@@ boardDetail >>>>> loginUser @@@@@ " + loginUser.getUser_id());

        boardService.updateCnt(seq);

        model.addAttribute("list", boardService.selectDetailBoard(seq));
        model.addAttribute("replyList", boardService.selectReplyList(loginUser.getUser_id(), seq));
        model.addAttribute("success", success);

        return returnPage;
    }

    @RequestMapping("bizBoardDelete")
    public void bizBoardDelete(Board board, HttpServletResponse response, HttpSession session) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();
        PrintWriter out = response.getWriter();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        
        if(!loginUser.getUser_id().equals(board.getUser_id())) {
            out.println("<script>alert('잘못된 접근입니다.');location.href='" + return_url + "'; </script>");
            return;
        }
        
        boardService.delFlagUpadateBoard(board.getSeq());

        out.println("<script>alert('정상적으로 삭제 되었습니다.');location.href='" + return_url + "'; </script>");
        out.flush();

    }
    
    @RequestMapping("bizBoardModify")
    public String bizBoardModify(Board board, Model model, HttpServletResponse response, HttpSession session) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();
        PrintWriter out = response.getWriter();
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        
        if(!(loginUser.getUser_id().equals(board.getUser_id())||loginUser.getRole().equals("ROOT_ADMIN"))) {
            out.println("<script>alert('잘못된 접근입니다.');location.href='" + return_url + "'; </script>");
            out.flush();
            return "/";
        }
        
        
        CommCode commCode = new CommCode();
        commCode.setCd_grp("ZZ");
        commCode.setCd(null);
        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));

        String returnPage = "";

        switch (board.getCategorynm()) {

        /*********************
         * 업소정보 카테고리
         */
        case "CG0101":
            model.addAttribute("categorynm", "CG0101");
            model.addAttribute("captionTitle", "오피스텔");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "CG0102":
            model.addAttribute("categorynm", "CG0102");
            model.addAttribute("captionTitle", "건마");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "CG0103":
            model.addAttribute("categorynm", "CG0103");
            model.addAttribute("captionTitle", "안마");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "CG0104":
            model.addAttribute("categorynm", "CG0104");
            model.addAttribute("captionTitle", "유흥주점");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "CG0105":
            model.addAttribute("categorynm", "CG0105");
            model.addAttribute("captionTitle", "휴게텔");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "CG0106":
            model.addAttribute("categorynm", "CG0106");
            model.addAttribute("captionTitle", "립카페/핸플/키스");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        /*********************
         * 업소후기 카테고리
         */
        case "CG0201":
            model.addAttribute("categorynm", "CG0201");
            model.addAttribute("captionTitle", "후기 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "CG0202":
            model.addAttribute("categorynm", "CG0202");
            model.addAttribute("captionTitle", "건마 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "CG0203":
            model.addAttribute("categorynm", "CG0203");
            model.addAttribute("captionTitle", "안마 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "CG0204":
            model.addAttribute("categorynm", "CG0204");
            model.addAttribute("captionTitle", "유흥주점 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "CG0205":
            model.addAttribute("categorynm", "CG0205");
            model.addAttribute("captionTitle", "휴게텔 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "CG0206":
            model.addAttribute("categorynm", "CG0206");
            model.addAttribute("captionTitle", "립카페/핸플/키스 후기");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        /*********************
         * 업소언니정보 카테고리
         */
        case "CG03":
            model.addAttribute("categorynm", "CG03");
            model.addAttribute("captionTitle", "업소언니정보");
            returnPage = "board/bizWm/bizWmModify";
            break;

        /*********************
         * 파트너공유 카테고리
         */
        case "CG04":
            model.addAttribute("categorynm", "CG04");
            model.addAttribute("captionTitle", "파트너공유");
            returnPage = "board/partnerShare/partnerShareModify";
            break;

        /*********************
         * 업체문의게시판
         */
        case "CG05":
            model.addAttribute("categorynm", "CG05");
            model.addAttribute("captionTitle", "업체문의게시판");
            returnPage = "board/bizQna/bizQnaModify";
            break;
        }
        model.addAttribute("list", boardService.selectDetailBoard(board.getSeq()));
        model.addAttribute("board", board);
        return returnPage;
    }    
    
    @RequestMapping("bizBoardReplyReg")
    public String bizBoardReplyReg(Reply reply, RedirectAttributes redirectAttributes, Model model,
            HttpSession session) {

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        reply.setUser_id(loginUser.getUser_id());

        logger.info(" @@@@@@@@@@@@@ bizBoardReplyReg @@@@@@@@@@@@@@");

        redirectAttributes.addAttribute("success", boardService.bizBoardReplyReg(reply));
        redirectAttributes.addAttribute("seq", reply.getSeq());
        redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
        return "redirect:bizBoardDetail";

    }

    @RequestMapping(value = "delFalgUpadaeReply", method = RequestMethod.POST)
    public String delFalgUpadaeReply(Reply reply, RedirectAttributes redirectAttributes, HttpSession session) {

        logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ " + reply.toString());
        logger.debug("TestForm : {}", reply);

        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");

        logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.user_id  " + loginUser.getUser_id());
        logger.info(" @@@@@@@@@@@@@ deleteReply @@@@@ LoginUser.pwd  " + loginUser.getPwd());

        String replyUserId = boardService.selectReplyUserId(reply.getReply_seq());
        if (!replyUserId.equals(loginUser.getUser_id())) {
            redirectAttributes.addAttribute("seq", reply.getSeq());
            redirectAttributes.addAttribute("success", -99);
            redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
        } else {
            redirectAttributes.addAttribute("seq", reply.getSeq());
            redirectAttributes.addAttribute("success", boardService.delFlagUpadateReply(reply.getReply_seq())); // not
                                                                                                               // access
            redirectAttributes.addAttribute("categorynm", reply.getCategorynm());
        }

        return "redirect:bizBoardDetail";
    }
	
    // 업소정보
    @RequestMapping("bizBoardWrite")
    public String bizBoardWrite(Board board, Model model) {

        CommCode commCode = new CommCode();
        commCode.setCd_grp("ZZ");
        commCode.setCd(null);
        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));

        String returnPage = "";

        board.setCategorynm(board.getCategorynm());
        model.addAttribute("board", board);

        switch (board.getCategorynm()) {

        /*********************
         * 업소정보 카테고리
         */
        case "CG0101":
            model.addAttribute("categorynm", "CG0101");
            model.addAttribute("captionTitle", "오피스텔");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "CG0102":
            model.addAttribute("categorynm", "CG0102");
            model.addAttribute("captionTitle", "건마");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "CG0103":
            model.addAttribute("categorynm", "CG0103");
            model.addAttribute("captionTitle", "안마");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "CG0104":
            model.addAttribute("categorynm", "CG0104");
            model.addAttribute("captionTitle", "유흥주점");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "CG0105":
            model.addAttribute("categorynm", "CG0105");
            model.addAttribute("captionTitle", "휴게텔");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "CG0106":
            model.addAttribute("categorynm", "CG0106");
            model.addAttribute("captionTitle", "립카페/핸플/키스");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        /*********************
         * 업소후기 카테고리
         */
        case "CG0201":
            model.addAttribute("categorynm", "CG0201");
            model.addAttribute("captionTitle", "후기 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "CG0202":
            model.addAttribute("categorynm", "CG0202");
            model.addAttribute("captionTitle", "건마 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "CG0203":
            model.addAttribute("categorynm", "CG0203");
            model.addAttribute("captionTitle", "안마 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "CG0204":
            model.addAttribute("categorynm", "CG0204");
            model.addAttribute("captionTitle", "유흥주점 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "CG0205":
            model.addAttribute("categorynm", "CG0205");
            model.addAttribute("captionTitle", "휴게텔 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "CG0206":
            model.addAttribute("categorynm", "CG0206");
            model.addAttribute("captionTitle", "립카페/핸플/키스 후기");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        /*********************
         * 업소언니정보 카테고리
         */
        case "CG03":
            model.addAttribute("categorynm", "CG03");
            model.addAttribute("captionTitle", "업소언니정보");
            returnPage = "board/bizWm/bizWmWrite";
            break;

        /*********************
         * 파트너공유 카테고리
         */
        case "CG04":
            model.addAttribute("categorynm", "CG04");
            model.addAttribute("captionTitle", "파트너공유");
            returnPage = "board/partnerShare/partnerShareWrite";
            break;

        /*********************
         * �뾽泥대Ц�쓽寃뚯떆�뙋
         */
        case "CG05":
            model.addAttribute("categorynm", "CG05");
            model.addAttribute("captionTitle", "업체문의게시판");
            returnPage = "board/bizQna/bizQnaWrite";
            break;
        }

        model.addAttribute("board", board);
        return returnPage;
        // return "board/bizInfo/bizBoardWrite";
    }

    public  String[] convertHtmlimg(String contents) {
        Pattern p = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
        Matcher m = p.matcher(contents);
        String imgArrayUrl[] = new String[30];
        int count = 0;
        
        while (m.find()) {
        	logger.debug("::: get img src url Loop ::::" + m.group(1));
        	imgArrayUrl[count] = m.group(1);
        	count++;
        }
        
        return imgArrayUrl;
    }
    
    // 저장
    @RequestMapping("bizSaveBoard")
    public void bizSaveBoard(Board board, HttpSession session, HttpServletResponse response) throws IOException {
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        board.setBiz_nm(loginUser.getBiz_nm());     
        
        // img url setting
        // 이미지 태그 SRC 경로 추출
        String imgUrl[] = convertHtmlimg(board.getContent());
        
        if(imgUrl != null && imgUrl.length > 0) {
            board.setImg_url(imgUrl[0]);
            logger.debug("::: board.getImg_url() ::::" + board.getImg_url());
        }
        
        boardService.insertBoard(board);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();

        out.println("<script>alert('정상적으로 등록 되었습니다.');location.href='" + return_url + "'; </script>");
        out.flush();

    }

    // 수정
    @RequestMapping("bizSaveBoardModify")
    public void bizSaveBoardModify(Board board, HttpServletResponse response) throws IOException {
       
        // img url setting
        // 이미지 태그 SRC 경로 추출
        String imgUrl[] = convertHtmlimg(board.getContent());
        
        if(imgUrl != null && imgUrl.length > 0) {
            board.setImg_url(imgUrl[0]);
            logger.debug("::: board.getImg_url() ::::" + board.getImg_url());
        }

        	
    	boardService.updateBoard(board);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String return_url = "/board/bizBoardList?categorynm=" + board.getCategorynm();

        out.println("<script>alert('정상적으로 등록 되었습니다.');location.href='" + return_url + "'; </script>");
        out.flush();
    }
    

	@RequestMapping(value="findDtlArea", method=RequestMethod.POST)
	public ModelAndView findDtlArea(Board board, HttpSession session) 
	  throws Exception
	{
	    ModelAndView mav = new ModelAndView("jsonView");
	
	    CommCode commCode = new CommCode();        
	    commCode.setCd_grp("AA");
	    commCode.setParent_cd(board.getArea_cd());
	    
	    mav.addObject("result", commonService.findComboAreaCdList(commCode)); 
	    
	    return mav;
	}
    
    
}
