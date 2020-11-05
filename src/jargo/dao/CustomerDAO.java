package jargo.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;


@Repository("CustomerDAO")
public class CustomerDAO implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Customer.insertCustomer",obj);

	}

	/* (non-Javadoc)
	 * @see jargo.dao.Dao#delete(java.lang.Object)
	 */
	@Override
	public void delete(Object obj) {
		sql.delete("Customer.deleteCustomer", obj);

	}

	/* (non-Javadoc)
	 * @see jargo.dao.Dao#update(java.lang.Object)
	 */
	@Override
	public void update(Object obj) {
		sql.update("Customer.updateCustomer", obj);

	}

	/* (non-Javadoc)
	 * @see jargo.dao.Dao#select(java.lang.Object)
	 */
	@Override
	public Object select(Object obj) {
		// TODO Auto-generated method stub
		return  sql.queryForObject("Customer.selectCustomer",obj);
	}

	/* (non-Javadoc)
	 * @see jargo.dao.Dao#selectAll()
	 */
	@Override
	public ArrayList<Object> selectAll() {
		// TODO Auto-generated method stub
		return  (ArrayList<Object>) sql.queryForList("Customer.selectCustomers");
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
