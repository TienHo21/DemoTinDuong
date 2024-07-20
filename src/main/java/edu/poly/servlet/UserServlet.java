package edu.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDao;
import edu.poly.model.User;

@WebServlet({ "/UserServlet", "/UserServlet/create", "/UserServlet/update", "/UserServlet/edit", "/UserServlet/delete",
		"/UserServlet/reset" })
public class UserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();

		User user = null;
		if (url.contains("delete")) {
			user = new User();
			request.setAttribute("user", user);
		} else if (url.contains("edit")) {
			edit(request, response);
		} else if (url.contains("reset")) {
			user = new User();
			request.setAttribute("user", user);
		}
		finAll(request, response);

		request.getRequestDispatcher("/user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getRequestURL().toString();

		if (url.contains("insert")) {
			insert(request, response);
		} else if (url.contains("delete")) {

		} else if (url.contains("update")) {

		}  else if (url.contains("reset")) {

		}
		finAll(request, response);
		request.getRequestDispatcher("/user.jsp").forward(request, response);
	}

	protected void insert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());

			UserDao dao = new UserDao();
			dao.insert(user);

			request.setAttribute("message", "User inserted!!!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
	
	
	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String userId = request.getParameter("userid");
			UserDao dao = new UserDao();
			User user = dao.findById(userId);
			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
	

	protected void finAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			UserDao dao = new UserDao();

			List<User> list = dao.findAll();

			request.setAttribute("user", list);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}

}
