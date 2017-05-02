package com.yzq.stp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
public class CoreController {

	@Autowired
	private ProjectServiceImpl projectServiceImpl;
	
	@Autowired
	private UserServiceImpl userServiceImpl; 

	/**
	 * 发布项目
	 * @param project
	 * @param modelMap
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("publicProject")
	private String publicProject(Project project, ModelMap modelMap,HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("u");
		if(u==null){
			modelMap.addAttribute("message", "您还没登入请登入!");
			return "public";
		}
		// 未审核
		project.setCheckCode(0);
		projectServiceImpl.publicProject(project);
		// 0是未通过审批的、1是通过审批
		Project condition = new Project();
		condition.setSendId(project.getSendId());
		List<Project> projectList = projectServiceImpl.getProject(condition);
		modelMap.addAttribute("projectList", projectList);
		return "sendMyProject";
	}

	/**
	 * 加载的项目信息
	 * 
	 * @param project
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("myCheckProject")
	private String myCheckProject(Project project, ModelMap modelMap) {
		// 0是未通过审批的、1是通过审批
		List<Project> projectList = projectServiceImpl.getProject(project);
		modelMap.addAttribute("projectList", projectList);
		return "sendMyProject";
	}

	/**
	 * 
	 * @param modelMap
	 * @param projectId
	 * @return
	 */
	@RequestMapping("lookJingBiao")
	public String lookJingBiao(ModelMap modelMap, int projectId) {
		List<JingBiao> jingBiaoList = projectServiceImpl.lookJingBiao(projectId);
		modelMap.addAttribute("jingBiaoList", jingBiaoList);
		return "sendAcceptList";
	}

	/**
	 * 竞标方的详细信息
	 * @param projectId
	 * @param acceptId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("acceptDetail")
	public String acceptDetail(int projectId,int acceptId,ModelMap modelMap) {
		//接方信息
		User user = userServiceImpl.loadUserInfo(acceptId);
		modelMap.addAttribute("accept",user);
		//接过项目总数
		int num = projectServiceImpl.selectNum(acceptId);
		modelMap.addAttribute("num",num);
		//（项目评价）
		List<Comment>proDetailList =projectServiceImpl.selectComment(acceptId);
		modelMap.addAttribute("proDetailList",proDetailList);
		return "sendAcceptDetail";
	}
	
	
	@RequestMapping("loadProject")
	public String loadProject(int acceptId,int ischeck,ModelMap modelMap) {
		List<ProjectAccept>projectList =projectServiceImpl.loadProject(acceptId, ischeck);
		modelMap.addAttribute("projectList",projectList);
		return "acceptProject";
	}
	
	/**
	 * 加载项目
	 * @param projectId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("lookProject")
	public String  lookProject(int projectId,int type,ModelMap modelMap,HttpSession httpSession){
		Project project = projectServiceImpl.lookProject(projectId);
		modelMap.addAttribute("project", project);
		modelMap.addAttribute("type", type);
		//-999是用首页发的
		if(type==-999){
			return "jingbiao";
		}
		return "projectDetail";
	}
	
	/**
	 * 选择竞标人
	 * @param projectId
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("choose")
	public String  choose(int projectId,int acceptId,ModelMap modelMap,int id){
		projectServiceImpl.choose(projectId,acceptId);
		//checkcode 2：正在开发
		projectServiceImpl.check(projectId, 2);
		modelMap.addAttribute("message", "选择成功！请尽快和接包人联系！");
		Project p = new Project();
		p.setSendId(new Integer(id));
		List<Project> projectList = projectServiceImpl.getProject(p);
		modelMap.addAttribute("projectList", projectList);
		return "sendMyProject";
	}
	
	
	@RequestMapping(value = "jingbiao")
	public String jingbiao(ProAccept proAccept,ModelMap modelMap,HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("u");
		if(u==null){
			modelMap.addAttribute("message", "请登入才能进行竞标！");
			return "jingbiao";
		}
		int acceptId = u.getId();
		boolean hasJingbiao = projectServiceImpl.hasJingbiao(proAccept.getProjectId(),acceptId);
		if(hasJingbiao){
			Project project = projectServiceImpl.lookProject(proAccept.getProjectId());
			modelMap.addAttribute("project", project);
			modelMap.addAttribute("message", "你已经参加了该项目竞标了！不能再参加了");
			return "jingbiao";
		}
		proAccept.setIscheck(0);
		proAccept.setAcceptId(acceptId);
		projectServiceImpl.jingbiao(proAccept);
		//跳转到正在竞标页面
		List<ProjectAccept>projectList =projectServiceImpl.loadProject(acceptId, 0);
		modelMap.addAttribute("projectList",projectList);
		modelMap.addAttribute("message","参加竞标成功！请等待结果");
		return "acceptProject";
	}
}
