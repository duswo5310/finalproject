package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberCouponDto {
	
	private int coupon_no, branch_no, member_no, admin_no, coupon_discount, group_no;
	private String coupon_name, coupoon_category, coupon_date, coupon_start, coupon_finish;

}