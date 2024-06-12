package org.srsel.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.srsel.model.ManageEffortVO;

@Repository
public class ManageEffortDAOImpl implements ManageEffortDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List viewEfforts() {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from ManageEffortVO where enabled=true");
		List viewEffortsList = q.list();
		return viewEffortsList;

	}

	@Override
	public void deleteEfforts(ManageEffortVO manageEffortVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(manageEffortVO);
	}

	@Override
	public List editEfforts(ManageEffortVO manageEffortVO) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery(
				"from ManageEffortVO where effortId=" + manageEffortVO.getEffortId() + " and enabled=true");
		List viewEffortsList = q.list();
		return viewEffortsList;
	}
	@Override
	public boolean approveEffort(ManageEffortVO manageEffortVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(manageEffortVO);
		return true;
	}

	@Override
	public void insertEfforts(ManageEffortVO manageEffortVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(manageEffortVO);

	}

	@Override
	public List getEffortByLoginId(int loginId) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from ManageEffortVO where loginVO.id=" + loginId + " and enabled=true");
		List viewEffortsList = q.list();
		return viewEffortsList;
	}

}
