package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.ShangpinweihuDao;
import com.entity.ShangpinweihuEntity;
import com.service.ShangpinweihuService;
import com.entity.vo.ShangpinweihuVO;
import com.entity.view.ShangpinweihuView;

@Service("shangpinweihuService")
public class ShangpinweihuServiceImpl extends ServiceImpl<ShangpinweihuDao, ShangpinweihuEntity> implements ShangpinweihuService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShangpinweihuEntity> page = this.selectPage(
                new Query<ShangpinweihuEntity>(params).getPage(),
                new EntityWrapper<ShangpinweihuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ShangpinweihuEntity> wrapper) {
		  Page<ShangpinweihuView> page =new Query<ShangpinweihuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ShangpinweihuVO> selectListVO(Wrapper<ShangpinweihuEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ShangpinweihuVO selectVO(Wrapper<ShangpinweihuEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ShangpinweihuView> selectListView(Wrapper<ShangpinweihuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ShangpinweihuView selectView(Wrapper<ShangpinweihuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
