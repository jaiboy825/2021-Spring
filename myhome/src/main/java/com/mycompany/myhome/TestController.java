package com.mycompany.myhome;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//DispatcherServlet Ŭ������ url �� ������ ��Ʈ�ѷ��� �����Ų��
@Controller
public class TestController {
	@RequestMapping("/test")
	String test1(Model model)
	{
		//Model ��ü�� jsp�� request ��ü�� ���� �����Ҷ� ���ȴ�.
		//jsp���� ${user01} ������ ǥ�������� �����ص� �ǰ� request.getAttribute �ռ��� ����ص� �ȴ�.
		model.addAttribute("userid", "user01");
		model.addAttribute("username", "ȫ�浿");
		return "test";
	}
	
	@RequestMapping("/test/list")
	String testList(Model model)
	{
		List<String> list = new ArrayList<String>();
		list.add("���");
		list.add("������");
		list.add("��");
		list.add("����");
		list.add("����");
		list.add("���");
		list.add("���ξ���");
		list.add("����ƾ");
		
		model.addAttribute("list", list);
		return "/test/list"; //test ���� �Ʒ��� list.jsp ȣ���ϱ�
		
	}
	// http:// localhost:9090/myhome/userinfo?userid=test&password=1234
	@RequestMapping("/userinfo")
	String userinfo(Model model ,String userid, String password)
	{
		System.out.println("userid : " + userid);
		System.out.println("password : " + password);
		
		model.addAttribute("userid",userid);
		model.addAttribute("password", password);
		return "userinfo";
	}
	
	@RequestMapping("/add")
	String userinfo(Model model ,int x, int y)
	{
		System.out.println("x : " + x);
		System.out.println("y : " + y);
		int z = x + y;
		model.addAttribute("x",x);
		model.addAttribute("y", y);
		model.addAttribute("z", z);
		return "add";
	}
}
