package kr.challenge.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.category.dao.CategoryDAO;
import kr.category.vo.CategoryVO;
import kr.challenge.dao.ChallengeDAO;
import kr.challenge.dao.ChallengeLikeDAO;
import kr.challenge.vo.ChallengeLikeVO;
import kr.challenge.vo.ChallengeVO;
import kr.controller.Action;
import kr.util.PagingUtil;

public class ChallengeListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Long us_num = (Long)session.getAttribute("us_num");
		
		if(us_num == null) {
			return "redirect:/xuser/registerXuserForm.do";
		}
		
		String category = request.getParameter("category");
		String pageNum = request.getParameter("pageNum");
		
		if(pageNum==null)pageNum="1";
		
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		
		System.out.println("1. category: " + category);
		System.out.println("2. keyfield: " + keyfield);
		System.out.println("3. keyword: " + keyword);
		ChallengeDAO chall_dao = ChallengeDAO.getInstance();
		List<ChallengeVO> chall_list = null;
		
		int count = category == null ? chall_dao.getListCount(keyfield, keyword, null) : chall_dao.getListCount(keyfield, keyword, category);
		
		PagingUtil page = new PagingUtil(keyfield, keyword, Integer.parseInt(pageNum),count,15,10,"challengeList.do");
		
		
		
		ChallengeLikeDAO like_dao = ChallengeLikeDAO.getInstance();
		List<ChallengeLikeVO> like_list = like_dao.checkLike();
		
		
		if(count > 0) {
			if(category == null || category.equals("0")) {
				chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, "0");
			}
			else {
				chall_list = chall_dao.getList(page.getStartRow(), page.getEndRow(), keyfield, keyword, category);
				
				int cat_num = Integer.parseInt(category);
				
				CategoryDAO cat_dao = CategoryDAO.getInstance();
				CategoryVO cat_vo = cat_dao.getDetail(cat_num);
				String cat_name = cat_vo.getCate_name();
				
				request.setAttribute("cat_name", cat_name);
			}
		}
		
		for(ChallengeVO vo : chall_list) {
			for(ChallengeLikeVO vo2 : like_list){
				if(vo2.getCh_num() == vo.getCh_num() && vo2.getUs_num() == us_num) {
					vo.setHeart_status(true);
				}
			}
		}
		
		request.setAttribute("count", count);
		request.setAttribute("like_list", like_list);
		request.setAttribute("chall_list", chall_list);
		request.setAttribute("page", page.getPage());
		return "/challenge/challenge_list.jsp";
	}

}