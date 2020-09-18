<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.14/cinema/hacademy-cinema.css">
<script src="https://cdn.jsdelivr.net/gh/hiphop5782/js@0.0.14/cinema/hacademy-cinema.js"></script>
<!-- <link rel="stylesheet" -->
<!--    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" -->
<!--    integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" -->
<!--    crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js"
	integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" 
	crossorigin="anonymous"></script>
<script>
   	    $(function(){
   	    	
   	    	$.urlParam = function(name) {
        	    var results = new RegExp('[\?&]' + name + '=([^&#]*)')
        	                      .exec(window.location.href);
        	    if (results == null) {
        	         return 0;
        	    }
        	    return results[1] || 0;
        	}
  	    	
   	       	if($('.entrance').val()=='leftTop'){
   	       		$('.cinema-screen').css("width", '30%').css('margin', '10px').css('height', '30px').css('padding', '0');    	    	   	       		
   	       	} else if($('.entrance').val()=='centerTop'){
   	       		$('.cinema-screen').css("width", '30%').css('margin-top', '10px').css('height', '30px').css('padding', '0');    	    	   	    	
    	    } else {
   	       		$('.cinema-screen').css("width", '30%').css('margin', '10px').css('height', '30px').css('margin-left', '68%').css('padding', '0');    	    	
    	    }
   	    	var cinema = new Hacademy.Reservation(".cinema-wrap");

   	    	var usedCol = $('.usedCol').val();
   	    	var usedRow = $('.usedRow').val();
   	    	
   	    	$('.cinema-seat').filter(function(){
    			return $(this).data('row') == usedRow && $(this).data('col') == usedCol;
    		}).addClass('active').removeClass('disabled');
   	    	
   	    	$('.cinema-seat').click(function(){
   	    		var row = $(this).data('row');
   	    		var col = $(this).data('col');
   	    		var branch_no = $.urlParam('branch_no');
   	    		var member_no = $('.member_no').val();
   	    		
   	    		if(usedCol && usedRow && !$(this).hasClass('empty')) {
    				alert("이미 이용중인 좌석이 있습니다");
    				location.reload();
   	    			return;
   	    		}
   	    		
   	    		if(row && col && !$(this).hasClass('disabled') && !$(this).hasClass('empty')){
	   	    		if(confirm(row+"-"+col+"번 좌석을 선택 하시겠습니까?")){
	   	    			if($('.charge').val()==0){
	   	    				alert("충전시간이 없습니다. 이용권을 먼저 결제 해주세요.")
	   	    				location.href = "${pageContext.request.contextPath}/member/pay/pay_main?member_no="+$('.member_no').val();
	   	    			} else {
		   	    			axios({
		   	    				url:"${pageContext.request.contextPath}/test/seat/check?branch_no="+branch_no+"&row="+row+"&col="+col+"&member_no="+member_no,
		   	    				method:"get"
		   	    			}).then(function(response){
		   	    				if(response.data) { // 이용 가능일 경우
		   	    					alert("좌석 선택이 완료되었습니다");
		   	    					location.reload();
		   	    				} else {
		   	    					alert("이미 이용중인 좌석입니다");	   	    					
		   	    					location.reload();
		   	    				}
		   	    			});  				
	   	    			}
	   	    		} else {
	   	    			location.reload();
	   	    		}
   	    			
   	    		} else {
   	    			console.log("좌석아님");
   	    		}
   	    	});
   	    })
</script>
<style>
	.content-wrapper {
		text-align: center;
	}
	.cinema {
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 3%;
		margin-bottom: 0;
	}
	.notice-wrap {
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 5%;
		margin-bottom: 0;
	}
	span {
		font-weight: 700;
	}
	.notice {
		font-size: medium;
		margin-bottom: 1rem;
	}
	.use-wrap {
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 3%;
		margin-bottom: 0;
		text-align: center;
		background-color: #F1F1F1;
	}
	.btn-wrap {
		margin-left: 15%;
		margin-right: 15%;
		text-align: center;		
	}
	.star {
		color: red;
	}
	.black{
		color: black;	
	}
	.orange{
		color: orange;	
	}
	.gray{
		color: gray;		
	}
	.white{
		color: white;
	}
</style>
<section>
      <div class="container">
         <div class="row">
            <div class="main_service roomy-100">

				<div id="content-wrapper">
					<div class="container-fluid">
						<div class="notice-wrap">
		                    <label class="notice">
		                    	<span class="star"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></span> 이용 전 TIP <span class="star"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></span> 
		                    </label>
		                    <p><span class="star">*</span> <span>이용권 결제</span> 후 좌석을 선택해주세요</p>
		                    <p><span class="star">*</span> 충전 시간이 남아있어야 좌석 선택이 가능합니다</p>
		                </div>
		                <div class="use-wrap">
		                	<span class="white"><i class="fa fa-square" aria-hidden="true"></i></span> <span class="black">이용 가능</span>
		                	&nbsp; &nbsp; &nbsp; &nbsp;
		                	<span class="gray"><i class="fa fa-square" aria-hidden="true"></i></span> <span class="black">선택 불가</span>
		                	&nbsp; &nbsp; &nbsp; &nbsp;
		                	<span class="orange"><i class="fa fa-square" aria-hidden="true"></i></span> <span class="black">내 예약</span>
		                </div>
						<div class="row cinema">
				            <input type="hidden" name="entrance" value="${entrance}" class="entrance">
				            <input type="hidden" name="charge" value="${memberDto.member_charge}" class="charge">
				            <input type="hidden" name="member_no" value="${memberDto.member_no}" class="member_no">
				            <input type="hidden" name="usedCol" value="${used.usedCol}" class="usedCol">
				            <input type="hidden" name="usedRow" value="${used.usedRow}" class="usedRow">
			                <form action="select" method="post">
				                <div class="cinema-wrap" data-name="seat">
				                	<div class="cinema-screen">출입구</div>
				                    <div class="cinema-seat-area" data-mode="client" data-rowsize="${rowsize}" data-colsize="${colsize}" data-seatno="visible" data-fill="manual" data-choice="single">
				                    	<c:forEach items="${list}" var="seatDto">
				                    		<div class="cinema-seat ${seatDto.seat_type}" data-row="${seatDto.seat_row}" data-col="${seatDto.seat_col}" data-state="${seatDto.seat_type}" data-direction="${seatDto.seat_direction}">
				                    		</div>
				                    	</c:forEach>
				                    </div>
				                </div>
			                </form>
						</div>
						<br><br>
						<div class="btn-wrap">
							<button class="btn btn-primary">퇴실하기</button>
						</div>
			        </div>
			    </div>
            </div>
         </div>
      </div>
   </section>   
<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>