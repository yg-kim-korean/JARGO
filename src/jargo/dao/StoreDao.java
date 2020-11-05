package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("StoreDao")
public class StoreDao implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		System.out.println("storedao0");
		sql.insert("Store.insertStore",obj);
		System.out.println("storedao111110");

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Store.deleteStore",obj);
	}

	@Override
	public void update(Object obj) {
		sql.update("Store.updateStore",obj);
	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Store.selectStore",obj);
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Store.selectStores");
	}

	@Override
	public List<Object> selecSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object selectByOwner(Object obj) {
		return sql.queryForObject("Store.selectStoreByOwner",obj);
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
