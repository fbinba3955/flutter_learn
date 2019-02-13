class WeixinEntity {
	WeixinResult result;
	String reason;
	int errorCode;

	WeixinEntity({this.result, this.reason, this.errorCode});

	WeixinEntity.fromJson(Map<String, dynamic> json) {
		result = json['result'] != null ? new WeixinResult.fromJson(json['result']) : null;
		reason = json['reason'];
		errorCode = json['error_code'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] = this.result.toJson();
    }
		data['reason'] = this.reason;
		data['error_code'] = this.errorCode;
		return data;
	}
}

class WeixinResult {
	int pno;
	int ps;
	int totalpage;
	List<WeixinResultList> xList;

	WeixinResult({this.pno, this.ps, this.totalpage, this.xList});

	WeixinResult.fromJson(Map<String, dynamic> json) {
		pno = json['pno'];
		ps = json['ps'];
		totalpage = json['totalPage'];
		if (json['list'] != null) {
			xList = new List<WeixinResultList>();
			json['list'].forEach((v) { xList.add(new WeixinResultList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pno'] = this.pno;
		data['ps'] = this.ps;
		data['totalPage'] = this.totalpage;
		if (this.xList != null) {
      data['list'] = this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class WeixinResultList {
	String firstimg;
	String id;
	String source;
	String title;
	String mark;
	String url;

	WeixinResultList({this.firstimg, this.id, this.source, this.title, this.mark, this.url});

	WeixinResultList.fromJson(Map<String, dynamic> json) {
		firstimg = json['firstImg'];
		id = json['id'];
		source = json['source'];
		title = json['title'];
		mark = json['mark'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['firstImg'] = this.firstimg;
		data['id'] = this.id;
		data['source'] = this.source;
		data['title'] = this.title;
		data['mark'] = this.mark;
		data['url'] = this.url;
		return data;
	}
}
