package com.gdu.myapp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.NoticeDto;
import com.gdu.myapp.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class NoticeController {

  private final NoticeService noticeService;
  
  @RequestMapping(value="/notice/list.do", method=RequestMethod.GET)
  public String list(Model model) {    
    List<NoticeDto> noticeList = noticeService.getNoticeList();
    model.addAttribute("noticeList", noticeList);
    return "notice/list";
  }
  
  @RequestMapping(value="/notice/write.do", method=RequestMethod.GET)
  public String write() {
    return "notice/write";
  }
  
  @RequestMapping(value="/notice/add.do", method=RequestMethod.POST)
  public String add(NoticeDto noticeDto, RedirectAttributes redirectAttributes) {
    int addResult = noticeService.addNotice(noticeDto);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/notice/list.do";
  }
  
  @RequestMapping(value="/notice/detail.do", method=RequestMethod.GET)
  public String detail(@RequestParam(value="notice_no", required=false, defaultValue="0") int notice_no, Model model) {
    model.addAttribute("notice", noticeService.getNoticeByNo(notice_no));
    return "notice/detail";
  }
  
  @RequestMapping(value="/notice/edit.do", method=RequestMethod.POST)
  public String edit(NoticeDto noticeDto, RedirectAttributes redirectAttributes) {
    int editResult = noticeService.editNotice(noticeDto);
    redirectAttributes.addFlashAttribute("editResult", editResult);
    return "redirect:/notice/detail.do?notice_no=" + noticeDto.getNotice_no();   
  }
  
  public String delete(@RequestParam(value="notice/delete.do", required=false, defaultValue="0") int notice_no, RedirectAttributes redirectAttributes) {
    int deleteResult = noticeService.deleteNotice(notice_no);
    redirectAttributes.addFlashAttribute("deleteResult", deleteResult);
    return "redirect:/notice/list.do";
  }
  
}
