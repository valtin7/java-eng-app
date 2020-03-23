package jp.codecamp.english.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.codecamp.english.bean.QuizResult;
import jp.codecamp.english.service.QuizResultsService;

/**
 * Servlet implementation class WordsTestResult
 */
@WebServlet("/WordsTestResult")
public class WordsTestResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuizResultsService service = new QuizResultsService();
		LocalDateTime to = LocalDateTime.now();
		
//		LocalDateTime from = LocalDateTime.of(to.getYear(), to.getMonthValue(), 1, 0, 0, 0);
		LocalDateTime from = to.minusMonths(1);
		
		List<QuizResult> resultList = service.findByLevel(1, from, to);
		
		request.setAttribute("resultList", resultList);
		request.setAttribute("title", "単語テスト結果");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/testResult.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
