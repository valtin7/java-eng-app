package jp.codecamp.english.bean;

import java.io.Serializable;
import java.time.LocalDateTime;

public class QuizResult implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private int type;
	private int level;
	private int total;
	private int correct;
	private int wrong;
	private LocalDateTime insDate;
	
	public QuizResult() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCorrect() {
		return correct;
	}

	public void setCorrect(int correct) {
		this.correct = correct;
	}

	public int getWrong() {
		return wrong;
	}

	public void setWrong(int wrong) {
		this.wrong = wrong;
	}

	public LocalDateTime getInsDate() {
		return insDate;
	}

	public void setInsDate(LocalDateTime insDate) {
		this.insDate = insDate;
	}
	
}
