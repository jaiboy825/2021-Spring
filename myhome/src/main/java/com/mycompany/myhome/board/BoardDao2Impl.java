package com.mycompany.myhome.board;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("boardDao2")
public class BoardDao2Impl implements BoardDao{

	List<BoardDto> list = new ArrayList<BoardDto>();
	public BoardDao2Impl() {
		list.add(new BoardDto("1","제목1","내용1","작성자1","2021-01-06"));
		list.add(new BoardDto("2","제목2","내용2","작성자2","2021-01-07"));
		list.add(new BoardDto("3","제목3","내용3","작성자3","2021-01-08"));
		list.add(new BoardDto("4","제목4","내용4","작성자4","2021-01-09"));
		list.add(new BoardDto("5","제목5","내용5","작성자5","2021-01-10"));
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
