<?php

namespace Home\Controller;

use User\Api\UseApi;

class PublicController extends HomeController{

	/*join*/
	public function join_info(){
		$join = M('join');
		$join_data = $join->order("createtime desc")->select();
		return $join_data;
	}



	//cases
	public function cases1_info(){
		$cases = M('cases');
		$cases1 = $cases->where("cid=1")->select();

		return $cases1;
	}
	public function cases2_info(){
		$cases = M('cases');
		$cases2 = $cases->where("cid=2")->select();

		return $cases2;
	}
	public function cases3_info(){
		$cases = M('cases');
		$cases3 = $cases->where("cid=3")->select();

		return $cases3;
	}
	public function cases4_info(){
		$cases = M('cases');
		$cases4 = $cases->where("cid=4")->select();

		return $cases4;
	}
	public function cases5_info(){
		$cases = M('cases');
		$cases5 = $cases->where("cid=5")->select();

		return $cases5;
	}
	public function cases6_info(){
		$cases = M('cases');
		$cases6 = $cases->where("cid=6")->select();

		return $cases6;
	}



}