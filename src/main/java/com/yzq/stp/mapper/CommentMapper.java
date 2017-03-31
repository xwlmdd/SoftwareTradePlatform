package com.yzq.stp.mapper;

import java.util.List;

import com.yzq.stp.model.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
    
    int selectNum(int acceptId);
    
    List<Comment>selectComment(int acceptId);
}