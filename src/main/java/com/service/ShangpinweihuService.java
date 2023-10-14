package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ShangpinweihuEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ShangpinweihuVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ShangpinweihuView;


/**
 * 商品维护
 *
 * @author 
 * @email 
 * @date 2020-11-09 14:52:21
 */
public interface ShangpinweihuService extends IService<ShangpinweihuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ShangpinweihuVO> selectListVO(Wrapper<ShangpinweihuEntity> wrapper);
   	
   	ShangpinweihuVO selectVO(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
   	
   	List<ShangpinweihuView> selectListView(Wrapper<ShangpinweihuEntity> wrapper);
   	
   	ShangpinweihuView selectView(@Param("ew") Wrapper<ShangpinweihuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ShangpinweihuEntity> wrapper);
   	
}

