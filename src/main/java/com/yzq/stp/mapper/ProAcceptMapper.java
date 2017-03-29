package com.yzq.stp.mapper;

import java.util.List;

import com.yzq.stp.model.JingBiao;
import com.yzq.stp.model.ProAccept;

public interface ProAcceptMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProAccept record);

    int insertSelective(ProAccept record);

    ProAccept selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProAccept record);

    int updateByPrimaryKey(ProAccept record);
    
    List<JingBiao>lookJingBiao(int projectId);
}