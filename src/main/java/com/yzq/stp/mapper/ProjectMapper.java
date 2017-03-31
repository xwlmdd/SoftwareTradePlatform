package com.yzq.stp.mapper;

import java.util.List;

import com.yzq.stp.model.Project;

public interface ProjectMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Project record);

	int insertSelective(Project record);

	Project selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Project record);

	int updateByPrimaryKeyWithBLOBs(Project record);

	int updateByPrimaryKey(Project record);

	List<Project> getProject(Project record);

}