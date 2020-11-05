package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("SeatDao")
public class SeatDao implements Dao {
	
	@Autowired
	SqlMapClientTemplate sql;

	@Override
	public void insert(Object obj) {
		sql.insert("Seat.insertSeat", obj);

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Seat.deleteSeat", obj);

	}

	@Override
	public void update(Object obj) {
		sql.update("Seat.updateSeat", obj);

	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Seat.selectSeat", obj);
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Seat.selectSeats");
	}

	@Override
	public List<Object> selecSort(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object selectByOwner(Object obj) {
		// TODO Auto-generated method stubselectSeatforlocation
		return sql.queryForObject("Seat.selectSeatforlocation", obj);
	}

	@Override
	public List<Object> selecSort() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Object> selectstoreseat(Object obj) {
		return sql.queryForList("Seat.selectStoreSeat",obj);
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
