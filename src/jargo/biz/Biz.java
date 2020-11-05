package jargo.biz;

import java.util.ArrayList;

public interface Biz {
	public void register(Object obj);
	public void remove(Object obj);
	public void modify(Object obj);
	public Object get(Object obj);
	public Object getByOwner(Object obj);
	public ArrayList<Object> getSort(Object obj);
	public ArrayList<Object> getByStore(Object obj);
	public ArrayList<Object> getAll();
	public ArrayList<Object> getSeatlist(Object obj);
	public int maxseq();
	
}
