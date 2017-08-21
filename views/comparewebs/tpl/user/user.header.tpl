<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>{{.AllFrontInfo.WebsiteTitle}}</title>
    <meta charset="utf-8">
 <!--    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <meta name="description" content="{{.AllFrontInfo.WebsiteDes}}"/>
    <meta name="keywords" content="{{.AllFrontInfo.WebsiteKeyword}}" />

       {{if .IsUserLogin}}
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
      {{end}}
      
     <link rel="shortcut icon" type="image/x-icon" href="/static/css/images/BTC_logo.png">
     <link rel="stylesheet" type="text/css" href="/static/css/all.min.css">
     {{if .IsUserIndex}}
     <link rel="stylesheet" type="text/css" href="/static/css/style.css">  
     {{end}}

     {{if .IsUserLogin}}
   <link rel="stylesheet" type="text/css" href="/static/css/admin.css">
     {{end}}

     <link rel="stylesheet" type="text/css" href="http://zcjy2.wiswebs.com/wp-content/themes/website/css/animate.css">
     <script src="http://zcjy2.wiswebs.com/wp-content/themes/website/js/wow.min.js"></script>
     
     <script type="text/javascript">
                        wow = new WOW(
                            {
                                animateClass: 'animated',
                                offset:       100,
                                callback:     function(box) {
                                    console.log("WOW: animating <" + box.tagName.toLowerCase() + ">")
                                }
                            }
                        );
                        wow.init();
     </script>

            <!--[if lt IE 9]>
              <script src="http://zcjy2.wiswebs.com/wp-content/themes/website/js/html5-fit.min.js"></script>
              <script src="http://zcjy2.wiswebs.com/wp-content/themes/website/js/html5-res.min.js"></script>
            <![endif]-->
 
    <!-- <script src="http://zcjy2.wiswebs.com/wp-content/themes/website/js/jquery.min.js"></script> -->
<script src="http://libs.baidu.com/jquery/2.1.1/jquery.min.js"></script>

    <body>