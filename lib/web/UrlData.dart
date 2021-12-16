class UrlData {

  static String urlForDetailInfo(int detailId) {
    return "https://hacker-news.firebaseio.com/v0/item/${detailId}.json?print=pretty";
  }


// "topstories","newstories","askstories","showstories","jobstories"

  static String urlForCategoryID(String id) {
    return "https://hacker-news.firebaseio.com/v0/${id}.json?print=pretty";
  }

}