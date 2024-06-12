package org.srsel.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import org.srsel.model.ManageEffortVO;

public interface ManageEffortService {
	public void insertEfforts(ManageEffortVO manageEffortVO);

	public List viewEfforts();

	public List editEfforts(ManageEffortVO manageEffortVO);

	public void deleteEfforts(ManageEffortVO ManageEffortVO);

	public List getEffortByLoginId(int loginId);

	public boolean approveEfforts(ManageEffortVO manageEffortVO);

	public boolean rejectEfforts(ManageEffortVO manageEffortVO);
}
