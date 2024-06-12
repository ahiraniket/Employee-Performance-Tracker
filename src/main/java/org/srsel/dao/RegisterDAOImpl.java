package org.srsel.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.srsel.model.LoginVO;
import org.srsel.model.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void registerUser(RegisterVO registerVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(registerVO);

	}

	@Override
	public void registerLogin(LoginVO loginVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(loginVO);
	}

}