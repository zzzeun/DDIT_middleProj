package kr.or.ddit.adm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.adm.service.IUsersService;
import kr.or.ddit.adm.service.UsersServiceImpl;
import kr.or.ddit.vo.UsersVO;


@WebServlet("/adm/admMain")
public class admMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IUsersService service = UsersServiceImpl.getInstance();
		List<UsersVO> usersList = service.getAllUsers();
		
		
		request.setAttribute("userList", usersList);

		request.getRequestDispatcher("/WEB-INF/view/adm/admMain.jsp")
		.forward(request, response);	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
