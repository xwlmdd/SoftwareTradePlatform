package com.yzq.stp.controller;

import java.util.List;

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
public class IndexController {

	@Autowired
	private ProjectServiceImpl projectServiceImpl;

	/**
	 * 加载我的项目
	 * 
	 * @param project
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("loadIndexProject")
	private String loadIndexProject(Project project, ModelMap modelMap) {
		// 0是未通过审批的、1是通过审批
		project.setCheckCode(1);
		List<Project> projectList = projectServiceImpl.getProject(project);
		modelMap.addAttribute("projectList", projectList);
		return "index";
	}
	
}
