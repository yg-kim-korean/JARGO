package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
@Repository("TimeDao")
public class TimeDao implements Dao {
@Autowired
SqlMapClientTemplate sql;
	@Override
	public void insert(Object obj) {
		sql.insert("Time.insertTime", obj);
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Time.deleteTime", obj);
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Object obj) {
		sql.update("Time.updateTime", obj);
		// TODO Auto-generated method stub

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Time.selectTime", obj);
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
		// TODO Auto-generated method stub
		return sql.queryForList("Time.selectTimes");
	}

	@Override
	public List<Object> selectstoreseat(Object obj) {
		// TODO Auto-generated method stub
		return sql.queryForList("Time.selectstoreseat",obj);
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
