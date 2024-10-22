package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notesmaker;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int notesId=Integer.parseInt(request.getParameter("notes_id").trim());
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Notesmaker note =  (Notesmaker)s.get(Notesmaker.class, notesId);
			s.remove(note);
			tx.commit();
			s.close();
			response.sendRedirect("all_shownotes.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
