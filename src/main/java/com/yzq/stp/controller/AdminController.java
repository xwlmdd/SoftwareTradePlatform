package com.yzq.stp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yzq.stp.model.Admin;
import com.yzq.stp.model.Comment;
import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.ProAccept;
import com.yzq.stp.model.Project;
import com.yzq.stp.model.ProjectAccept;
import com.yzq.stp.model.User;
import com.yzq.stp.service.ProjectServiceImpl;
import com.yzq.stp.service.UserServiceImpl;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/stp/")
public class AdminController {

	@Autowired
	private ProjectServiceImpl projectServiceImpl;

	@Autowired
	private UserServiceImpl userServiceImpl;

	
	/**
	 * 管理员退出
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("toAdminLogin")
	public String toAdminLogout() {
		return "adminLogin";
	}

	
	/**
	 * 登录
	 * 
	 * @param user
	 * @param messageMap
	 * @return
	 */
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
	public String adminLogin(Admin admin, ModelMap messageMap, HttpSession httpSession) {
		Admin dbAdmin = userServiceImpl.adminLogin(admin);
		if (dbAdmin == null) {
			messageMap.addAttribute("message", "<font color='red'>用户名或密码错误</font>");
			return "adminLogin";
		}
		httpSession.setAttribute("admin", dbAdmin);
		return "adminInfo";
	}

	/**
	 * 管理员退出
	 * 
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("adminLogout")
	public String acceptLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "login";
	}

	/**
	 * 加载未审批和已审批项目
	 * 
	 * @param project
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("checkProject")
	private String checkProject(Project project, ModelMap modelMap) {
		// 0是未通过审批的、1是通过审批
		List<Project> projectList = new ArrayList<Project>();
		if (project.getCheckCode() == 0) {
			projectList = projectServiceImpl.getProject(project);
			modelMap.addAttribute("projectList", projectList);
			return "uncheck";
		} else if (project.getCheckCode() == -1) {
			projectList = projectServiceImpl.getCheckProect();
		}
		modelMap.addAttribute("projectList", projectList);
		return "check";
	}

	/**
	 * 审批项目
	 * 
	 * @param project
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("check")
	private String check(int projectId, int flag, ModelMap modelMap) {
		projectServiceImpl.check(projectId, flag);
		List<Project> projectList = projectServiceImpl.getCheckProect();
		modelMap.addAttribute("projectList", projectList);
		modelMap.addAttribute("message", "已审批");
		return "check";
	}
	
	
	/**
	 * 加载已审批项目
	 * @param projectId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("lookProjectDetail")
	public String  lookProjectDetail(int projectId,ModelMap modelMap){
		Project project = projectServiceImpl.lookProject(projectId);
		modelMap.addAttribute("project", project);
		return "lookProjectDetail";
	}
	


	
	

}
