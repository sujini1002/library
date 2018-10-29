package com.bit.lib.umki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.lib.umki.model.ReplyInfo;
import com.bit.lib.umki.service.GetWriteContentService;
import com.bit.lib.umki.service.GetWriteService;

@Controller
public class ReplyWriteController {

	@Autowired
	GetWriteService service1;
	@Autowired
	GetWriteContentService service2;
	
	@RequestMapping(value = "/member/home/view/reply", method =RequestMethod.POST)
	@ResponseBody
	public ReplyInfo write(@RequestParam("replytext") String replytext) {

		System.out.println(replytext);
		ModelAndView modelAndView = new ModelAndView();
		System.out.println("ㅎㅇㅎㅇ");
		ReplyInfo replyInfo = new ReplyInfo();
		replyInfo.setReplyText(replytext);
		System.out.println(replyInfo.toString());
		service1.replyWrite(replyInfo);

		return replyInfo;
		
	}
}