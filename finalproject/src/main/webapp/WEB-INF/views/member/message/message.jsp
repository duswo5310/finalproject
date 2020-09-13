<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/member/template/user_header.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

	<style>
		.inbox-tr:hover{
			cursor: pointer;
			background-color: lightgray;
		}
		.modal-backdrop{
			z-index: -1;
		}
		.btn{
			radius:15%;
		}
	</style>
	<script>
		$(function(){
		    $(".inbox-tr").click(function(){
		    	$("#inbox-modal").modal('show');
		    	
		    	//모달
		    	var title = $(this).parents(".table").next().children().children().children().children(".inbox-title");
		    	var content = $(this).parents(".table").next().children().children().children().children(".inbox-content");
		    	var date = $(this).parents(".table").next().children().children().children().children(".inbox-date");
		    	var del = $(this).parents(".table").next().children().children().children().children().children(".inbox-delete");
		    	
		    	//테이블
		    	var inputContent = $(this).children().find(".inbox-content-input").val();//쪽지 내용
		    	var titleTd = $(this).children(".inbox-title-td").text();//쪽지 제목
		    	var dateTd = $(this).children(".inbox-date-td").text();//보낸 날짜
		    	var messageMemberNo = $(this).children().find(".inbox-no-input").val();
		    	
		    	console.log(messageMemberNo);
		    	//모달에 쪽지내용 넣기
		    	title.text(titleTd);
		    	content.text(inputContent);
		    	date.text(dateTd);
		    	del.val(messageMemberNo);
		    	
		    	axios({
					url:"${pageContext.request.contextPath}/test/message/memberUpdate?message_member_no="+messageMemberNo,
					method:"get"
				})
				.then(function(response){
					
				})  
		    	
		    	$(".close-btn").click(function(){
		 		   location.reload();
		 	   })
		    	
		    });
		});		
	</script>
	<!--  여기서부터 섹션이 나뉨 -->
      <section id="" class="">
		<div class="container">
			<div class="row">
				<div class="main_service roomy-100" style="height: 800px;">					
						<table class="table">
							<thead>
								<tr>
									<th style="width: 70%;">제목</th>
									<th style="text-align: center;">보낸 사람</th>
									<th>보낸 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
									<tr class="inbox-tr">
										<c:choose>
											<c:when test="${list.message_member_read eq 0}">
												<td class="inbox-title-td" style="font-weight:bold; color: black;">${list.message_title}</td>
											</c:when>
											<c:otherwise>
												<td class="inbox-title-td" style="color:gray;">${list.message_title}</td>
											</c:otherwise>
										</c:choose>
										<td style="text-align: center;">지점장</td>
										<td class="inbox-date-td">${list.message_member_date}
											<input type="hidden" class="inbox-content-input" value="${list.message_content}">
											<input type="hidden" class="inbox-no-input" value="${list.message_member_no}">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					<!-- 수신함 모달 -->
					<div class="modal" id="inbox-modal">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title inbox-title"></h5>
									<h6 class="modal-title inbox-date" style="float: right;"></h6>
								</div>
								<div class="modal-body">
									<h6 class="modal-title inbox-content"></h6>  
								</div>
								<div class="modal-footer">
									<form action="message_member_delete_inbox" method="post">
										<input type="hidden" class="inbox-delete" name="message_member_no">
										<input type="submit" class="btn btn-outline-danger" value="삭제">
										<button type="button" class="btn btn-outline-danger close-btn" data-dismiss="modal">닫기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

<jsp:include page="/WEB-INF/views/member/template/footer.jsp"></jsp:include>