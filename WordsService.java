package jp.codecamp.english.service;

import java.util.List;

import jp.codecamp.english.bean.Word;
import jp.codecamp.english.dao.WordsDAOImpl;

public class WordsService {
	
	private WordsDAOImpl dao;
	
	public WordsService() {
		this.dao = new WordsDAOImpl();
	}
	
	public List<Word> findAll() {
		return this.dao.findAll();
	}
	
	public List<Word> findWords(int level) {
		return this.dao.findWords(level);
	}
	
	

}
