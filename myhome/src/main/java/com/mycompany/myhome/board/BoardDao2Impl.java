package com.mycompany.myhome.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("boardDao2")
public class BoardDao2Impl implements BoardDao{

	List<BoardDto> list = new ArrayList<BoardDto>();
	public BoardDao2Impl() {
		list.add(new BoardDto("1","����1","����1","�ۼ���1","2021-01-06"));
		list.add(new BoardDto("2","����2","����2","�ۼ���2","2021-01-07"));
		list.add(new BoardDto("3","����3","����3","�ۼ���3","2021-01-08"));
		list.add(new BoardDto("4","����4","����4","�ۼ���4","2021-01-09"));
		list.add(new BoardDto("5","����5","����5","�ۼ���5","2021-01-10"));
	}
	@Override
	public List<BoardDto> getList() {
		// TODO Auto-generated method stub
		return list;
	}
	@Override
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

}
