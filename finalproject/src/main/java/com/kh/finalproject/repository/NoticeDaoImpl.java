package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int write(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		int notice_no =sqlSession.selectOne("notice.getSeq");
		noticeDto.setNotice_no(notice_no);
		sqlSession.insert("notice.write", noticeDto);
		return notice_no;
	}

	@Override
	public List<NoticeDto> list() {
		return sqlSession.selectList("notice.list");
	}

	@Override
	public NoticeDto content(int notice_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.content", notice_no);
	}

	@Override
	public void edit(NoticeDto noticeDto) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.edit", noticeDto);
	}

	@Override
	public void delete(int notice_no) {
		// TODO Auto-generated method stub
		sqlSession.delete("notice.delete", notice_no);
	}

	@Override
	public int countNotice() {
		// TODO Auto-generated method stub
		return 	sqlSession.selectOne("notice.countNotice");
	}

	@Override
	public List<NoticeDto> selectNotice(PagingVO vo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		return sqlSession.selectList("notice.selectNotice", map);
	}
	
}
