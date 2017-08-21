 {{if .IsUserIndex}}
<div class="compare-footer1">
<div class="container">
<div class="row">
<div class="col-xs-6 pt10 wow bounceInLeft" data-wow-delay="0.3s">
<p>△以第一列为基准，计算溢价比例，如果第一列没有数据，则以第二列、第三列...</p>
<p>△后台数据每3秒更新一次，页面数据每3秒自动刷新一次</p>
<p>△汇率每3秒更新一次</p>
<p>△溢价率=(对比平台市价-参考平台市价)/参考平台市价</p>
</div>

<div class="col-xs-6 pt10 wow bounceInRight" data-wow-delay="0.3s">
<p>△以第一列为基准，计算溢价比例，如果第一列没有数据，则以第二列、第三列...</p>
<p>△后台数据每3秒更新一次，页面数据每3秒自动刷新一次</p>
<p>△汇率每3秒更新一次</p>
<p>△溢价率=(对比平台市价-参考平台市价)/参考平台市价</p>
</div>
</div>

<div class="row ">
<p class="text-center" style="color:white;"> 欢迎拍砖，欢迎打赏 0:)
比特币: 33qFFGTkynmbvBxAnW4TKDg3YvFXKDLmUg</p> 
</div>
</div>
</div>


<div class="compare-footer2">
<div class="container">
<p class="text-center" style="margin: 10px 0 10px;">{{.AllFrontInfo.WebsiteFooterContent}}</p>
</div>
</div>
{{end}}
</body>

  {{if .IsUserLogin}}
<script src="/static/js/aj.js"></script>
<script src="/static/js/layer.js"></script>
<script type="text/javascript">
 var code;
    window.onload=function(){
        switchCode();
    }
function switchCode(){
     var arrays=new Array(  
                '1','2','3','4','5','6','7','8','9','0',  
                'a','b','c','d','e','f','g','h','i','j',  
                'k','l','m','n','o','p','q','r','s','t',  
                'u','v','w','x','y','z',  
                'A','B','C','D','E','F','G','H','I','J',  
                'K','L','M','N','O','P','Q','R','S','T',  
                'U','V','W','X','Y','Z'               
            );  
            code='';//重新初始化验证码  
            //alert(arrays.length);  
            //随机从数组中获取四个元素组成验证码  
            for(var i=0;i<4;i++){  
            //随机获取一个数组的下标  
                var r=parseInt(Math.random()*arrays.length);  
                code+=arrays[r];  
                //alert(arrays[r]);  
            }  
            //alert(code);  
            $("#varifycode").html(code); 
            //document.getElementById('varifycode').innerHTML=code;//将验证码写入指定区域  
}

</script>
<script type="text/javascript">
  var app=angular.module('compareLogin',[]) 
  app.config(['$interpolateProvider', function($interpolateProvider) {
  $interpolateProvider.startSymbol('[[');
  $interpolateProvider.endSymbol(']]');
}]);

app.controller('login',['$scope','$http',function($scope,$http){
 $scope.asave= function(){
     $http({
             method: 'POST',
             url:'/login',
             data:$.param($scope.formData), // pass in data as strings
             headers: {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}  
         }).success(function (data) {
if(data.errno==0x00){
     layer.alert("用户您好,您已成功登陆到比价网站!",{icon:1});
      setTimeout(function(){
        location.href="/";
    },500);
}else if(data.errno==0x10){
layer.alert("管理员您好,您已成功登陆!",{icon:1});
  setTimeout(function(){
    location.href="/comparewebs-admin";
},500);
}else if(data.errno==0x13){
    layer.alert("用户名或者密码错误!",{icon:5});
}
         });


 };
}]);

app.controller('register',['$scope','$http',function($scope,$http){
 $scope.asave= function(){
   //$scope.formData.Username
   if($scope.formData.VarifyCode==code){
   
         $http({
             method: 'POST',
             url:'/reg',
             data:$.param($scope.formData), // pass in data as strings
             headers: {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}  
         }).success(function (data) {
    if(data.errno==0x00){
      layer.msg('注册成功', {
               offset: 0,
               shift: 6
});
       setTimeout(function(){
   location.href="/login";
       },1000);
    
    }else if(data.errno==0x16){
      layer.alert("用户已存在,请重新注册",{icon:5});
    }
 
});
}else{
     layer.alert("验证码输入错误,请重新输入",{icon:4});
}

  };
  }]);
</script>



{{end}}
</html>