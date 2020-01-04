package pl.altkom.web.servlets;

import pl.altkom.web.CarBean;
import pl.altkom.web.dao.CarInfoDAO;
import pl.altkom.web.dao.CarInfoDAOImpl;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(urlPatterns = "/find_car_by_id")
public class FindCarById extends HttpServlet {

    @Resource(name = "jdbc:komis")
    private DataSource dataSource;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int carId = Integer.parseInt(req.getParameter("car_id"));
        CarInfoDAO carDao = new CarInfoDAOImpl();
        CarBean car = carDao.findCarById(carId, dataSource);
        req.getSession().setAttribute("autko", car);
        req.getRequestDispatcher("carInfoForm.jsp").forward(req, resp);

    }
}
