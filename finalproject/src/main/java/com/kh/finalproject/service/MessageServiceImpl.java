package com.kh.finalproject.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.entity.MessageManagerDto;
import com.kh.finalproject.entity.MessageMemberDto;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	HttpSession session;

	//메세지 등록
	public void regist(MessageVO messageVO,AdminDto adminDto) {
		//지점관리자 번호 받아서 지점관리자가 갖고있는 지점 가져오기
		int sender_no = sqlSession.selectOne("admin.getAdminNO",messageVO.getSender_name());
		

		//message 저장
		MessageDto messageDto = new MessageDto();
		int message_no = sqlSession.selectOne("message.getSeq");
		messageDto.setMessage_no(message_no);
		messageDto.setMessage_title(messageVO.getMessage_title());
		messageDto.setMessage_content(messageVO.getMessage_content());
		sqlSession.insert("message.regist", messageDto);
		String[] receiver = messageVO.getReceiver_name();
		
		//전체 지점장
		if(receiver.length < 2 && receiver[0].equals("전체 지점장")) {
			List<AdminDto> list = sqlSession.selectList("admin.getBranchAdmin");
			for(int i=0;i<list.size();i++) {
				//지점장들(주인공) 수신으로 받기
				MessageManagerDto managerDto2 = new MessageManagerDto();
				managerDto2.setMessage_no(message_no);//쪽지 번호 저장
				managerDto2.setAdmin_no(list.get(i).getAdmin_no());
				managerDto2.setAdmin2_no(sender_no);
				managerDto2.setMessage_manager_type("수신");
				sqlSession.insert("message.sendManager", managerDto2);
			}
			//본사(주인공)발신으로 보내기
			MessageManagerDto managerDto = new MessageManagerDto();
			managerDto.setMessage_no(message_no);
			managerDto.setAdmin_no(sender_no);
			managerDto.setAdmin2_no(0);//0일경우 전체 지점장에게 발신으로 표시
			managerDto.setMessage_manager_type("발신");
			sqlSession.insert("message.sendManager", managerDto);
			
		//지점 전체 회원
		}else if(receiver.length < 2 && receiver[0].equals("전체 회원")){
			int branch_no = sqlSession.selectOne("branch.getBranch", sender_no);
			List<MemberDto> list = sqlSession.selectList("member.getBranchList",branch_no);
			//회원(주인공)--수신으로 받기
			for(int i=0;i<list.size();i++) {
				MessageMemberDto memberDto = new MessageMemberDto();
				memberDto.setMessage_no(message_no);
				memberDto.setMessage_member_no(list.get(i).getMember_no());
				memberDto.setAdmin_no(sender_no);
				memberDto.setMessage_member_type("수신");
				sqlSession.insert("message.sendMember", memberDto);
			}
			//지점관리자(주인공) 발신으로 저장
			MessageMemberDto memberDto2 = new MessageMemberDto();
			memberDto2.setMessage_no(message_no);
			memberDto2.setMessage_member_no(0);
			memberDto2.setAdmin_no(sender_no);
			memberDto2.setMessage_member_type("발신");
			sqlSession.insert("message.sendMember", memberDto2);
			
		//지점장 선택
		}else{
			AdminDto admin = (AdminDto)session.getAttribute("admininfo");
			if(admin.getAdmin_auth().equals("본사")) {
				for(int i=0;i<receiver.length;i++) {
					MessageManagerDto managerDto = new MessageManagerDto();
					//주인공 = 본사(sender)--발신
					managerDto.setMessage_no(message_no);
					managerDto.setAdmin_no(sender_no);
					managerDto.setAdmin2_no(Integer.parseInt(receiver[i]));
					managerDto.setMessage_manager_type("발신");
					sqlSession.insert("message.sendManager", managerDto);
				}
				for(int i=0;i<receiver.length;i++) {
					MessageManagerDto managerDto2 = new MessageManagerDto();
					//주인공 = 받는사람(receiver)--수신
					managerDto2.setMessage_no(message_no);
					managerDto2.setAdmin_no(Integer.parseInt(receiver[i]));
					managerDto2.setAdmin2_no(sender_no);
					managerDto2.setMessage_manager_type("수신");
					sqlSession.insert("message.sendManager", managerDto2);
				}
			}else {
				for(int i=0;i<receiver.length;i++) {
					MessageMemberDto memberDto = new MessageMemberDto();
					//주인공 (지점장) -- 발신
					memberDto.setMessage_no(message_no);
					memberDto.setAdmin_no(sender_no);
					memberDto.setMember_no(Integer.parseInt(receiver[i]));
					memberDto.setMessage_member_type("발신");
					sqlSession.insert("message.sendMember", memberDto);
				}
				for(int i=0;i<receiver.length;i++) {
					MessageMemberDto memberDto = new MessageMemberDto();
					//주인공(회원) -- 수신
					memberDto.setMessage_no(message_no);
					memberDto.setAdmin_no(sender_no);
					memberDto.setMember_no(Integer.parseInt(receiver[i]));
					memberDto.setMessage_member_type("수신");
					sqlSession.insert("message.sendMember", memberDto);
				}
			}
		}
	}

	
	//발신함 메세지 삭제
	public void deleteOutbox(int message_manager_no) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		if(adminDto.getAdmin_auth().equals("본사")) {
			sqlSession.delete("message.managerDelete", message_manager_no);
		}else {
			sqlSession.delete("message.memberDelete",message_manager_no);
		}
	}
	
	//수신함 메세지 삭제
	public void deleteInbox(int message_manager_no) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
			sqlSession.delete("message.managerDelete", message_manager_no);
	}
	
}
