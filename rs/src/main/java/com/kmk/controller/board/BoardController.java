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
     * 議고쉶
     * 
     * @param model
     * @return
     */
    @RequestMapping("bizBoardList")
    public String bizBoardList(Board board, Model model) {

        logger.info(" @@@@@@@@@@@@@ boardList start @@@@@@@@@@@@@@@ ");
        logger.info(" @@@@@@@@@@@@@ boardList 怨듯넻遺꾧린泥섎━::: 移대뜲怨좊━紐� ::: " + board.getCategorynm());

        String returnPage = "";
        if (board.getCategorynm() != null) {
            switch (board.getCategorynm()) {
            /*********************
             * �뾽�냼�젙蹂� 移댄뀒怨좊━
             */
            case "op":
                model.addAttribute("captionTitle", "�삤�뵾�뒪�뀛");
                board.setCategory("CG0101");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "gunma":
                model.addAttribute("captionTitle", "嫄대쭏");
                board.setCategory("CG0102");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "anma":
                model.addAttribute("captionTitle", "�븞留�");
                board.setCategory("CG0103");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "play":
                model.addAttribute("captionTitle", "�쑀�씎二쇱젏");
                board.setCategory("CG0104");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "tel":
                model.addAttribute("captionTitle", "�쑕寃뚰뀛");
                board.setCategory("CG0105");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            case "lib":
                model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪");
                board.setCategory("CG0106");
                returnPage = "board/bizInfo/bizBoardList";
                break;

            /*********************
             * �뾽�냼�썑湲� 移댄뀒怨좊━
             */
            case "oph":
                model.addAttribute("captionTitle", "�삤�뵾�뒪�뀛 �썑湲�");
                board.setCategory("CG0201");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "gunmah":
                model.addAttribute("captionTitle", "嫄대쭏 �썑湲�");
                board.setCategory("CG0202");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "anmah":
                model.addAttribute("captionTitle", "�븞留덈갑 �썑湲�");
                board.setCategory("CG0203");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "playh":
                model.addAttribute("captionTitle", "�쑀�씎二쇱젏 �썑湲�");
                board.setCategory("CG0204");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "telh":
                model.addAttribute("captionTitle", "�쑕寃뚰뀛 �썑湲�");
                board.setCategory("CG0205");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            case "libh":
                model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪 �썑湲�");
                board.setCategory("CG0206");
                returnPage = "board/bizComment/bizCommentBoardList";
                break;

            /*********************
             * �뾽�냼�뼵�땲�젙蹂� 移댄뀒怨좊━
             */
            case "bizwm":
                model.addAttribute("captionTitle", "�뾽�냼�뼵�땲�젙蹂�");
                board.setCategory("CG03");
                returnPage = "board/bizWm/bizWmBoardList";
                break;

            /*********************
             * �뙆�듃�꼫怨듭쑀 移댄뀒怨좊━
             */
            case "partner":
                model.addAttribute("captionTitle", "�뙆�듃�꼫怨듭쑀");
                board.setCategory("CG04");
                returnPage = "board/partnerShare/partnerShareBoardList";
                break;

            /*********************
             * �뾽泥대Ц�쓽寃뚯떆�뙋 移댄뀒怨좊━
             */
            case "bizqna":
                model.addAttribute("captionTitle", "�뾽泥대Ц�쓽寃뚯떆�뙋");
                board.setCategory("CG05");
                returnPage = "board/bizQna/bizQnaBoardList";
                break;
            }
        } else {
            return "redirect:/";
        }

        CommCode commCode = new CommCode();
        commCode.setCd_grp("ZZ");
        commCode.setCd(null);

        // List<CamelCaseMap> recvList = vocmService.findRecvList(vocmWebSearch);
        List<Board> list = new ArrayList<Board>();
        list = boardService.selectBoard(board);

        PaginationUtils.bindTotalRecordCount(board.getPagination(), list, "tot_cnt");
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getCurrentPageNo : {} ",
                board.getPagination().getCurrentPageNo());
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getPageSize : {} ", board.getPagination().getPageSize());
        logger.info(" @@@@@@@@@@@@@ board.getPagination(): getTotalRecordCount : {} ",
                board.getPagination().getTotalRecordCount());

        model.addAttribute("comboAreaCdList", commonService.findComboAreaCdList(commCode));
        model.addAttribute("list", list);
        model.addAttribute("board", board);

        return returnPage;
    }

    @RequestMapping("bizBoardDetail")
    public String bizBoardDetail(@RequestParam int seq, @RequestParam String categorynm,
            @RequestParam(defaultValue = "0") int success, Model model, HttpSession session) {

        logger.info(" @@@@@@@@@@@@@ boardDetail 怨듯넻遺꾧린泥섎━::: 移대뜲怨좊━紐� ::: " + categorynm);

        String returnPage = "";

        Board board = new Board();
        board.setCategorynm(categorynm);
        model.addAttribute("board", board);

        switch (categorynm) {

        /*********************
         * �뾽�냼�젙蹂� 移댄뀒怨좊━
         */
        case "op":
            logger.info(" op return page setting " + categorynm);
            model.addAttribute("categorynm", "op");
            model.addAttribute("captionTitle", "�삤�뵾�뒪�뀛");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "gunma":
            logger.info(" gunma return page setting " + categorynm);
            model.addAttribute("categorynm", "gunma");
            model.addAttribute("captionTitle", "嫄대쭏");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "anma":
            logger.info(" anma return page setting " + categorynm);
            model.addAttribute("categorynm", "anma");
            model.addAttribute("captionTitle", "�븞留�");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "play":
            logger.info(" play return page setting " + categorynm);
            model.addAttribute("categorynm", "play");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "tel":
            logger.info(" tel return page setting " + categorynm);
            model.addAttribute("categorynm", "tel");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        case "lib":
            logger.info(" lib return page setting " + categorynm);
            model.addAttribute("categorynm", "lib");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪");
            returnPage = "board/bizInfo/bizBoardDetail";
            break;

        /*********************
         * �뾽�냼�썑湲� 移댄뀒怨좊━
         */
        case "oph":
            logger.info(" oph return page setting " + categorynm);
            model.addAttribute("categorynm", "oph");
            model.addAttribute("captionTitle", "�썑湲� �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "gunmah":
            logger.info(" gunmah return page setting " + categorynm);
            model.addAttribute("categorynm", "gunmah");
            model.addAttribute("captionTitle", "嫄대쭏 �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "anmah":
            logger.info(" anmah return page setting " + categorynm);
            model.addAttribute("categorynm", "anmah");
            model.addAttribute("captionTitle", "�븞留� �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "playh":
            logger.info(" playh return page setting " + categorynm);
            model.addAttribute("categorynm", "playh");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏 �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "telh":
            logger.info(" telh return page setting " + categorynm);
            model.addAttribute("categorynm", "telh");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛 �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        case "libh":
            logger.info(" libh return page setting " + categorynm);
            model.addAttribute("categorynm", "libh");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪 �썑湲�");
            returnPage = "board/bizComment/bizCommentBoardDetail";
            break;

        /*********************
         * �뾽�냼�뼵�땲�젙蹂� 移댄뀒怨좊━
         */
        case "bizwm":
            logger.info(" bizwm return page setting " + categorynm);
            model.addAttribute("categorynm", "bizwm");
            model.addAttribute("captionTitle", "�뾽�냼�뼵�땲�젙蹂�");
            returnPage = "board/bizWm/bizWmDetail";
            break;

        /*********************
         * �뙆�듃�꼫怨듭쑀 移댄뀒怨좊━
         */
        case "partner":
            logger.info(" partner return page setting " + categorynm);
            model.addAttribute("categorynm", "partner");
            model.addAttribute("captionTitle", "�뾽�냼�뼵�땲�젙蹂�");
            returnPage = "board/partnerShare/partnerShareBoardDetail";
            break;

        /*********************
         * �뾽�냼�뼵�땲�젙蹂� 移댄뀒怨좊━
         */
        case "bizqna":
            logger.info(" bizqna return page setting " + categorynm);
            model.addAttribute("categorynm", "bizqna");
            model.addAttribute("captionTitle", "�뾽泥대Ц�쓽寃뚯떆�뙋");
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
            out.println("<script>alert('�옒紐삳맂 �젒洹쇱엯�땲�떎.');location.href='" + return_url + "'; </script>");
            return;
        }
        
        boardService.delFlagUpadateBoard(board.getSeq());

        out.println("<script>alert('�젙�긽�쟻�쑝濡� �궘�젣 �릺�뿀�뒿�땲�떎.');location.href='" + return_url + "'; </script>");
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
            out.println("<script>alert('�옒紐삳맂 �젒洹쇱엯�땲�떎.');location.href='" + return_url + "'; </script>");
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
         * �뾽�냼�젙蹂� 移댄뀒怨좊━
         */
        case "op":
            model.addAttribute("categorynm", "op");
            model.addAttribute("captionTitle", "�삤�뵾�뒪�뀛");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "gunma":
            model.addAttribute("categorynm", "gunma");
            model.addAttribute("captionTitle", "嫄대쭏");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "anma":
            model.addAttribute("categorynm", "anma");
            model.addAttribute("captionTitle", "�븞留�");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "play":
            model.addAttribute("categorynm", "play");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "tel":
            model.addAttribute("categorynm", "tel");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        case "lib":
            model.addAttribute("categorynm", "lib");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪");
            returnPage = "board/bizInfo/bizBoardModify";
            break;

        /*********************
         * �뾽�냼�썑湲� 移댄뀒怨좊━
         */
        case "oph":
            model.addAttribute("categorynm", "oph");
            model.addAttribute("captionTitle", "�썑湲� �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "gunmah":
            model.addAttribute("categorynm", "gunmah");
            model.addAttribute("captionTitle", "嫄대쭏 �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "anmah":
            model.addAttribute("categorynm", "anmah");
            model.addAttribute("captionTitle", "�븞留� �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "playh":
            model.addAttribute("categorynm", "playh");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏 �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "telh":
            model.addAttribute("categorynm", "telh");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛 �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        case "libh":
            model.addAttribute("categorynm", "libh");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪 �썑湲�");
            returnPage = "board/bizComment/bizCommentModify";
            break;

        /*********************
         * �뾽�냼�뼵�땲�젙蹂� 移댄뀒怨좊━
         */
        case "bizwm":
            model.addAttribute("categorynm", "bizwm");
            model.addAttribute("captionTitle", "�뾽�냼�뼵�땲�젙蹂�");
            returnPage = "board/bizWm/bizWmModify";
            break;

        /*********************
         * �뙆�듃�꼫怨듭쑀 移댄뀒怨좊━
         */
        case "partner":
            model.addAttribute("categorynm", "partner");
            model.addAttribute("captionTitle", "�뙆�듃�꼫怨듭쑀");
            returnPage = "board/partnerShare/partnerShareModify";
            break;

        /*********************
         * �뾽泥대Ц�쓽寃뚯떆�뙋
         */
        case "bizqna":
            model.addAttribute("categorynm", "bizqna");
            model.addAttribute("captionTitle", "�뾽泥대Ц�쓽寃뚯떆�뙋");
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
	
    // �뾽�냼�젙蹂�
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
         * �뾽�냼�젙蹂� 移댄뀒怨좊━
         */
        case "op":
            model.addAttribute("categorynm", "op");
            model.addAttribute("captionTitle", "�삤�뵾�뒪�뀛");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "gunma":
            model.addAttribute("categorynm", "gunma");
            model.addAttribute("captionTitle", "嫄대쭏");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "anma":
            model.addAttribute("categorynm", "anma");
            model.addAttribute("captionTitle", "�븞留�");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "play":
            model.addAttribute("categorynm", "play");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "tel":
            model.addAttribute("categorynm", "tel");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        case "lib":
            model.addAttribute("categorynm", "lib");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪");
            returnPage = "board/bizInfo/bizBoardWrite";
            break;

        /*********************
         * �뾽�냼�썑湲� 移댄뀒怨좊━
         */
        case "oph":
            model.addAttribute("categorynm", "oph");
            model.addAttribute("captionTitle", "�썑湲� �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "gunmah":
            model.addAttribute("categorynm", "gunmah");
            model.addAttribute("captionTitle", "嫄대쭏 �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "anmah":
            model.addAttribute("categorynm", "anmah");
            model.addAttribute("captionTitle", "�븞留� �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "playh":
            model.addAttribute("categorynm", "playh");
            model.addAttribute("captionTitle", "�쑀�씎二쇱젏 �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "telh":
            model.addAttribute("categorynm", "telh");
            model.addAttribute("captionTitle", "�쑕寃뚰뀛 �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        case "libh":
            model.addAttribute("categorynm", "libh");
            model.addAttribute("captionTitle", "由쎌뭅�럹/�빖�뵆/�궎�뒪 �썑湲�");
            returnPage = "board/bizComment/bizCommentWrite";
            break;

        /*********************
         * �뾽�냼�뼵�땲�젙蹂� 移댄뀒怨좊━
         */
        case "bizwm":
            model.addAttribute("categorynm", "bizwm");
            model.addAttribute("captionTitle", "�뾽�냼�뼵�땲�젙蹂�");
            returnPage = "board/bizWm/bizWmWrite";
            break;

        /*********************
         * �뙆�듃�꼫怨듭쑀 移댄뀒怨좊━
         */
        case "partner":
            model.addAttribute("categorynm", "partner");
            model.addAttribute("captionTitle", "�뙆�듃�꼫怨듭쑀");
            returnPage = "board/partnerShare/partnerShareWrite";
            break;

        /*********************
         * �뾽泥대Ц�쓽寃뚯떆�뙋
         */
        case "bizqna":
            model.addAttribute("categorynm", "bizqna");
            model.addAttribute("captionTitle", "�뾽泥대Ц�쓽寃뚯떆�뙋");
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
    
    // ���옣
    @RequestMapping("bizSaveBoard")
    public void bizSaveBoard(Board board, HttpSession session, HttpServletResponse response) throws IOException {
        LoginUser loginUser = (LoginUser) session.getAttribute("loginUser");
        board.setBiz_nm(loginUser.getBiz_nm());     
        
        // img url setting
        // �씠誘몄� �깭洹� SRC 寃쎈줈 異붿텧
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

        out.println("<script>alert('�젙�긽�쟻�쑝濡� �벑濡� �릺�뿀�뒿�땲�떎.');location.href='" + return_url + "'; </script>");
        out.flush();

    }

    // �닔�젙
    @RequestMapping("bizSaveBoardModify")
    public void bizSaveBoardModify(Board board, HttpServletResponse response) throws IOException {
       
        // img url setting
        // �씠誘몄� �깭洹� SRC 寃쎈줈 異붿텧
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

        out.println("<script>alert('�젙�긽�쟻�쑝濡� �벑濡� �릺�뿀�뒿�땲�떎.');location.href='" + return_url + "'; </script>");
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
