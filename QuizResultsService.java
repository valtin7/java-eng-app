package jp.codecamp.english.service;

import java.time.LocalDateTime;
import java.util.List;

import jp.codecamp.english.bean.QuizResult;
import jp.codecamp.english.dao.QuizResultsDAOImpl;

public class QuizResultsService {
	
	private QuizResultsDAOImpl dao;
	
	public QuizResultsService() {
		this.dao = new QuizResultsDAOImpl();
	}
	
	public void insert(QuizResult qr) {
		this.dao.insert(qr);
	}
	
	public List<QuizResult> findByLevel(int level, LocalDateTime from , LocalDateTime to) {
		return this.dao.findByLevel(level, from, to);
	}

}
