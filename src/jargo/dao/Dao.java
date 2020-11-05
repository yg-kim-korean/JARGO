package jargo.dao;


import java.util.List;

public interface Dao {
	public void insert(Object obj);
	public void delete(Object obj);
	public void update(Object obj);
	public Object select(Object obj);
	public Object selectByOwner(Object obj);
	public List<Object> selecSort();
	public List<Object> selecSort(Object obj);
	public List<Object> selectByStore(Object obj);
	public List<Object> selectAll();
	public List<Object> selectstoreseat(Object obj);
	public int seqmax();
}
