class ToutiaoEntity {
	ToutiaoResult result;
	String reason;
	int errorCode;

	ToutiaoEntity({this.result, this.reason, this.errorCode});

	ToutiaoEntity.fromJson(Map<String, dynamic> json) {
		result = json['result'] != null ? new ToutiaoResult.fromJson(json['result']) : null;
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

class ToutiaoResult {
	String stat;
	List<ToutiaoResultData> data;

	ToutiaoResult({this.stat, this.data});

	ToutiaoResult.fromJson(Map<String, dynamic> json) {
		stat = json['stat'];
		if (json['data'] != null) {
			data = new List<ToutiaoResultData>();
			json['data'].forEach((v) { data.add(new ToutiaoResultData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['stat'] = this.stat;
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ToutiaoResultData {
	String date;
	String authorName;
	String thumbnailPicS;
	String uniquekey;
	String thumbnailPicS03;
	String thumbnailPicS02;
	String title;
	String category;
	String url;

	ToutiaoResultData({this.date, this.authorName, this.thumbnailPicS, this.uniquekey, this.thumbnailPicS03, this.thumbnailPicS02, this.title, this.category, this.url});

	ToutiaoResultData.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		authorName = json['author_name'];
		thumbnailPicS = json['thumbnail_pic_s'];
		uniquekey = json['uniquekey'];
		thumbnailPicS03 = json['thumbnail_pic_s03'];
		thumbnailPicS02 = json['thumbnail_pic_s02'];
		title = json['title'];
		category = json['category'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['author_name'] = this.authorName;
		data['thumbnail_pic_s'] = this.thumbnailPicS;
		data['uniquekey'] = this.uniquekey;
		data['thumbnail_pic_s03'] = this.thumbnailPicS03;
		data['thumbnail_pic_s02'] = this.thumbnailPicS02;
		data['title'] = this.title;
		data['category'] = this.category;
		data['url'] = this.url;
		return data;
	}
}
