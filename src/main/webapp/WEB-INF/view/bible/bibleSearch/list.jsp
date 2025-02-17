<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>

<script>

function bookOrdrListChange(v){
	
	//alert(v.value);
	/* 
	$.post("/bible/bookOrdrListChange.do",
	  {bookAf: v.value},
	  function(data, status){
	    //alert("Data: " + data + "\nStatus: " + status);
	    console.log(data);
	    
	  }, "json");
	 */
	 
	// 데이터 형식
	var dataMap = {bookAf: v.value};
	// data json 문자열 화
	var jsonString = JSON.stringify(dataMap);

	// server에 요청
	$.ajax({
		type: 'POST',
		url : "<c:url value='/bible/bookOrdrListChange.do'/>",
		data: {"bookAf": v.value},
		dataType:'json' , 
		success: function(data){
			//작업이 성공적으로 발생했을 경우
			console.log("ss");
			//console.log(data);
			
			var innerHtml = "";
        	//var innerReply = "";
        	//var innerPaging = "";
        	var length = data['selectBibleBookOrdrList'].length;
        	if(length > 0) {
        		$.each(data['selectBibleBookOrdrList'], function(i) {
        			innerHtml += '<option value='+data['selectBibleBookOrdrList'][i].bookSeq+'>'+data['selectBibleBookOrdrList'][i].bookNm+'</option>';  
        		})
        		$("#bookSeq").html(innerHtml);
        	}
		},
		error:function(){  
            //에러가 났을 경우 실행시킬 코드
			console.log('ee');
		}
	});
	
	
}

function bookOrdrJangCtChange(v){
	
	// 데이터 형식
	//var dataMap = {bookAf: v.value};
	// data json 문자열 화
	//var jsonString = JSON.stringify(dataMap);

	// server에 요청
	$.ajax({
		type: 'POST',
		url : "<c:url value='/bible/bookOrdrJangCtChange.do'/>",
		data: {"bookSeq": v.value},
		dataType:'json' , 
		success: function(data){
			//작업이 성공적으로 발생했을 경우
			console.log("ss");
			//console.log(data);
			
			var innerHtml = "";
        	//var innerReply = "";
        	//var innerPaging = "";
        	var length = data['selectBibleSearchJangCt'].length;
			var chapter = 0;
        	if(length > 0) {

				//chapter = data['selectBibleSearchJangCt'][i].chapter;
				//for(var i=0; i<verseCt; i++){
				//	innerHtml += '<option value='+(i+1)+'>'+(i+1)+'</option>';
				//}
				
				innerHtml += '<option value="">'+'전체'+'</option>';
        		$.each(data['selectBibleSearchJangCt'], function(i) {
        			innerHtml += '<option value='+data['selectBibleSearchJangCt'][i].chapter+'>'+data['selectBibleSearchJangCt'][i].chapter+'</option>';  
        		})
				

        		$("#chapter").html(innerHtml);
				$("#chapter2").html(innerHtml);

				$("#verse").html('<option value="">'+'전체'+'</option>');
				$("#verse2").html('<option value="">'+'전체'+'</option>');

        	}
		},
		error:function(){  
            //에러가 났을 경우 실행시킬 코드
			console.log('ee');
		}
	});
	
	
}


function bookOrdrJurCtChange(v,t){
	
	// 데이터 형식
	//var dataMap = {bookAf: v.value};
	// data json 문자열 화
	//var jsonString = JSON.stringify(dataMap);

	var chapter = document.search.chapter.value;
	//console.log('chapter:'+chapter);

	if(t == 1){
		chapter = document.search.chapter.value;
	}else{
		chapter = document.search.chapter2.value;
	}


	// server에 요청
	$.ajax({
		type: 'POST',
		url : "<c:url value='/bible/bookOrdrJangCtChange.do'/>",
		data: {"chapter": v.value, "chapter":chapter},
		dataType:'json' , 
		success: function(data){
			//작업이 성공적으로 발생했을 경우
			console.log("ss");
			//console.log(data);
			
			var innerHtml = "";
        	//var innerReply = "";
        	//var innerPaging = "";
        	var length = data['selectBibleSearchJangCt'].length;
			var verseCt = 0;
        	if(length > 0) {

				verseCt = data['selectBibleSearchJangCt'][0].verseCt;
				innerHtml += '<option value="">'+'전체'+'</option>';
				for(var i=0; i<verseCt; i++){
					innerHtml += '<option value='+(i+1)+'>'+(i+1)+'</option>';
				}
				
				
        		//$.each(data['selectBibleSearchJangCt'], function(i) {
        		//	innerHtml += '<option value='+data['selectBibleSearchJangCt'][i].chapter+'>'+data['selectBibleSearchJangCt'][i].chapter+'</option>';  
        		//})
				
				if(t == 1){
					$("#verse").html(innerHtml);
				}else{
					$("#verse2").html(innerHtml);
				}
        		
				
        	}
		},
		error:function(){  
            //에러가 났을 경우 실행시킬 코드
			console.log('ee');
		}
	});
	
	
}








