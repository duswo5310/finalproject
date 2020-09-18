package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.ReviewDto;

public interface ReviewDao {
	
	//리뷰 등록
	void regist(ReviewDto reviewDto);
	
	//리뷰 리스트
	List<ReviewDto> getList(int branch_no);
	
	//리뷰 수정
	void edit(String review_title,String review_content,int review_no);
	
	//리뷰삭제
	void delete(int review_no);
}