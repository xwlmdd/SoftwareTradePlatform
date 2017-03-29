package com.yzq.stp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.Project;
import com.yzq.stp.service.ProjectServiceImpl;

/**
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/stp/")
public class SendController {

	@Autowired
	private ProjectServiceImpl projectServiceImpl;
	
	
	
	@RequestMapping("publicProject")
	private String publicProject(Project project,ModelMap modelMap){
		//未审核
		project.setCheckCode(0);
		projectServiceImpl.publicProject(project);
		//0是未通过审批的、1是通过审批
		Project condition = new Project();
		condition.setSendId(project.getSendId());
		List<Project>projectList = projectServiceImpl.getProject(condition);
		modelMap.addAttribute("projectList", projectList);
		return "sendMyProject";
	}
	
	/**
	 * 加载我的项目
	 * @param project
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("myCheckProject")
	private String myCheckProject(Project project,ModelMap modelMap){
		//0是未通过审批的、1是通过审批
		List<Project>projectList = projectServiceImpl.getProject(project);
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
	public String lookJingBiao(ModelMap modelMap,int projectId){
		 List<JingBiao> jingBiaoList = projectServiceImpl.lookJingBiao(projectId);
		 modelMap.addAttribute("jingBiaoList", jingBiaoList);
		return "sendAcceptList";
	}
	
}
