
package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("CouponDao")
public class CouponDao implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Coupon.insertCoupon", obj);
	}

	@Override
	public void delete(Object obj) {
		sql.delete("Coupon.deleteCoupon",obj);
	}

	@Override
	public void update(Object obj) {
		sql.update("Coupon.updateCoupon", obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Coupon.selectCoupon",obj);
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Coupon.selectCoupons");
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
	public List<Object> selectByStore(Object obj) {
		return sql.queryForList("Coupon.selectCouponByStore",obj); 
	}



	@Override
	public List<Object> selectstoreseat(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int seqmax() {
		// TODO Auto-generated method stub
		return 0;
	}


}
