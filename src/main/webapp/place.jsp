<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/Web_project1/bootstrap-5.1.3-dist/css/uikit.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="EUC-KR">
<style>
img {
	margin-left:650px;
	margin-top:30px;
	float:right;
	width:40px;
	height:40px;
}
</style>
<script type="text/javascript">
state = 0;
function changeImage() {
    if ( state == 0 ) {
        state = 1;
        document.getElementById('image').src = "/img/full_heart.png";
    }
    else {
        state = 0;
        document.getElementById('image').src = "/img/empty_heart.png";
    }
}
function changeMap(){
	
}
</script>
</head>
<body style="height:100%;">
<div style="border:2px solid gray;padding:10px;padding-left:20px;width:80%;justify-content:center;text-align:center;display:flex;margin-left:170px;" id="restaurant">
<div class="form-check form-check-inline" >
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
  <label class="form-check-label" for="inlineRadio1">박물관</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
  <label class="form-check-label" for="inlineRadio2">식물원</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
  <label class="form-check-label" for="inlineRadio3">문화</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
  <label class="form-check-label" for="inlineRadio3">자연</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
  <label class="form-check-label" for="inlineRadio3">쇼핑</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
  <label class="form-check-label" for="inlineRadio3">전체</label>
</div>
<button type="button" class="btn btn-outline-info">Search</button>
</div>
<hr>
<div style="float:left;width:50%;margin-left:50px;margin-bottom:50px;">
<div class="col">
          <div class="card shadow-sm" style="float:left;">
            <svg class="bd-placeholder-img card-img-top" style="width:100%;height:225;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            
              </div>
              <div class="card-body card shadow-sm" style="height:227px;">
              <p>경주 첨성대d fdsfsdf</p>
              <img id="image" onclick="changeImage()" src="/img/empty_heart.png">
                </div>
            </div>
          </div>
<div>
<div style="float:left;width:50%;margin-left:50px;margin-bottom:50px;">
<div class="col">
          <div class="card shadow-sm" style="float:left;">
            <svg class="bd-placeholder-img card-img-top" style="width:100%;height:225;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

              </div>
              <div class="card-body card shadow-sm" style="height:227px;">
              <p>경주 첨성대d fdsfsdf</p>
              <img id="image" onclick="changeImage()" src="/img/empty_heart.png">
                </div>
                
            </div>
          </div>  
<div style="float:left;width:50%;margin-left:50px;margin-bottom:50px;">
<div class="col">
          <div class="card shadow-sm" style="float:left;">
            <svg class="bd-placeholder-img card-img-top" style="width:100%;height:225;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            
              </div>
              <div class="card-body card shadow-sm" style="height:227px;">
              <p>경주 첨성대d fdsfsdf</p>
              <img id="image" onclick="changeImage()" src="empty_heart.png">
                </div>
            </div>
          </div>
<div style="float:left;width:50%;margin-left:50px;margin-bottom:50px;">
<div class="col">
          <div class="card shadow-sm" style="float:left;">
            <svg class="bd-placeholder-img card-img-top" style="width:100%;height:225;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            
              </div>
              <div class="card-body card shadow-sm" style="height:227px;">
              <p>경주 첨성대d fdsfsdf</p>
              <img id="image" onclick="changeImage()" src="empty_heart.png">
                </div>
            </div>
          </div>
<div style="float:left;width:50%;margin-left:50px;margin-bottom:50px;">
<div class="col">
          <div class="card shadow-sm" style="float:left;">
            <svg class="bd-placeholder-img card-img-top" style="width:100%;height:225;" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

            
              </div>
              <div class="card-body card shadow-sm" style="height:227px;">
              <p>경주 첨성대d fdsfsdf</p>
              <img id="image" onclick="changeImage()" src="empty_heart.png">
                </div>
            </div>
          </div>   

 </div>  
  <hr style="display:inline-block;height:1330px;width:7px;border-right:0px;margin-left:100px;">   
  <div style="width:300px;height:70px;background-color:gray;display:inline-block;float:top;" location.href="search.jsp">
  
  </div>      
</body>
</html>