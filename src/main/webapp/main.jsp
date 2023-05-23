<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<%@ include file="../head.jsp"%>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "482195be-003f-4845-a69f-7e3702ca7231"
  });
</script>
<script type="text/javascript">
$('document').ready(function() {
	//지역 변수생성
	
	 var area0 = ["시/도 선택","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구","북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	
	 // 시/도 선택 박스 초기화
	 $("select[name^=sido]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	
	 // 시/도 선택시 구/군 설정
	 $("select[name^=sido]").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).next(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화
	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });
	var modelList;// = JSON.parse('${modelList}');
	var colorList;// = JSON.parse('${colorList}');
	$.ajax({
		type: "GET",
		url: "./GetModelList.pr",
		contentType : "application/json;charset=UTF-8",
		success: function(data) {
			modelList = data[0];
			colorList = data[1];
			console.log(data);
		},
		error: function(data) {
			alert("정보를 받아올 수 없습니다.");
		}
	});
	 $('#brand').change(function () {
		if($('#brand').val() == "1"){
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			$.each(modelList,function(idx, obj){
				console.log(obj.model_id);
				console.log(obj.model);
				if(obj.model_id>5) return false;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected apple
		}else if($('#brand').val() == "2"){
			// Init selectBox
			$('#model option').remove();
			$('#color option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
			$('#color').append("<option value=''>색상을 선택하세요</option>");
			// add values
			$.each(modelList,function(idx, obj){
				if(obj.model_id<6) return true;
				$('#model').append("<option value='"+obj.model_id+"'>"+ obj.model + "</option>");
			}); // selected samsung
		}else{
			$('#model option').remove();
			$('#model').append("<option value=''>모델명을 선택하세요</option>");
		}//미선택시
	});//특정 브랜드 선택시 모델옵션 변경
	
	 $('#model').change(function() {
		$('#color option').remove();
		$('#color').append("<option value=''>색상을 선택하세요</option>");
		 var color = "";
		$.each(modelList,function(idx, obj){
// 			alert("color : " + obj.color+ "/ model id : " + obj.model_id + "/ model val : " + $('#model').val());
			if(obj.model_id == $('#model').val()) {
				color = obj.color;
				return false;
			}
		}); // get Colors by Model
		var colorArr = color.split("/");
		$.each(colorList,function(idx, obj){
			$.each(colorArr, function(idx, colorEle){
				if(obj.color_id == colorEle) {
					$('#color').append("<option value='"+obj.color_id+"'>"+obj.color+"</option>");
				}
			});
		});
	 });
	
	$('#trade').change(function() {
		if($('#trade').val()=="1"){
			$('#trmsg').hide();
			$('#sido1').show();
			$('#gugun1').show();
		}else{
			$('#trmsg').show();
			$('#trmsg').text(" (직거래만 가능합니다.)");
			$('#sido1').hide();
			$('#gugun1').hide();
		}//택배거래 선택시 지역선택 못하게함
	});
});//script끝
	function closeModal() {
	  document.getElementById("mainModal").style.display = "none";
	}
	
	function checkData() {
		if('${id}' == "") {
			alert("로그인을 해주세요");
			return false;
		}
		const eleArr = ['#brand', '#model', '#color', '#parts','#trade'];
		var condition = 0;
		var str = "?";
		$.each(eleArr, function(idx, selector) {
			if($(selector).val() == "") {
				alert("검색조건을 선택하세요");
				$(selector).focus();
				condition = 1;
				return false;
			}
			str += selector.substr(1) + "="+ $(selector).val() + "&";
		});
		if(condition == 1) {
			return false;
		}
		if($('#trade').val()=="1"){
			if($('#sido1').val() == "") {
				alert("시/도를 선택하세요");
				$('#sido1').focus();
				return false;
			}
			if($('#gugun1').val() == "") {
				alert("시/도를 선택하세요");
				$('#gugun1').focus();
				return false;
			}
			str+= "sido1=" + $('#sido1').val() + "&";
			str+= "gugun1=" + $('#gugun1').val() + "&";
		}
		openModal(str.substr(0, str.length-1));
	}	
	
	// 메인 모달 함수
	function openModal(str) {
	  document.getElementById("mainModal").style.display = "block";
	  $('#mainModal').append(
	  
	    '<div class="modal-content">' +
	    '<span class="close" onclick="closeModal()">&times;</span>' +
	    '<iframe src="./ProductList.pr' + str + '"></iframe>' +
	    '</div>'
	  );

	  // 모달 창 외부 클릭 시 이벤트 처리
	  var modal = document.getElementById("mainModal");
	  window.onclick = function (event) {
	    if (event.target == modal) {
	      closeModal();
	    }
	  };
	}

	// 모달 창 닫기 함수
	function closeModal() {
	  document.getElementById("mainModal").style.display = "none";
	  // 모달 내용 초기화
	  $('#mainModal').empty();
	}

    //script 끝

</script>


<style>


.typewriter {
	width: 14.5ch;
	white-space: nowrap;
	overflow: hidden;
	border-right: 4px solid #212121;
	animation: cursor 1s step-start infinite, 
    text 2.5s steps(18) alternate infinite;
}

@keyframes cursor {
	0%, 100% { 
    border-color: #212121; 
  }
}

@keyframes text {
	0% { 
    width: 0; 
  }
	100% { 
    width: 19.5ch;
  }
}

</style>

</head>
<body style="font-family: 'TheJamsil5';">
<%@ include file="../nav.jsp"%><!-- nav 삽입 -->

<!-- END head -->

<section class="site-hero overlay"
	style="background-image: url(https://images.pexels.com/photos/8024034/pexels-photo-8024034.jpeg?auto=compress&cs=tinysrgb&w=1600)"
	  data-stellar-background-ratio="0.5">
	<div class="container">
		<div
			class="row site-hero-inner justify-content-center align-items-center">
			<div class="col-md-10 text-center" data-aos="fade-up">
				<h1 style=" font-family: 'Noto Sans KR', sans-serif; color: white;"><span style="border: 5px solid; padding: 8px;">CODE LESS</span></h1>
				<h5 style=" font-family: 'Noto Sans KR', sans-serif; color: white; margin-top: 30px;"><b>이어폰의 짝을 찾아주는 신개념 중고거래 , 코드리스</b></h5>
			<!-- 	<h5 class="heading"></h5> -->
			</div>
		</div>
	</div>

</section>
<!-- END section -->

<section class="section pb-0" id="match">
	<div class="container">
		<div class="row check-availabilty" id="next">
			<div class="block-32" data-aos="fade-up" data-aos-offset="-200" style="background-color:#FAFAFA; box-shadow: 0 30px 30px rgba(0, 0, 0, 0.2);border: 5px solid;border-color: #FFBA5A; ">
					<h4 style=" font-family: 'TheJamsil5Bold'; color: black;" class="typewriter">새로운 짝을 매칭해보세요!</h4>
					<hr style="border: 0; height: 3px; background-color: black; margin-bottom: 40px;">
				<form action="#" >
					
					<div class="row" >
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3" >
							<label for="checkin_date" class="font-weight-bold text-black">제조사</label>
								<select name="" id="brand" class="form-control">
									
									<option value="">제조사를 선택하세요</option>
									<option value="1">애플</option>
									<option value="2">삼성</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkin_date" class="font-weight-bold text-black">모델명</label>
								<select name="" id="model" class="form-control" style="">	
								<option value="">모델명을 선택하세요</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">색상</label>
								<select name="" id="color" class="form-control">
									<option value="">색상을 선택하세요</option>
								</select>
						</div>
						<div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
							<label for="checkout_date" class="font-weight-bold text-black">좌우선택</label>
								<select name="" id="parts" class="form-control">
									<option value="">좌우를 선택하세요</option>
									<option value="left">좌</option>
									<option value="right">우</option>
									<option value="body">본체</option>
								</select>
							
						</div>
						<hr>
						<div class="col-md-12 mb-0 mb-md-0 col-lg-0"
							style="margin-top: 40px;">
							<div class="row">
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="adults" class="font-weight-bold text-black">거래방법</label>
										<select name="" id="trade" class="form-control">
											<option value="">거래방법을 선택하세요</option>
											<option value="1">직거래</option>
											<option value="2">택배</option>
										</select>
									
								</div>
								<div class="col-md-6 mb-3 mb-md-0">
									<label for="" class="font-weight-bold text-black">지역선택</label></label><span id="trmsg" style="color: red;"> </span>
									
										<select name="sido1" id="sido1" class="form-control"></select>	
										<select name="gugun1" id="gugun1" class="form-control" style="margin-top: 10px;"></select>			
								</div>
							</div>
						</div>
						<br>
						<input type="button" value="검색하기" class="btn btn-primary text-white" style="width: 500px; margin:auto; margin-top: 50px;" onclick="checkData();" id="matbutton">
					</div>
				</form>
			</div>
		</div>
	</div>
</section>

<section class="section">
	<div class="container">
	<div class="row justify-content-center text-center mb-5">
	  <div class="col-md-7" style="margin-bottom: 50px;">
	  <h2 data-aos="fade-up" style="font-family:'TheJamsil5'; color: #FFC257"><b>새로운 매칭서비스</b></h2>
		<h1 data-aos="fade-up" style="font-family:'TheJamsil5';"><b>코드리스는 어떤 서비스인가요?</b></h1>
	   <!-- <p data-aos="fade-up" data-aos-delay="100"></p> -->
	  </div>
	</div>
<div class="row">
<div class="col-md-12 col-lg-4" data-aos="fade-up">
		<img src="images/airpot.jpg" alt="your-image" style="max-width: 400px;max-height: 300px">
			</div>
			<div class="col-md-6 col-lg-8"data-aos="fade-up">
			<p style="font-size: 20px;"><br><br>"코드리스(CODELESS)"는 <span style="box-shadow: inset 0 -10px 0 #F9F19D;">짝을 잃어버린 무선이어폰을 다시 잇는 소중한 공간</span>입니다.
			<br>잃어버린 사람들만의 이야기를 만들어가며, 서로를 돕고 응원하는 경험을 해보세요.<br>
			코드리스와 함께라면 음악과 추억을 계속해서 나눌 수 있어요.</p>
			<button type="button" onclick="location.href='./ProductWrite.pr';" class="btn btn-primary" style="display: inline-block;">상품 등록</button>
		</div>
		</div>
	</div>
		</section><!-- 섹션1 끝-->

  <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7" style="margin-bottom: 50px;">
          	
             <h2 data-aos="fade-up" style="font-family:'TheJamsil5'; color: #FFC257"><b>코드리스 이용자를 위한</b></h2>
             <h1 data-aos="fade-up" style="font-family:'TheJamsil5';"><b>체계적인 이용단계</b></h1>
           <!--  <p data-aos="fade-up" data-aos-delay="100"></p> -->
          </div>
        </div>
        <div class="row">
        
                  <div class="col-md-6 col-lg-3" data-aos="fade-up">
           
             <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185655.png" alt="your-image">
  <h2>매칭하기</h2>
  <p>브랜드, 모델, 색상, 짝 등</p>
  <p>원하는 옵션을 선택하여</p>
  <p> 매칭을 시작하세요!</p>
  <p>(로그인 후 이용가능)</p>
</div>
            
          </div>
        
          <div class="col-md-6 col-lg-3" data-aos="fade-up">
          
                      <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185572.png" alt="your-image">
  <h2>주문서작성</h2>
  <p>원하는 상품을 선택 후, <br>주문서를 작성하세요<br>(택배거래만 해당)</p>
</div>
            
          </div>


          <div class="col-md-6 col-lg-3" data-aos="fade-up">
        
                             <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185633.png" alt="your-image">
  <h2>채팅하기</h2>
  <p>관심 있는 물건의 판매자와</p>
  <p>실시간으로 소통할 수 있는</p>
  <p>채팅이 가능합니다</p>
</div>
              </div>
           
          
          
                    <div class="col-md-6 col-lg-3" data-aos="fade-up">
           <div class="image-with-text text-center">
  <img src="https://cdn-icons-png.flaticon.com/128/4185/4185445.png" alt="your-image">
  <h2>거래완료</h2>
  <p>구매자가 물건을 수령한 뒤에</p>
  <p>거래완료할 수 있어 <br>보다 안전합니다</p>
  <p></p>
</div>
          </div>


        </div>
      </div>
    </section>
    
  
    <section class="section testimonial-section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
              <h2 data-aos="fade-up" style="font-family:'TheJamsil5'; color: #FFC257"><b>탁월한 선택의</b></h2>
            <h1 data-aos="fade-up" style="font-family:'TheJamsil5';"><b>코드리스 이용 후기</b></h1>
          </div>
        </div>
        <div class="row">
          <div class="js-carousel-2 owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
            
            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001799.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;코드리스와 함께하면서</p>
                <p>제 인생의 반이 채워졌어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;최*원</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001775.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
                <p>&ldquo;한쪽만 잃어버렸는데</p>
                 <p>한쪽만 구매할 수 있어서 편해요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;서*찬</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001817.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>

                <p>&ldquo;한쪽만 없어서 팔고싶었는데</p>
                 <p>코드리스덕에 편하게 팔았어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash;양*영</em></p>
            </div>


            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001799.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;직거래와 택배거래 둘다 가능해서</p>
                 <p>편하게 거래할 수 있었어요!&rdquo;</p>
             </blockquote>
              <p><em>&mdash; 이*연</em></p>
            </div> 

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001775.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;새거 사기는 부담스러웠는데</p>
                 <p>중고로 싸게사서 좋았어요!&rdquo;</p>	
              </blockquote>
              <p><em>&mdash; 임*희</em></p>
            </div>

            <div class="testimonial text-center slider-item">
              <div class="author-image mb-3">
                <img src="https://cdn-icons-png.flaticon.com/128/3001/3001758.png" alt="Image placeholder" class="rounded-circle mx-auto">
              </div>
              <blockquote>
				 <p>&ldquo;원하는 옵션으로만 매칭이 가능해서</p>
                 <p>편하게 이용했어요!&rdquo;</p>
              </blockquote>
              <p><em>&mdash; 나*우</em></p>
            </div>

          </div>
        </div>

      </div>
    </section>
    


    <section class="section bg-image overlay" style="background-image: url(images/background-6556414_1920.jpg)">
        <div class="container" >
          <div class="row align-items-center">
            <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
              <h2 class="text-white"  style="font-family:'TheJamsil5';">지금 바로 매칭을 시작해보세요!</h2>
            </div>
            <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
              <a href="#match" class="btn btn-outline-white-primary py-3 text-white px-5">매칭하러 가기</a>
            </div>
          </div>
        </div>
      </section> <!-- 섹션4 끝  -->


	<%@include file="../footer.jsp"%>



<div id="mainModal" class="modal" style=" backdrop-filter: blur(1rem);">
<!--   <div class="modal-content"> -->
<!--     <span class="close" onclick="closeModal()">&times;</span> -->
<!--     <iframe src="./ProductList.pr"></iframe> -->
<!--   </div> -->
</div>


<!-- <script src="js/jquery-3.3.1.min.js"></script> -->
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/jquery.fancybox.min.js"></script>


<script src="js/aos.js"></script>

<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>

<script src="js/main.js"></script>
</body>
</html>