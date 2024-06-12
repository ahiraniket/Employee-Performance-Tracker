package org.srsel.dao;

import org.hibernate.Session;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.srsel.model.ForgotPasswordVO;
import org.srsel.model.LoginVO;

@Repository
public class ForgotPasswordDAOImpl implements ForgotPasswordDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void insertUser(ForgotPasswordVO forgotPasswordVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(forgotPasswordVO);
	}

	@Override
	public List verifyToken(String token) {
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("from ForgotPasswordVO where token='"+token+"' AND status=false");
		List forgotPasswordList=q.list();
		
		return forgotPasswordList;
	}

	@Override
	public void updatePassword(LoginVO loginVO) {
		Session session=this.sessionFactory.getCurrentSession();
		System.out.println("loginPass->"+loginVO.getPassword()+"role->"+loginVO.getId()+"email->"+loginVO.getUsername());
		session.saveOrUpdate(loginVO);
	}

	@Override
	public List loginDetailsOfUser(String emailId) {
		Session session = this.sessionFactory.openSession();
		Query q= session.createQuery("from LoginVO where username='"+emailId+"'");
		List forgotPasswordUserList=q.list();
	
		return forgotPasswordUserList;
	}
	
}
