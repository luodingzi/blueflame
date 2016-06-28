<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
<title><?php echo ($title); ?>蓝色火焰</title>
<meta name="keyword" content="4A广告公司 蓝色火焰 蓝火文化 广告策划 品牌策划 广州蓝火" />
<meta name="description" content="广州蓝火文化传播公司（蓝色火焰广告）是老牌4A广告公司，经典案例有阿拉善、爱膜逆、创维电视、中华轿车、南航、慕思家具等" /> 
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="Public/blue.ico" />
<link href="Public/Home/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="Public/Home/css/style.css">


<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="/blueflame/Public/static/bootstrap/js/html5shiv.js"></script>
<![endif]-->

<!--[if lt IE 9]>
<script type="text/javascript" src="/blueflame/Public/static/jquery-1.10.2.min.js"></script>
<![endif]-->
<!--[if gte IE 9]><!-->
<script src="Public/Home/js/jquery-1.11.1.min.js"></script>
<script src="Public/Home/js/bootstrap.min.js"></script>
<script src="Public/Home/js/style.js"></script>
<!--<![endif]-->
<!-- 页面header钩子，一般用于加载插件CSS文件和代码 -->
<?php echo hook('pageHeader');?>

</head>
<body>
	<!-- 头部 -->
	
<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="" href="index.php"><img style="height:50px;margin-right:65px" src="Public/Home/images/logo.png" alt="蓝火logo"></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.php">首页</a></li>
                <li><a href="/blueflame/index.php?s=/home/index/content/id/2.html" >关于蓝火</a></li>
                <li><a href="/blueflame/index.php?s=/home/index/example.html">蓝火案例</a></li>
                <li><a href="/blueflame/index.php?s=/home/index/team.html">精英团队</a></li>
                <li><a href="/blueflame/index.php?s=/home/index/join.html">加入我们</a></li>
                <li><a href="http://weibo.com/u/2534480734" target="_blank">蓝火微博</a></li>
            </ul>
        </div>
    </div>
</div>

	<!-- /头部 -->
	
	<!-- 主体 -->
	

<div class="container">
    <div class="case">
        <?php echo ($cases["content"]); ?>
    </div>
</div>


	<!-- /主体 -->

	<!-- 底部 -->
	
    <!-- 底部-->

    <!-- 联系 -->
    <div class="modal fade" id="message" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">给我们留言</h4>
                </div>
                <div class="modal-body">
                    
                    <form class="form-horizontal" action="/blueflame/index.php?s=/home/index/message" method="post">
                      <div class="form-group">
                        <label for="inputcompany3" class="col-sm-2 control-label">公司名称</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputcompany3" name="company" placeholder="公司名称">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputname3" class="col-sm-2 control-label">你的名字</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputname3" name="username" placeholder="姓名">
                        </div>
                      </div>
                     <div class="form-group">
                        <label for="inputname3" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                          <input type="radio" name="sex" id="sex" value="先生"> 先生
                          <input type="radio" name="sex" id="sex" value="女士"> 女士
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputphone3" class="col-sm-2 control-label">联系电话</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="inputphone3" name="phone" placeholder="联系电话">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputemail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputemail3" name="email" placeholder="Email">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputemail3" class="col-sm-2 control-label">留言内容</label>
                        <div class="col-sm-10">
                          <textarea class="form-control" name="content" rows="3"></textarea>
                        </div>
                      </div>
                      
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" name="sub" class="btn btn-default">提交</button>
                           <button type="reset" name="reset" class="btn btn-default">重置</button>
                        </div>
                      </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>


    <footer>
        <p style="text-align:center;color:#fff;"><a href="/blueflame/index.php?s=/home/index/content/id/1.html">联系我们</a> | <a href="#" data-toggle="modal" data-target="#message">给我们留言</a> | <a href="http://www.miibeian.gov.cn/" target="_blank">粤ICP备12091022号</a> | Copyright &copy; 2014 <a href="index.php" >广州市蓝火文化传播有限公司</a> 版权所有</p>
    </footer>

<script type="text/javascript">
(function(){
	var ThinkPHP = window.Think = {
		"ROOT"   : "/blueflame", //当前网站地址
		"APP"    : "/blueflame/index.php?s=", //当前项目地址
		"PUBLIC" : "/blueflame/Public", //项目公共目录地址
		"DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
		"MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
		"VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
	}
})();
</script>
 <!-- 用于加载js代码 -->
<!-- 页面footer钩子，一般用于加载插件JS文件和JS代码 -->
<?php echo hook('pageFooter', 'widget');?>
<div class="hidden"><!-- 用于加载统计代码等隐藏元素 -->
	
</div>

	<!-- /底部 -->
</body>
</html>