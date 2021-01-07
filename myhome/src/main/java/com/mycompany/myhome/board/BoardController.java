package com.mycompany.myhome.board;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	@Resource(name = "boardService")
	BoardService boardService;

	@RequestMapping("/board/list")
	String board_list(Model model) {
		model.addAttribute("boardList", boardService.getList());
		return "board/board_list";
	}

	@RequestMapping("/board/write")
	String board_write() {
		return "board/board_write";
	}

	@RequestMapping("/board/save")
	String board_save(BoardDto dto) {
		boardService.insert(dto);
		return "redirect:/board/list";
	}
}
