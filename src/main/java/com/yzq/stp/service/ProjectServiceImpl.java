package com.yzq.stp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.stp.mapper.ProAcceptMapper;
import com.yzq.stp.mapper.ProjectMapper;
import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.Project;

@Service
public class ProjectServiceImpl {

	@Autowired
	private ProjectMapper projectMapper;
	
	@Autowired
	private ProAcceptMapper proAcceptMapper;

	/**
	 * 发布项目
	 * @param project
	 */
	public void publicProject(Project project) {
		projectMapper.insert(project);
	}

	/**
	 * project作为条件
	 * @param project
	 * @return
	 */
	public List<Project> getProject(Project project) {
		return projectMapper.getProject(project);
	}

	/**
	 * 获取该项目的竞标人信息
	 * @param projectId
	 * @return
	 */
	public List<JingBiao> lookJingBiao(int projectId) {
		return proAcceptMapper.lookJingBiao(projectId);
	}
	
	
}
