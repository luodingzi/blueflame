<?php
$urls = array(
    'http://www.cbf.com.cn/index.php?s=/home/index/example.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/media.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/press.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/content/id/2.html',
    'http://www.cbf.com.cn/index.php',
    'http://www.cbf.com.cn/',
    'http://www.cbf.com.cn/index.php?s=/home/index/team.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/content/id/6.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/cases/id/15.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/cases/id/47.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/product/id/23.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/product/id/25.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/product/id/24.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/news/id/6.html',
    'http://www.cbf.com.cn/index.php?s=/home/index/news/id/7.html',
);
$api = 'http://data.zz.baidu.com/urls?site=www.cbf.com.cn&token=BtJARbxlyOPM0IGs';
$ch = curl_init();
$options =  array(
    CURLOPT_URL => $api,
    CURLOPT_POST => true,
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_POSTFIELDS => implode("\n", $urls),
    CURLOPT_HTTPHEADER => array('Content-Type: text/plain'),
);
curl_setopt_array($ch, $options);
$result = curl_exec($ch);
echo $result;
?>