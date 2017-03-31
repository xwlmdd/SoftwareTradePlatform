package com.yzq.stp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

	List<Project> getCheckProect();

	void check(@Param("projectId")int projectId, @Param("checkCode") int checkCode);

}