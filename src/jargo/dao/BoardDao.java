package jargo.dao;

import jargo.vo.BoardVO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("BoardDao")
public class BoardDao implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Board.insertBoard", obj);
	}

	@Override
	public void delete(Object obj) {
		sql.delete("Board.deleteBoard", obj);
	}

	@Override
	public void update(Object obj) {
		sql.update("Board.updateBoard", obj);
	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Board.selectBoard", obj);
	}

	@Override
	public Object selectByOwner(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> selecSort() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> selecSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Board.selectBoards");
	}



	@Override
	public List<Object> selectstoreseat(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> selectByStore(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int seqmax() {
		// TODO Auto-generated method stub
		return 0;
	}

}
