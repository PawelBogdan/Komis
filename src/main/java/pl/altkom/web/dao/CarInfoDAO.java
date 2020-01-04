package pl.altkom.web.dao;

import pl.altkom.web.CarBean;

import javax.sql.DataSource;

public interface CarInfoDAO {

	public void saveCarInfo(CarBean car, DataSource dataSource);
	CarBean findCarById(int id, DataSource dataSource);

}
