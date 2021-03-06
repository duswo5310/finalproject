package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private MemberDao memberDao;
	
	// 회원 검색
	@Override
	public List<MemberDto> search(String member_name, int branch_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_name", member_name);
		param.put("branch_no", branch_no);
		
		return memberDao.search(param);
	}
	
	//비밀번호 암호화 매치 확인
	@Override
	public boolean check(String pw, HttpSession session) {
		MemberDto find = (MemberDto) session.getAttribute("memberinfo");
		return encoder.matches(pw, find.getMember_pw());
	}
}
