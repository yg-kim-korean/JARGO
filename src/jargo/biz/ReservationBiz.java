package jargo.biz;

import jargo.dao.Dao;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("ReservationBiz")
public class ReservationBiz implements Biz {

	@Autowired
	@Qualifier("ReservationDao")
	Dao dao;
	
	@Override
	public void register(Object obj) {
		dao.insert(obj);
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
		return (ArrayList<Object>) dao.selectAll();
	}

	@Override
	public ArrayList<Object> getSort(Object obj) {
		// TODO Auto-generated method stub
		return (ArrayList<Object>) dao.selecSort(obj);
	}

	@Override
	public Object getByOwner(Object obj) {
		// TODO Auto-generated method stub
		return dao.selectByOwner(obj);
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
		return dao.seqmax();
	}

}
