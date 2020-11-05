package jargo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("MenuDao")
public class MenuDao implements Dao {
	
	@Autowired
	SqlMapClientTemplate sql;

	@Override
	public void insert(Object obj) {
		sql.insert("Menu.insertMenu",obj);

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Menu.deleteMenu",obj);

	}

	@Override
	public void update(Object obj) {
		sql.update("Menu.updateMenu",obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Menu.selectMenu",obj);
	}


	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Menu.selectMenus");
	}

	@Override
	public List<Object> selecSort(Object obj) {
		return sql.queryForList("Menu.selectSorts",obj);
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
