package jargo.biz;

import jargo.dao.Dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("StoreBiz")
public class StoreBiz implements Biz {

	@Autowired
	
	@Qualifier("StoreDao")
	Dao dao;
	
	@Override
	public void register(Object obj) {
		System.out.println("storebiz0");
		dao.insert(obj);
		System.out.println("storebiz01111");
	}

	@Override
	public void remove(Object obj) {
		dao.delete(obj);
	}

	@Override
	public void modify(Object obj) {
		dao.update(obj);
	}

	@Override
	public Object get(Object obj) {
		return dao.select(obj);
	}

	@Override
	public ArrayList<Object> getAll() {
		return (ArrayList<Object>)dao.selectAll();
	}

	@Override
	public ArrayList<Object> getSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getByOwner(Object obj) {
		return dao.selectByOwner(obj);
	}

	@Override
	public ArrayList<Object> getSeatlist(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getByStore(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int maxseq() {
		// TODO Auto-generated method stub
		return 0;
	}

}
