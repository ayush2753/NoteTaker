package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notesmaker;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UpdateServlet
 */
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String title =request.getParameter("title");
			String content=request.getParameter("content");
			int notesid=Integer.parseInt(request.getParameter("notesid").trim());
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx= s.beginTransaction();
			
			Notesmaker notes = s.get(Notesmaker.class, notesid);
			notes.setTitle(title);
			notes.setContent(content);
			notes.setAddedDate(new Date());
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_shownotes.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
