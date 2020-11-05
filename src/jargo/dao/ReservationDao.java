package jargo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

@Repository("ReservationDao")
public class ReservationDao implements Dao {

	@Autowired
	SqlMapClientTemplate sql;
	
	@Override
	public void insert(Object obj) {
		sql.insert("Reservation.insertReservation", obj);

	}

	@Override
	public void delete(Object obj) {
		sql.delete("Reservation.deleteReservation",obj);
	}

	@Override
	public void update(Object obj) {
		sql.update("Reservation.updateReservation", obj);
	}

	@Override
	public Object select(Object obj) {
		return sql.queryForObject("Reservation.reservationlist",obj);
	}

	@Override
	public List<Object> selectAll() {
		return sql.queryForList("Reservation.selectReservations");
	}

	@Override
	public List<Object> selecSort(Object obj) {
		return sql.queryForList("Reservation.selectReservationbycustomer_id",obj);
	}

	@Override
	public Object selectByOwner(Object obj) {
		return sql.queryForObject("Reservation.Myreservationlist",obj);
	}

	@Override
	public List<Object> selecSort() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Object> selectstoreseat(Object obj) {
		// TODO Auto-generated method stub
		return sql.queryForList("Reservation.selectReservationbystore_number",obj);
	}

	@Override
	public List<Object> selectByStore(Object obj) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int seqmax() {
		// TODO Auto-generated method stub
		return (int) sql.queryForObject("Reservation.selectReservationSeq");
	}

}
