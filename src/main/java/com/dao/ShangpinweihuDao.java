package com.dao;

import com.entity.ShangpinweihuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ShangpinweihuVO;
import com.entity.view.ShangpinweihuView;


/**
 * 商品维护
 * 
 * @author 
 * @email 
 * @date 2020-11-09 14:52:21
 */
public interface ShangpinweihuDao extends BaseMapper<ShangpinweihuEntity> {
	
	List<ShangpinweihuVO> selectListVO(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
	
	ShangpinweihuVO selectVO(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
	
	List<ShangpinweihuView> selectListView(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);

	List<ShangpinweihuView> selectListView(Pagination page,@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
	
	ShangpinweihuView selectView(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
	
}
