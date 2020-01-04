package pl.altkom.web.dao;

import pl.altkom.web.CarBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class CarInfoDAOImpl implements CarInfoDAO {

	public void saveCarInfo(CarBean car, DataSource dataSource) {
		
		try {
	
	        Connection conn = null;
        
	        try {
		        conn = dataSource.getConnection();
	
		        PreparedStatement pstmt = conn.prepareStatement(
		        "INSERT INTO pojazd(id,marka,typ,rok,przebieg,pojemnosc) VALUES (?,?,?,?,?,?)");
		
		        pstmt.setInt(1, generateId());
		        pstmt.setString(2, car.getMake());
		        pstmt.setString(3, car.getType());
		        pstmt.setInt(4, car.getYear());
		        pstmt.setString(5, car.getDistance());
		        pstmt.setString(6, car.getCapacity());
		        
		        pstmt.executeUpdate();
		        pstmt.close();
	        } finally {
	        	if (conn != null) {
	        		conn.close();
	        	}
	        }
		} catch (Exception e ) {
        	System.out.println("Błąd przy zapisie danych: " + e);
        }
	}

	@Override
	public CarBean findCarById(int id, DataSource dataSource) {
		try {

			Connection conn = null;

			try {
				conn = dataSource.getConnection();
				PreparedStatement psmtm = conn.prepareStatement("SELECT * from pojazd where id = ?");
				psmtm.setInt(1, id);

				ResultSet rs = psmtm.executeQuery();
				if (rs.next()) {
					CarBean carBean = new CarBean();
					carBean.setId(rs.getInt(1));
					carBean.setMake(rs.getString(2));
					carBean.setType(rs.getString(3));
					carBean.setYear(rs.getInt(4));
					carBean.setDistance(rs.getString(5));
					carBean.setCapacity(rs.getString(6));
					return carBean;
				} else {
					return null;
				}

				// TODO: pozamykac statement i result set

//				PreparedStatement pstmt = conn.prepareStatement(
//						"INSERT INTO pojazd(id,marka,typ,rok,przebieg,pojemnosc) VALUES (?,?,?,?,?,?)");
//
//				pstmt.setInt(1, generateId());
//				pstmt.setString(2, car.getMake());
//				pstmt.setString(3, car.getType());
//				pstmt.setInt(4, car.getYear());
//				pstmt.setString(5, car.getDistance());
//				pstmt.setString(6, car.getCapacity());
//
//				pstmt.executeUpdate();
//				pstmt.close();
			} finally {
				if (conn != null) {
					conn.close();
				}
			}
		} catch (Exception e ) {
			System.out.println("Błąd przy zapisie danych: " + e);
		}
		return null;
	}

	private int generateId() {
		return ((int) (System.currentTimeMillis() % 100000)) + 100000;
	}
}