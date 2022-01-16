class items_info_Model {
  int ii_i_id;
  String ii_i_title;
  

  items_info_Model({
    this.ii_i_id = 0,
    this.ii_i_title = "",
  });

  items_info_Model fromJson(Map<String, dynamic> json) {
    return items_info_Model(
      ii_i_id: json["ii_i_id"] as int,
      ii_i_title: json["ii_i_title"] as String,
    );
  }
}