function btweenYn123(V){
	alert(v);
	
}

function bibleReset(){
	document.location.href = "/bible/bibleSearch/list.do";
}

function bibleSearch(){
	
	
	var bookAf = $("#bookAf").val();
	var bookSeq = $("#bookSeq").val();
	var btweenYn = $("input:radio[name=btweenYn]:checked").val();
	var chapter = $("#chapter").val();
	var verse = $("#verse").val();
	var chapter2 = $("#chapter2").val();
	var verse2 = $("#verse2").val();
	var searchKeyword = $("#searchKeyword").val();
	
	
	// 데이터 형식
	var dataMap = {
			bookAf: bookAf
			,bookSeq: bookSeq
			,btweenYn: btweenYn
			,chapter: chapter
			,verse: verse
			,chapter2: chapter2
			,verse2: verse2
			,searchKeyword: searchKeyword
	};
	// data json 문자열 화
	var jsonString = JSON.stringify(dataMap);
	//console.log(dataMap);
	//console.log(jsonString);
	
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	//console.log(token);
	//console.log(header);
	
	//var name = $("#userName").val();
	
	
	// server에 요청
	$.ajax({
		type: 'POST',
		url : "<c:url value='/bible/bibleSearch.do'/>",
		data: jsonString,
		contentType: 'application/json; charset=utf-8',
		//dataType:'json',
		cache : false,
		success: function(data){
			//작업이 성공적으로 발생했을 경우
			console.log("ss");
			//console.log(data);
			
			var innerHtml = "";
        	//var innerReply = "";
        	//var innerPaging = "";
        	var length = data['selectBibleSearchList'].length;
        	var content = "";
        	var chapter = "";
        	var verse = "";
        	
        	if(length > 0) {
        		
        		innerHtml += '<ul>';
        		$.each(data['selectBibleSearchList'], function(i) {
        			content = data['selectBibleSearchList'][i].content;
        			chapter = data['selectBibleSearchList'][i].chapter;
        			verse = data['selectBibleSearchList'][i].verse;
        			
        			innerHtml += '<li style="list-style: none;">'+content + ' - ' + '<a href="javascript:void(0);" onclick="txtAdd(\''+content+' - ('+chapter+'장 '+verse+'절)'+'\');">('+chapter+'장 '+verse+'절)</a></li>';
        			
        		})
        		innerHtml += '</ul>';
        		//console.log(innerHtml);
        		
        		$("#bibleList").html(innerHtml);
        		//$("#bibleList").hide();
        		
        	}
		},
		error:function(){
            //에러가 났을 경우 실행시킬 코드
			console.log('ee');
		}
	});
	
	
}


function enterkey() {
	//alert('1222');

}

document.addEventListener("keydown", function(event) {
  if (event.key === "Enter") {
    event.preventDefault();
  }
});

</script>

<h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light"> PAGES /</span> 말씀 찾기</h4>

<form id="search" name="search" method="post" action='#' onSubmit='return bibleSearch()' >
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">



