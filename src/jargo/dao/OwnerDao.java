package jargo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("OwnerDao")
public class OwnerDao implements Dao {

	
	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Owner.insertOwner",obj);
	}

	@Override
	public void delete(Object obj) {
		sql.delete("Owner.deleteOwner",obj);
	}

	@Override
	public void update(Object obj) {
		sql.update("Owner.updateOwner",obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Owner.selectOwner",obj);
	}

	@Override
	public ArrayList<Object> selectAll() {
		return (ArrayList<Object>) sql.queryForList("Owner.selectOwners");
	}

	@Override
	public List<Object> selecSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
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
