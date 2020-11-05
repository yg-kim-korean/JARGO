package jargo.biz;

import jargo.dao.Dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("TimeBiz")
public class TimeBiz implements Biz {
	@Autowired
	@Qualifier("TimeDao")
	
	Dao dao;
	
	@Override
	public void register(Object obj) {
	dao.insert(obj);
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Object obj) {
		dao.delete(obj);
		
		// TODO Auto-generated method stub

		
	}

	@Override
	public void modify(Object obj) {
		dao.update(obj);
		// TODO Auto-generated method stub

	}

	@Override
	public Object get(Object obj) {
		
		// TODO Auto-generated method stub
		return dao.select(obj);
		}

	@Override
	public Object getByOwner(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Object> getAll() {
		// TODO Auto-generated method stub
		return (ArrayList<Object>)dao.selectAll();
	}

	@Override
	public ArrayList<Object> getSeatlist(Object obj) {
		// TODO Auto-generated method stub
		return (ArrayList<Object>) dao.selectstoreseat(obj);
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