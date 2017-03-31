package com.yzq.stp.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yzq.stp.mapper.CommentMapper;
import com.yzq.stp.mapper.ProAcceptMapper;
import com.yzq.stp.mapper.ProjectMapper;
import com.yzq.stp.model.Comment;
import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.ProAccept;
import com.yzq.stp.model.Project;
import com.yzq.stp.model.ProjectAccept;

@Service
public class ProjectServiceImpl {

	@Autowired
	private ProjectMapper projectMapper;
	
	@Autowired
	private ProAcceptMapper proAcceptMapper;
	
	@Autowired
	private CommentMapper commentMapper;

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
	
	
	/**
	 * 接包方接包总数
	 * @param acceptId
	 * @return
	 */
	public int selectNum(int acceptId){
		return commentMapper.selectNum(acceptId);
	}
	
	/**
	 * 查询评论
	 * @param acceptId
	 * @return
	 */
	public List<Comment>selectComment(int acceptId){
		return commentMapper.selectComment(acceptId);
	}
	
	
	public List<ProjectAccept>loadProject(int acceptId,int ischeck){
		return proAcceptMapper.loadProject(acceptId, ischeck);
	}
	
	/**
	 * 竞标
	 * @param proAccept
	 * @return 
	 */
	public boolean jingbiao(ProAccept proAccept){
		int num = proAcceptMapper.insert(proAccept);
		if(num==0){
			return false;
		}
		return true;
	}
	
	public Project lookProject(int projectId){
		return projectMapper.selectByPrimaryKey(projectId);
	}

	/**
	 * 是否已经竞标
	 * @param projectId
	 * @param acceptId
	 * @return
	 */
	public boolean hasJingbiao(Integer projectId, Integer acceptId) {
		ProAccept proAccept = proAcceptMapper.hasJingbiao( projectId,  acceptId);
		if(proAccept!=null){
			return true;
		}
		return false;
	}
}