<div class="row">
	<div class="col-md-12">
      <div class="card mb-4">
        <!-- <h5 class="card-header">[말씀 찾기]</h5> -->
        <div class="card-body">
          
          	<div>
				<div class="form-check form-check-inline mb-3">
		          <input
		            class="form-check-input"
		            type="radio"
		            name="btweenYn" id="btweenN" value="N" <c:if test="${btweenYn eq 'N' }">checked="checked"</c:if> <c:if test="${empty btweenYn}">checked="checked"</c:if>
		          />
		          <label class="form-check-label" for="btweenN">단일지정</label>
		        </div>
		        <div class="form-check form-check-inline">
		          <input
		            class="form-check-input"
		            type="radio"
		            name="btweenYn" id="btweenY" value="Y" <c:if test="${btweenYn eq 'Y' }">checked="checked"</c:if>
		          />
		          <label class="form-check-label" for="btweenY">범위지정</label>
		        </div>
	        	
        	</div>
        	
			${bibleDto}
			
			<!-- <label for="exampleFormControlSelect1" class="form-label">Example select</label> -->
              <select class="form-select w-auto mx-1" name="bookAf" id="bookAf" onchange="bookOrdrListChange(this);" aria-label="Default select example" style="float: inline-start;">
                <c:forEach var="code" items="${selectBibleBookAfList }" varStatus="status">
					<option value="${code.bookAf }" <c:if test="${code.bookAf eq bookAf }">selected="selected"</c:if>>${code.bookAfNm }</option>
				</c:forEach>
              </select>
            
            
			<%-- <input type="text" name="chapter" value="${chapter}"> --%>
			<select class="form-select w-auto mx-1" name="bookSeq" id="bookSeq" onchange="bookOrdrJangCtChange(this);" aria-label="Default select example" style="float: inline-start;">
				<!-- <option value="">선택</option> -->
				<c:forEach var="code" items="${selectBibleBookOrdrList }" varStatus="status">
					<option value="${code.bookSeq }" <c:if test="${code.bookSeq eq bookSeq }">selected="selected"</c:if>>${code.bookNm }</option>
				</c:forEach>
			</select>
			
			<!--${selectBibleSearchJangCt.get(0).verseCt}-->
			<!--<c:choose>
				<c:when test="${empty chapter}">
					<c:set var="JangCt" value="${selectBibleSearchJangCt.get(0).verseCt}"></c:set>
				</c:when>
				<c:otherwise>
					<c:forEach var="data" items="${selectBibleSearchJangCt}" varStatus="status">
						<c:if test="${selectBibleSearchJangCt.chapter eq chapter}">
							<c:set var="JangCt" value="${selectBibleSearchJangCt.verseCt}"></c:set>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>-->
			
			<select class="form-select w-auto mx-1" name="chapter" id="chapter" onchange="bookOrdrJurCtChange(this,1);" aria-label="Default select example" style="float: inline-start;">
				<option value="">전체</option>
				<c:forEach var="data" begin="1" end="${fn:length(selectBibleSearchJangCt)}" varStatus="status">
					<option value="${data}" <c:if test="${data eq chapter}">selected="selected"</c:if>>${data}</option>	
				</c:forEach>
			</select>


			<select class="form-select w-auto mx-1" name="verse" id="verse" aria-label="Default select example" style="float: inline-start;">
				<option value="">전체</option>
				<!--<c:forEach var="data" begin="1" end="31" varStatus="status">
					<option value="${data}" <c:if test="${data eq verse}">selected="selected"</c:if>>${data}</option>	
				</c:forEach>-->
			</select>


			<div id="d1" style="display: none;">
				
				<select class="form-select w-auto mx-1" name="chapter2" id="chapter2" onchange="bookOrdrJurCtChange(this,2);" aria-label="Default select example" style="float: inline-start;">
					<option value="">전체</option>
					<c:forEach var="data" begin="1" end="${fn:length(selectBibleSearchJangCt)}" varStatus="status">
						<option value="${data}" <c:if test="${data eq chapter}">selected="selected"</c:if>>${data}</option>	
					</c:forEach>
				</select>
	
	
				<select class="form-select w-auto mx-1" name="verse2" id="verse2" aria-label="Default select example" style="float: inline-start;">
					<option value="">전체</option>
					<!--<c:forEach var="data" begin="1" end="31" varStatus="status">
						<option value="${data}" <c:if test="${data eq verse}">selected="selected"</c:if>>${data}</option>	
					</c:forEach>-->
				</select>

			</div>
			





			<!--
			<input class="form-control w-25 mx-1" type="text" placeholder="장" aria-label=".form-control-lg example" id="chapter" name="chapter" size="4" maxlength="4" value="${chapter}" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" style="float: inline-start;width: 5% !important;">
			<input class="form-control w-25 mx-1" type="text" placeholder="절" aria-label=".form-control-lg example" id="verse" name="verse" size="4" maxlength="4" value="${verse}" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" style="float: inline-start;width: 5% !important;">
					
			
			<div id="d1" style="display: none;">
				<input class="form-control w-25 mx-1" type="text" placeholder="장" aria-label=".form-control-lg example" id="chapter2" name="chapter2" size="4" maxlength="4" value="${chapter2}" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" style="float: inline-start;width: 5% !important;">
				<input class="form-control w-25 mx-1" type="text" placeholder="절" aria-label=".form-control-lg example" id="verse2" name="verse2" size="4" maxlength="4" value="${verse2}" oninput="this.value=this.value.replace(/[^0-9.]/g,'').replace(/(\..*)\./g,'$1');" style="float: inline-start;width: 5% !important;">
			</div>
			-->

			<input class="form-control w-auto mx-1" type="text" placeholder="검색어" aria-label=".form-control-lg example" id="searchKeyword" name="searchKeyword" size="4" maxlength="4" value="${searchKeyword}" style="float: inline-start;width: 10% !important;">
			<!-- <a href="javascript:void(0);" onclick="bibleSearch();" class="btn btn-outline-primary" style="float: inline-start;">조회</a> -->
			<button type="button" class="btn btn-sm rounded-pill btn-primary" onclick="javascript:bibleSearch();" style="margin-top: 5px;">조회</button>
			<button type="button" class="btn btn-sm rounded-pill btn-primary" onclick="javascript:bibleReset();" style="margin-top: 5px;">초기화</button>
			
			
			
			<p><div id="bibleList"></div></p>
			
        </div>
      </div>
    </div>
	
</div>
</form>


<script type="text/javascript">

$(document).ready(function(){
	
	$("input:radio[name=btweenYn]").click(function(){
		
		if($("input:radio[name=btweenYn]:checked").val()=='Y'){
			//$("#hostOption").attr("disabled",false);
			//$("#hostOption").removeClass("readonly");
			$("#d1").show();
		}else{
			//$("#hostOption").attr("disabled",true);
			//$("#hostOption").addClass("readonly");
			$("#d1").hide();
		}
	});
});




</script>
