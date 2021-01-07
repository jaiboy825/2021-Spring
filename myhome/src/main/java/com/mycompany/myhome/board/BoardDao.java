package com.mycompany.myhome.board;

import java.util.List;

public interface BoardDao {
	List<BoardDto> getList();
	void insert(BoardDto dto);
}
