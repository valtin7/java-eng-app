package jp.codecamp.english.bean;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class Word implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String word;
	private int level;
	private LocalDateTime insDate;
	private LocalDateTime updDate;
	private List<Description> descriptions;
	
	public Word() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public LocalDateTime getInsDate() {
		return insDate;
	}

	public void setInsDate(LocalDateTime insDate) {
		this.insDate = insDate;
	}

	public LocalDateTime getUpdDate() {
		return updDate;
	}

	public void setUpdDate(LocalDateTime updDate) {
		this.updDate = updDate;
	}

	public List<Description> getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(List<Description> descriptions) {
		this.descriptions = descriptions;
	}
	
	public void initDescriptions() {
		this.descriptions = new ArrayList<>();
	}
	
	public void addDescription(Description description) {
		this.descriptions.add(description);
	}
	
}
