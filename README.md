<h1 align="center"> SPATIUM (스터디카페 프로그램)📚</h1>

> 초심 스터디카페, PLAN A, 르하임 스터디카페를 참고하여 만든 스터디카페 프로그램입니다 

> 개발 기간 : 2020-08-22 ~ 2020-09-21

<a href="http://www.sysout.co.kr/spatium/member/">🎈SPATIUM 회원 바로가기</a>

<a href="http://www.sysout.co.kr/spatium/admin/">🎈SPATIUM 관리자 바로가기</a>

## 🗂 목차
 - 프로젝트 소개
 - 프로젝트 설계 및 계획
 - 주요 기능 설명
 - 마치며

 ## 🌒 프로젝트 소개
 <P>
 독서실과 카페의 장점을 결합한 모델로 카공족(카페에서 공부하는 사람들)이 보편화 되면서 공부를 목적으로 하는 스터디 카페의 수요가 지속적으로 증가하고 있습니다.</p>
 <p>
 24시간 운영하는 무인 키오스크를 이용해 결제 및 좌석배정하는 시스템이 어떻게 이루어졌는지 궁금증을 품게 되었고 이는 곧 스터디 카페 프로그램을 구축하게 되었습니다.
 </p>
 
 - 사용자는 편리하게 상품 구입 및 좌석 선택 등 스터디 카페를 이용할 수 있다.
 - 관리자는 사용자의 모든것을 관리할 수 있으며 전체관리자, 본사관리자로 나뉘어 있다.

 ## 🌓 프로젝트 설계 및 계획
 
 - <a href="https://ovenapp.io/view/sayLAzWlIwaEqqxweHVtoHEYTm0mh45G/nqQLc">초기 설계 화면</a>

    - 우리 프로젝트는 Java를 기반으로 만들어진 스터디카페 프로그램입니다. 아파치톰캣을 사용해 서버를 구축했습니다. 
    - 데이터베이스는 oracle을 사용했습니다.

    - 정연재, 김진영, 김혜정, 오한민 총 네명이 프로젝트를 진행하였습니다.
    
 > 👩🏻‍🦰 정연재 : (관리자)지역,지점 및 배치도 기능 / 쪽지 기능 / 리뷰 기능
 
 > 👩🏻 김진영 : 좌석 기능 / 쿠폰 기능 / 마일리지 기능
 
 > 👱🏻‍♀️ 김혜정 : 챗봇 기능 / 결제 기능
 
 > 🧑🏻 오한민 : 회원 계정 기능 / 관리자 계정 기능 / 공지사항 

## 🌕 주요기능 설명

<img src="https://github.com/duswo5310/finalproject/blob/master/images/user_chat.png" width="1000px">&nbsp;

- ### 메인페이지

> 로그인을 한 사용자는 해당 지점의 남은 좌석 개수와 충전된 남은 시간을 확인할 수 있습니다. 

> 메인페이지의 우측 하단 곰돌이 모양을 누르면 오른쪽 사진과 같이 챗봇기능을 볼 수 있습니다.

> 잔여시간의 <충전하기>를 누르거나 위측 상단메뉴의 <상품충전>을 누르면 상품 구입창으로 넘어갑니다.

> 우측 상단의 <개인석>을 누르면 충전시간이 있을경우 바로 좌석 선택창으로 넘어가며, 충전시간이 없을 경우 상품결제창으로 넘어갑니다.

> 우측 상단의 <리뷰>를 누르면 해당지점의 리뷰목록으로 이동합니다.

<img src="https://github.com/duswo5310/finalproject/blob/master/images/user_pay.png" width="1000px">&nbsp;

- ### 회원 상품 결제창

> <상품구매>을 누르거나 <충전하기>를 누를 시 넘어가는 창입니다.

> 상품을 선택할 시 비동기로 바로 오른쪽 결제창에 가격이 표시됩니다.

> 마일리지를 선택<br>
> - 보유 마일리지 보다 많이 입력할 경우 alert으로 사용가능 마일리지를 알려줍니다.
> - 마일리지 사용금액이 결제금액을 초과할 경우 alert으로 결제금액 초과했다는 메세지를 띄웁니다.
> - 정상적으로 마일리지 입력 시 비동기로 마일리지 적용된 할인 금액이 표시됩니다.

> 쿠폰 선택 - 쿠폰 선택 시 비동기로 금액에서 할인율을 계산해 할인이 적용된 금액이 표시됩니다.

<img src="https://github.com/duswo5310/finalproject/blob/master/images/member_review.png" width="1000px">&nbsp;

- ### 회원 리뷰 창

