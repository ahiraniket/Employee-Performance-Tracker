package org.srsel.dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.srsel.model.LoginVO;

@Repository
public class IndexDAOImpl implements IndexDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List totalEfforts() {

		Session session = this.sessionFactory.openSession();
		Query q = session
				.createQuery("SELECT COUNT(*) FROM ManageEffortVO WHERE enabled=true and effortStatus='APPROVED'");
		List totalEffort = q.list();
		return totalEffort;
	}

	@Override
	public List totalBugs() {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("SELECT COUNT(*) FROM ManageBugVO WHERE enabled=true");
		List totalCategoryList = q.list();
		return totalCategoryList;
	}

	@Override
	public List userEfforts(LoginVO loginVO) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(
				"SELECT COUNT(*) FROM ManageEffortVO where enabled=true and effortStatus='APPROVED' and loginVO.id="
						+ loginVO.getId());
		List userEffortsList = q.list();
		return userEffortsList;
	}

	@Override
	public List userBugs(LoginVO loginVO) {
		Session session = this.sessionFactory.openSession();
		Query q = session
				.createQuery("SELECT COUNT(*) FROM ManageBugVO where enabled=true and loginVO.id=" + loginVO.getId());
		List userBugsList = q.list();
		return userBugsList;
	}

	@Override
	public List userHours(LoginVO loginVO) {
		Session session = this.sessionFactory.openSession();
		Query qHours = session.createQuery(
				"SELECT SUM(effortTimeHours) FROM ManageEffortVO where enabled=true and effortStatus='approved' and loginVO.id="
						+ loginVO.getId());
		List qHoursVal = qHours.list();
		Query qMinutes = session.createQuery(
				"SELECT SUM(effortTimeMinutes) FROM ManageEffortVO where enabled=true and effortStatus='approved' and loginVO.id="
						+ loginVO.getId());
		List qMinutesVal = qMinutes.list();
		List userHoursList = new ArrayList<Integer>();
		userHoursList.add(qHoursVal.get(0));
		userHoursList.add(qMinutesVal.get(0));
		return userHoursList;
	}

	@Override
	public List totalHours() {
		Session session = this.sessionFactory.openSession();
		Query qHours = session.createQuery(
				"SELECT SUM(effortTimeHours) FROM ManageEffortVO where enabled=true and effortStatus='approved'");
		List qHoursVal = qHours.list();
		Query qMinutes = session.createQuery(
				"SELECT SUM(effortTimeMinutes) FROM ManageEffortVO where enabled=true and effortStatus='approved'");
		List qMinutesVal = qMinutes.list();
		List totalHoursList = new ArrayList<Integer>();
		totalHoursList.add(qHoursVal.get(0));
		totalHoursList.add(qMinutesVal.get(0));
		return totalHoursList;
	}

}
