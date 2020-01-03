class MovieModel{
  List _movies = [];
  String _title = "";
  int _index = 0;

  get title=>_title;
  get movies=>_movies;
  get index=>_index;
  
  choose(n){
    _index = n;
  }

  update(list){
    _movies = list;
  }

  changeTitle(){
    _title = "well done";
  }

}