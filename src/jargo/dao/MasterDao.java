package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("MasterDao")
public class MasterDao implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Master.insertMaster", obj);

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Master.deleteMaster", obj);

	}

	@Override
	public void update(Object obj) {
		sql.update("Master.updateMaster", obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Master.selectMaster", obj);
		
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Master.selectMasters");
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
