package com.icia.membership_board.controller;

import com.icia.membership_board.dto.MemberDTO;
import com.icia.membership_board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save") //
    public String saveForm() {
        return "/memberPage/memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {

        System.out.println("memberDTO = " + memberDTO);
        memberService.MemberSave(memberDTO);
        System.out.println("memberDTO = " + memberDTO);
        return "/index";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "/memberPage/memberLogin";
    }

    @PostMapping("/login") // url
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (memberDTO.getMemberEmail().equals("admin")) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "/memberPage/memberAdmin";
        } else if (loginResult) {
//            model.addAttribute("loginEmail", memberDTO.getMemberEmail());
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "/memberPage/memberMain";
        } else {
            return "/memberPage/memberLogin";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 세션에 담긴 값 전체 삭제
        session.invalidate();
        // 특정 파라미터만 삭제
//        session.removeAttribute("loginEmail");
        return "redirect:/";
    }

    @GetMapping("/members")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "/memberPage/memberList";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/members";
    }

    @GetMapping("/mypage")
    public String myPage(){
        return "memberPage/memberMain";
    }

    @GetMapping("/update")
    public String updateForm(HttpSession session, Model model) {
        String loginEmail = (String)session.getAttribute("loginEmail");
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        return "memberPage/memberUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        memberService.update(memberDTO);
        System.out.println("memberDTO = " + memberDTO );
        return "memberPage/memberMain";
    }
}
