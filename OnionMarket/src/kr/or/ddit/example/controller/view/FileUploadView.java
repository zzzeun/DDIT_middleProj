package kr.or.ddit.example.controller.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.util.ResponseUtil;


@WebServlet("/fileUploadView")
public class FileUploadView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher(ResponseUtil.viewOut("/example/fileUploadView", request)).forward(request, response);
	}
}