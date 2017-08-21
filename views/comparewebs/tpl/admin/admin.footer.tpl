<footer class="main-footer" style="text-align:center;">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
        比价后台管理系统
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="/">数字货币比价平台</a></strong>
</footer>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
        <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
        <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
        <!-- Home tab content -->
        <div class="tab-pane active" id="control-sidebar-home-tab">
            <h3 class="control-sidebar-heading">Recent Activity</h3>
            <ul class="control-sidebar-menu">
                <li>
                    <a href="javascript:;">
                        <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                        <div class="menu-info">
                            <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                            <p>Will be 23 on April 24th</p>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- /.control-sidebar-menu -->

            <h3 class="control-sidebar-heading">Tasks Progress</h3>
            <ul class="control-sidebar-menu">
                <li>
                    <a href="javascript:;">
                        <h4 class="control-sidebar-subheading">
                            Custom Template Design
                            <span class="pull-right-container">
                  <span class="label label-danger pull-right">70%</span>
                </span>
                        </h4>

                        <div class="progress progress-xxs">
                            <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- /.control-sidebar-menu -->

        </div>
        <!-- /.tab-pane -->
        <!-- Stats tab content -->
        <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
        <!-- /.tab-pane -->
        <!-- Settings tab content -->
        <div class="tab-pane" id="control-sidebar-settings-tab">
            <form method="post">
                <h3 class="control-sidebar-heading">General Settings</h3>

                <div class="form-group">
                    <label class="control-sidebar-subheading">
                        Report panel usage
                        <input type="checkbox" class="pull-right" checked>
                    </label>

                    <p>
                        Some information about this general settings option
                    </p>
                </div>
                <!-- /.form-group -->
            </form>
        </div>
        <!-- /.tab-pane -->
    </div>
</aside>
<!-- /.control-sidebar -->
<!-- Add the sidebar's background. This div must be placed
     immediately after the control sidebar -->
<div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.3 -->
<script src="/static/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/AdminLTE/dist/js/app.min.js"></script>

<script src="/static/js/layer.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    //添加用户
$("#addUser").click(function(){
 layer.open({
        type: 1,
        closeBtn: false,
        shift: 7,
        shadeClose: true,
        content: "<div style='width:350px;'><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入用户名</p><input id='username' class='form-control' type='text' name='username' /></div><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入密码</p><input id='password' class='form-control' type='text' name='password' /></div><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入邮箱</p><input id='email' class='form-control' type='text' name='email' /></div><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入手机号</p><input id='tel' class='form-control' type='text' name='tel' /></div>" +
  "<button style='margin-top:5%;width:80%;margin:0 auto;margin-bottom:5%;' type='button' class='btn btn-block btn-primary btn-lg comparewebs-button-color' onclick='addUsers()'>添加</button></div>"
    });
});

//删除用户
$(".delUserRow").click(function() { 
var uid=$(this).attr("id") 
         $.ajax({
               type: "POST",
               url: "/del",
               data:"uid="+uid,
               success: function(data){
                  if(data.errno==0x00){
         layer.alert("删除用户成功!",{icon:1});
            $("#" + uid).parent().parent().remove();
        }
        }
          });



});

//编辑用户
$(".editUserRow").click(function() { 
  var userid=$(this).attr("id");
    var username=$(this).parent().parent().children('td').eq(1).attr("id");
    var email=$(this).parent().parent().children('td').eq(3).attr("id");
    var password =$(this).parent().parent().children('td').eq(2).attr("id");
    var tel=$(this).parent().parent().children('td').eq(4).attr("id");
    var authrity=$(this).parent().parent().children('td').eq(7).attr("id");
    var other_authrity;
    if(authrity=="true"){
         other_authrity=false;
    }else{
        other_authrity=true;
    }
    //  <input type="radio" name="load_type" value="true" title="原创" checked>
 layer.open({
        type: 1,
        closeBtn: false,
        shift: 7,
        shadeClose: true,
        content: "<div style='width:350px;'><div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入新用户名</p><input id='newusername' class='form-control' type='text' name='username' value='"+username+"'/></div>" +
        "<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入新邮箱</p><input id='newemail' class='form-control' type='email' name='email' value='"+email+"' /></div>"+
        "<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入新手机号</p><input id='newtel' class='form-control' type='text' name='tel' value='"+tel+"' /></div>"+ "<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>请输入新密码</p><input id='newpassword' class='form-control' type='password' name='password' value='"+password+"' /></div>"+"<div style='width:320px;margin-left: 3%;' class='form-group has-feedback'><p>选择授权</p><input id='newauthrity'  type='radio' name='authrity' value='"+authrity+"' title='"+authrity+"' checked/>"+authrity+"<input id='newauthrity'  type='radio' name='authrity' value='"+other_authrity+"' title='"+other_authrity+"' style='margin-left: 15px;' />"+other_authrity+"</div>"+
        "<button style='margin-top:5%;width:80%;margin:0 auto;margin-bottom:5%;' type='button' class='btn btn-block btn-primary btn-lg' onclick='updateUsers("+userid+")'>修改</button></div>"
    });

    });

});

//添加用户接口交互
function addUsers(){
 var username=$("input#username").val(); 
 var pwd=$("input#password").val(); 
 var email=$("input#email").val();
 var tel=$("input#tel").val();

     $.ajax({
               type: "POST",
               url: "/reg",
               data: "Username="+username+"&Password="+pwd+"&Email="+email+"&Phone="+tel,
               success: function(data){
 if(data.errno==0x00){
    layer.alert("添加用户成功!",{icon:1});
       setTimeout(function(){
   location.href="/comparewebs-admin";
       },300);
    
    }else if(data.errno==0x16){
      layer.alert("该用户已存在!",{icon:5});
    }
             
        }
               });
}


function updateUsers(userid){
 var USERNAME=$("input#newusername").val(); 
 var EMAIL=$("input#newemail").val(); 
 var PWD=$("input#newpassword").val(); 
 var TEL=$("input#newtel").val();
 var AUTH=$('input:radio:checked').val();
  $.ajax({
               type: "POST",
               url: "/edit",
               data: "uid="+userid+"&Username="+USERNAME+"&Password="+PWD+"&Email="+EMAIL+"&Phone="+TEL+"&Authority="+AUTH,
               success: function(data){
                 layer.alert("修改成功!",{icon:1});
                //layer.closeAll();
               setTimeout(function(){
             location.href="/comparewebs-admin";
         },300);

        }
               });
}

</script>


</body>
</html>