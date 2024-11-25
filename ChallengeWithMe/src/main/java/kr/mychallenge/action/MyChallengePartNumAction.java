package kr.mychallenge.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.mychallenge.dao.MyChallengeDAO;

public class MyChallengePartNumAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
	    HttpSession session = request.getSession();
	    
	  

	    Long us_num = (Long)session.getAttribute("us_num");

	    if (us_num == null) {
	        // 로그인 되지 않은 경우
	        return "redirect:/xuser/registerXuserForm.do";
	    }

	    // 로그인 된 경우
	    MyChallengeDAO dao = MyChallengeDAO.getInstance();

	    // 회원번호별 챌린지 참여 개수 정보
	    Long partNum = dao.participateNum(us_num); // participateNum 호출
	    System.out.println("partNum : " + partNum);

	    request.setAttribute("partNum", partNum);
	    
	    
	    
	    return "mychallenge/myChallengeMain.jsp";
	}

}
