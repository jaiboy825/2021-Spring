package com.mycompany.myhome.board;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	
	//SqlSessionTemplate - �� Ŭ������ ���� ��������
	//@Resource��  ����
	//@Autowired Ÿ�Ը� ������ �����´�. @Autowired ������ ���� @Resource �̴�.
	
	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public List<BoardDto> getList() {
		// TODO Auto-generated method stub
		return sm.selectList("Board_getList");
	}
	
	@Override
	public void insert(BoardDto dto) {
		sm.insert("Board_insert", dto);
	}

}
