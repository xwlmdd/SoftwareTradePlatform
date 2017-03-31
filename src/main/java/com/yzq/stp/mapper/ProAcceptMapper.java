package com.yzq.stp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.ProAccept;
import com.yzq.stp.model.ProjectAccept;

public interface ProAcceptMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProAccept record);

    int insertSelective(ProAccept record);

    ProAccept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProAccept record);

    int updateByPrimaryKey(ProAccept record);
    
    List<JingBiao>lookJingBiao(int projectId);
    
    List<ProjectAccept> loadProject(@Param("acceptId")int acceptId,@Param("ischeck")int ischeck);
    
    /**
     * 是否有记录
     * @param projectId
     * @param acceptId
     * @return
     */
    ProAccept hasJingbiao(@Param("projectId")Integer projectId, @Param("acceptId")Integer acceptId);
}