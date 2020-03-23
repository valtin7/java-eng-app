package jp.codecamp.english.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import jp.codecamp.english.bean.Description;
import jp.codecamp.english.bean.PartOfSpeech;
import jp.codecamp.english.bean.Word;

public class WordsDAOImpl implements EnglishAppDAO<Word> {
	
	private ResourceBundle resource;
	
	public WordsDAOImpl() {
		
		this.resource = ResourceBundle.getBundle("config");
		
	}
	
	public List<Word> findWords(int level) {
		
		List<Word> wordList = new ArrayList<>();
		
		try (Connection con = DriverManager.getConnection(this.resource.getString("jdbc.url"), this.resource.getString("db.user"), this.resource.getString("db.pass"))) {
			String sql = "SELECT w.id, w.word, w.level, d.id as d_id, d.description, p.id as p_id, p.name " +
						"FROM words as w " +
					    "JOIN descriptions as d ON w.id = d.word_id " +
					    "JOIN part_of_speech as p ON d.part_of_speech = p.id " +
					    "WHERE w.level = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, level);
			System.out.println(pstmt.toString());
			ResultSet rs = pstmt.executeQuery();
			int id = 0;
//			List<Description> dList = null;
			while (rs.next()) {
				Description description = new Description();
				description.setId(rs.getInt("d_id"));
				description.setWordId(rs.getInt("id"));
				description.setDescription(rs.getString("description"));
				PartOfSpeech pos = new PartOfSpeech();
				pos.setId(rs.getInt("p_id"));
				pos.setName(rs.getString("name"));
				description.setPartOfSpeech(pos);
				if (rs.getInt("id") != id) {
					Word word = new Word();
					word.initDescriptions();
					word.setId(rs.getInt("id"));
					word.setWord(rs.getString("word"));
					word.setLevel(rs.getInt("level"));
//					dList = new ArrayList<>();
//					dList.add(description);
					word.addDescription(description);
					wordList.add(word);
					id = word.getId();
				} else {
					final int wordId = id;
					List<Word> resultList = wordList.stream().filter(w -> w.getId() == wordId).collect(Collectors.toList());
					if (resultList.size() == 1) {
						resultList.get(0).addDescription(description);
					}
				}
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return wordList;
		
	}

	@Override
	public List<Word> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Word findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Word t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Word t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Word t) {
		// TODO Auto-generated method stub
		
	}
	
}
