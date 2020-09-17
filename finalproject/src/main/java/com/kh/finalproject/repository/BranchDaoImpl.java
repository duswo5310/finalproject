package com.kh.finalproject.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.entity.MemberDto;

@Repository
public class BranchDaoImpl implements BranchDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	//지점 등록 메소드
	public int regist(BranchDto branchDto,List<MultipartFile> file) throws IllegalStateException, IOException {
		int no = sqlSession.selectOne("branch.getSeq");//시퀀스 번호 미리생성
		branchDto.setBranch_no(no);
		branchDto.setBranch_layout("");
		sqlSession.insert("branch.regist", branchDto);
		//사진등록
		if(file.size() > 0 && !file.get(0).isEmpty()) {
			for(MultipartFile f : file) {
				//DB에 저장
				int img_no = sqlSession.selectOne("branchImg.getSeq");
				BranchImgDto branchImgDto = new BranchImgDto();
				branchImgDto.setBranch_img_no(img_no);
				branchImgDto.setBranch_img_name(Integer.toString(img_no));
				branchImgDto.setBranch_img_size(f.getSize());
				branchImgDto.setBranch_img_type(f.getContentType());
				branchImgDto.setBranch_no(no);
				sqlSession.insert("branchImg.regist", branchImgDto);
				
				//하드디스크에 저장
				File target = new File("D:/upload",f.getOriginalFilename());
				f.transferTo(target);
			}
		}
		return no;
	}

	//지점 리스트
	public List<BranchDto> getList() {
		List<BranchDto> list = sqlSession.selectList("branch.getList");
		return list;
	}

	//배치도 등록
	public void layout_regist(String branch_layout, int branch_no) {
		Map<Object, Object> map = new HashMap<>();
		map.put("branch_layout", branch_layout);
		map.put("branch_no", branch_no);
		sqlSession.update("branch.layout_regist", map);
	}

	//지점 단일조회
	public BranchDto get(int branch_no) {
		BranchDto branchDto = sqlSession.selectOne("branch.get", branch_no);
		return branchDto;
	}

	//지점 수정
	public void edit(BranchDto branchDto) {
		sqlSession.update("branch.edit", branchDto);
	}
	
	// 지점 번호 조회
	@Override
	public List<Integer> getNo() {
		return sqlSession.selectList("branch.getNo");
	}
	
	// 지역별 지점번호 조회
	@Override
	public List<Integer> getNo2(int local_no) {
		return sqlSession.selectList("branch.getNo2", local_no);
	}

	//지점 삭제 메소드
	public void delete(int branch_no) {
		sqlSession.delete("branch.delete", branch_no);
	}

	@Override
	public int getNo3(int admin_no) {
		return sqlSession.selectOne("branch.getNo3", admin_no);
	}

	//지점별 회원 조회
	public List<MemberDto> getMemberList(int branch_no) {
		return sqlSession.selectList("branch.memberList", branch_no);
	}

}
