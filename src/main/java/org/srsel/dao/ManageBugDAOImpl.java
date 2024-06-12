package org.srsel.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.srsel.model.ManageBugVO;

@Repository
public class ManageBugDAOImpl implements ManageBugDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public List viewBugs() {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from ManageBugVO where enabled=true");
		List viewBugsList = q.list();
		return viewBugsList;

	}

	@Override
	public void deleteBugs(ManageBugVO manageBugVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(manageBugVO);
	}

	@Override
	public List editBugs(ManageBugVO manageBugVO) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from ManageBugVO where bugId=" + manageBugVO.getBugId() + " and enabled=true");
		List viewBugsList = q.list();
		return viewBugsList;
	}

	@Override
	public void insertBugs(ManageBugVO manageBugVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(manageBugVO);

	}

	@Override
	public List getBugByLoginId(int loginId) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from ManageBugVO where loginVO.id=" + loginId + " and enabled=true");
		List viewBugsList = q.list();
		return viewBugsList;
	}
}
