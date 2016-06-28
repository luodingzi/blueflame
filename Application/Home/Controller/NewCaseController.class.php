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
class NewCaseController extends HomeController {

	//系统首页
    public function index(){
        $case = M("newcase");
        $this->newcase_data = $case->order("addtime desc")->select();
        // echo "<pre>";
        // print_r($newcase_data);exit();

        $this->display();
    }

    public function product($id=0){
        $case = M('newcase');
        $this->news = $case->find($id);
        $this->next_news = $case->where("id<".$id)->order("id desc")->limit('1')->find();
        $this->pre_news = $case->where("id>".$id)->order("id asc")->limit('1')->find();

        $this->display();
    }

    public function media($id=0){
        $public = A('Public');
        //加入我们
        $this->join_data = $public->join_info();
        //案例
        $this->case_data = $public->case_info();
        //具体案例
        $this->cases_data1 = $public->cases1_info();
        $this->cases_data2 = $public->cases2_info();
        $this->cases_data3 = $public->cases3_info();
        $this->cases_data4 = $public->cases4_info();
        $this->cases_data5 = $public->cases5_info();
        $this->cases_data6 = $public->cases6_info();

        $case = M('newcase');
        $this->newcase_data = $case->order("addtime desc")->select();
        $this->news = $case->find($id);
        $this->next_news = $case->where("id<".$id)->order("id desc")->limit('1')->find();
        $this->pre_news = $case->where("id>".$id)->order("id asc")->limit('1')->find();

        $this->display();
    }

}