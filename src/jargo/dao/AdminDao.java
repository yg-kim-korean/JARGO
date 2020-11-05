
package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("AdminDao")
public class AdminDao implements Dao {
	
	@Autowired
	SqlMapClientTemplate sql;

	@Override
	public void insert(Object obj) {
		sql.insert("Admin.insertAdmin", obj);

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Admin.deleteAdmin", obj);

	}

	@Override
	public void update(Object obj) {
		sql.update("Admin.updateAdmin", obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Admin.selectAdmin", obj);
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Admin.selectAdmins");
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