> 회원이 리뷰 창으로 들어갈 경우 해당 지점에 등록되어 있는 리뷰제목들을 볼 수 있습니다.

> 리뷰를 누를 시 상세보기를 볼 수 있으며 내가 작성한 글은 수정/삭제 할 수 있습니다.

> 내가 작성한 글이 아닐 경우에 😊/😡(공감/비공감)으로 참여가 가능합니다. (중복은 불가 / 공감 또는 비공감 중에 하나만 선택 가능)

> 비동기로 실시간 😊/😡(공감/비공감)개수가 업데이트 됩니다.
 
> 리뷰 작성을 누를 시 비동기로 이용권 구매이력을 확인합니다.<br>
> --> 이용권 구매 이력이 있을 시 리뷰 작성할 수 있는 모달이 뜹니다.<br> 
> --> 수정도 모달로 수정창이 뜹니다.

> 이용권 구매이력이 없는 회원이 리뷰등록하려하면 alert으로 두번째 사진의 창이 뜹니다.

<img src="https://github.com/duswo5310/finalproject/blob/master/images/inout.png" width="1000px">&nbsp;

- ### 회원 좌석 입실 및 퇴실

> 이용권을 보유한 회원에 한해서 좌석입실이 가능합니다.

> 좌석을 누를 시 비동기로 이용권 유무를 확인해 이용권이 없는 회원에게는 '이용권 구매 후 이용해주세요'라는 alert이 뜹니다.

> 좌석선택을 완료하면 완료한 좌석의 색이 주황색(🟠)으로 변하게 됩니다. ( 다른 회원에게는 회색(⚫))

> 퇴실하기를 누르면 퇴실하시겠습니까? 퇴실이 완료 되며 <br>
> confirm창이 뜨면서 확인을 누를 시 다시 주황색(🟠) -> 선택가능한 흰색(⚪)으로 표시가 됩니다.

> 퇴실 시 비동기로 이용시간과 보유시간을 비교해 보유시간<이용시간 일 경우 추가결제 페이지로 넘어갑니다. 

<img src="https://github.com/duswo5310/finalproject/blob/master/images/user_message.png" width="1000px">&nbsp;

- ### 회원 쿠폰함과 메세지 수신함

> 쿠폰함으로 들어가면 회원이 보유하고 있는 쿠폰들이 나옵니다. 실제 결제에서도 사용 가능합니다.

> #### 메세지

> 확인 안된 메세지의 개수를 label로 빨갛게 ✉ 메세지 모양 위에 뜹니다. 

> 메세지 수신함에 들어가면 해당 회원에게 수신된 메세지들이 최신순이면서 확인 안한 메세지는 위쪽에 뜨게 되고, 확인 안한 메세지는 위쪽에 굵은 글씨로 뜨게됩니다.

> 확인할 시 얇은 글씨로 바뀌면서 최신순으로 정렬됩니다. 또한 확인안한 메세제의 개수를 나타내는 label의 개수가 바뀌게 됩니다.

> 메세지를 클릭 시 메세지 내용이 모달로 뜨면서 삭제가 가능합니다.

<img src="https://github.com/duswo5310/finalproject/blob/master/images/story.png" width="1000px">

- ### 모두가 볼 수 있느 지점 목록 및 회원의 마일리지/결제 내역 창

>#### 지점 스토리<br>
> 지점스토리를 누를 시 볼 수 있는 전국 지점이고 지점상세보기를 눌렀을 때 볼 수 있는 페이지 입니다. <br>
> 사진은 swiper로 등록된 사진이 한장씩 넘어갑니다.<br>
> 지도는 kakao map api로 구현했습니다.<br>

>#### 마일리지 내역조회
> 내가 받은 마일리지를 일주일/한달/3달 단위로 조회할 수 있습니다.<br>

>#### 결제 내역 조회
> 내가 결제한 내역을 일주일/한달/3달 단위로 조회할 수 있습니다.<br>
> 결제번호를 클릭 시 결제한 상세내역을 볼 수 있습니다.<br>
> 결제취소를 누를 경우에 해당 결제건을 취소할 수 있습니다.


## 🌗 마치며 
<a href="https://github.com/duswo5310/finalproject/blob/master/finalPPT.pdf">portfolio 바로가기 </a>

<p>
Java라는 프로그래밍 언어를 배우면서 습득한 지식들을 활용하여 만든 프로젝트입니다. 
분명 아쉬운 부분들이 많이 존재하지만 가지고 있는 지식을 최대한 담아내기 위해서 팀원들과 많이 노력했습니다.
프로젝트 일정은 종료되었지만 좀 더 좋은 프로그램이 될 수 있도록 업데이트할 수 있도록 노력하겠습니다.
</p>
