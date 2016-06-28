<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){
        $lunbo = M("lunbo");
        $lunbo_data = $lunbo->order('createtime desc')->select();
        $this->lunbo = $lunbo_data;
    	 $this->title ="";

        $this->display();
    }
    public function join(){
    	$join = M('join');
    	$join_data = $join->order('createtime desc')->select();
    	$this->join = $join_data;
    	$this->title = "加入我们-";

    	$this->display();
    }
    //蓝火案例
    public function example(){
    	$public = A('Public');
    	$examples = M('case');
    	$examples_data = $examples->select();
    	$this->example = $examples_data;
    	//具体案例
    	$this->cases_data1 = $public->cases1_info();
    	$this->cases_data2 = $public->cases2_info();
    	$this->cases_data3 = $public->cases3_info();
    	$this->cases_data4 = $public->cases4_info();
    	$this->cases_data5 = $public->cases5_info();
    	$this->cases_data6 = $public->cases6_info();
    	// echo "<pre>";
    	// print_r($cases_data2);exit();
    	$cases = M('cases');
    	$cases_data = $cases->find($id);
    	$this->cases = $cases_data;
    	$this->title = "蓝火案例-";

    	$this->display();
    }
    //具体案例
    public function cases($id){
    	$public = A('public');
    	//具体案例
    	$this->cases_data1 = $public->cases1_info();
    	$this->cases_data2 = $public->cases2_info();
    	$this->cases_data3 = $public->cases3_info();
    	$this->cases_data4 = $public->cases4_info();
    	$this->cases_data5 = $public->cases5_info();
    	$this->cases_data6 = $public->cases6_info();
    	// echo "<pre>";
    	// print_r($cases_data2);exit();
    	$cases = M('cases');
    	$cases_data = $cases->find($id);
    	$this->cases = $cases_data;
    	$this->title = $cases_data['title']."-";
    	$this->display();
    }
    //新闻热报
    public function press($p=1){
    	$press = M('news');
    	$press_data = $press->order('createtime desc')->select();
    	$this->press = $press_data;

    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
        $list = $press->where('id>0')->order('createtime desc')->page($p . ',6')->select();
        $i = 1;
        $list2 = array();
        foreach ($list as $value) {
            if($i<=2){
                $value['new'] = 1;
            }
            $list2[] = $value;
            $i++;
        }

        $this->assign('list', $list2); // 赋值数据集
        $count = $press->where('id>0')->count(); // 查询满足要求的总记录数
        $Page = new \Think\Page($count, 6); // 实例化分页类 传入总记录数和每页显示的记录数

        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show); // 赋值分页输出
    	$this->title = "新闻热报-";

    	$this->display();
    }
    //具体新闻
    public function news($id=0){
    	$news = M('news');
    	$news_data = $news->find($id);
    	$this->next_news = $news->where("id<".$id)->order("id desc")->limit('1')->find();
    	$this->pre_news = $news->where("id>".$id)->order("id asc")->limit('1')->find();
    	$this->news_data = $news_data;
    	$this->title = $news_data['title']."-";
    	$this->display();
    }
    //精英团队
    public function team($p=1){
    	$teams = M('team');

    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
        $list = $teams->where('id>0')->page($p . ',8')->select();
        $this->assign('list', $list); // 赋值数据集
        $count = $teams->where('id>0')->count(); // 查询满足要求的总记录数
        $Page = new \Think\Page($count, 8); // 实例化分页类 传入总记录数和每页显示的记录数

        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show); // 赋值分页输出


    	$this->title = "精英团队-";

    	$this->display();
    }
    //个人信息
    public function person($id=0){
    	$persons = M('team');
    	$person_data = $persons->find($id);
    	$this->person = $person_data;
    	$this->title = $person_data['info']."-";

    	$this->display();
    }
    //留言处理
    public function message(){
    	$data = M('message');
		$content = array(
            'company' => $_POST['company'],
            'username' => $_POST['username'],
            'sex' => $_POST['sex'],
            'phone' => $_POST['phone'],
            'email' => $_POST['email'],
            'content' => $_POST['content']
        );
        // echo "<pre>";
        // print_r($content);exit();
        if ($data->add($content)) {
            $this->success('留言成功', 'http://www.cbf.com.cn',3);
        } else {
            $this->error('留言失败', 'http://www.cbf.com.cn',3);
        }
    }
    //内容页
    public function content($id=0){
    	$content = M('content');
    	$content_data = $content->find($id);
    	$this->content = $content_data;
    	$this->title = $content_data['title']."-";

    	$this->display();
    }
    //影视作品
    public function media($p=1){
    	$media = M('media');

    	// 进行分页数据查询 注意page方法的参数的前面部分是当前的页数使用 $_GET[p]获取
        $list = $media->where('id>0')->order('addtime desc')->page($p . ',8')->select();
        $this->assign('list', $list); // 赋值数据集
        $count = $media->where('id>0')->count(); // 查询满足要求的总记录数
        $Page = new \Think\Page($count, 8); // 实例化分页类 传入总记录数和每页显示的记录数

        $show = $Page->show(); // 分页显示输出
        $this->assign('page', $show); // 赋值分页输出

        $this->title = "影视作品赏-";

    	$this->display();
    }
    //微电影
    public function wei(){
    	$media = M('media');
    	$wei = $media->limit('4')->order('rand()')->select();
    	$this->wei = $wei;
    	$this->title = "微电影中国-";

    	$this->display();
    }
    //品牌战略
    public function partner(){
    	$partner = M('partner');

    	$partners = $partner->select();
    	$this->partner = $partners;
    	$this->title = "品牌战略合作伙伴-";

    	$this->display();
    }
    //具体影视作品
    public function product($id=0){
    	$product = M('media');
        $products_data = $product->find($id);
        $this->products = $products_data;
        $this->next_products = $product->where("id<".$id)->order("id desc")->limit('1')->find();
        $this->pre_products = $product->where("id>".$id)->order("id asc")->limit('1')->find();
        $this->title = $products_data['title']."-";
        $this->display();
    }
}