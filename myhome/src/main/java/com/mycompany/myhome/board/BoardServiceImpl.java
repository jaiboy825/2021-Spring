package com.mycompany.myhome.board;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl  implements BoardService{


    @Resource(name="boardDao")
    BoardDao BoardDao;

    @Override
    public List<BoardDto> getList() {
        // TODO Auto-generated method stub
        return BoardDao.getList();
    }

	@Override
	public void insert(BoardDto dto) {
		BoardDao.insert(dto);
		
	}

}