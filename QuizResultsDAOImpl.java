package jp.codecamp.english.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.stream.Collectors;

import jp.codecamp.english.bean.Description;
import jp.codecamp.english.bean.PartOfSpeech;
import jp.codecamp.english.bean.QuizResult;
import jp.codecamp.english.bean.Word;

public class QuizResultsDAOImpl implements EnglishAppDAO<QuizResult> {

	private ResourceBundle resource;

	public QuizResultsDAOImpl() {

		this.resource = ResourceBundle.getBundle("config");

	}

	public List<QuizResult> findByLevel(int level, LocalDateTime from, LocalDateTime to) {
		List<QuizResult> resultList = new ArrayList<>();

		try (Connection con = DriverManager.getConnection(this.resource.getString("jdbc.url"),
				this.resource.getString("db.user"), this.resource.getString("db.pass"))) {
			String sql = "SELECT id, type, level, total, correct, wrong, ins_date FROM quiz_results WHERE level = ? AND (ins_date >= ? AND ins_date <= ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setTimestamp(2, Timestamp.valueOf(from));
			pstmt.setTimestamp(3,  Timestamp.valueOf(to));
			System.out.println(pstmt.toString());
			ResultSet rs = pstmt.executeQuery();
			// List<Description> dList = null;
			while (rs.next()) {
				QuizResult result = new QuizResult();
				result.setId(rs.getInt("id"));
				result.setType(rs.getInt("type"));
				result.setLevel(rs.getInt("level"));
				result.setTotal(rs.getInt("total"));
				result.setCorrect(rs.getInt("correct"));
				result.setWrong(rs.getInt("wrong"));
				result.setInsDate(rs.getTimestamp("ins_date").toLocalDateTime());
				resultList.add(result);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultList;
	}

	@Override
	public List<QuizResult> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QuizResult findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(QuizResult t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(QuizResult t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(QuizResult t) {
		// TODO Auto-generated method stub

	}

}
