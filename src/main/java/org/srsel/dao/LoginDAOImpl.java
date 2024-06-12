package org.srsel.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import java.util.*;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.srsel.model.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public LoginVO getByUsername(String userName) {
		Session session = this.sessionFactory.openSession();
		Query q = session.createQuery("from LoginVO WHERE username='" + userName + "'");
		List ls = q.list();

		return (LoginVO) ls.get(0);
	}

}
