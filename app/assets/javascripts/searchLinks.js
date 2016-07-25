function setup_search_events(){
  function searchMatch(body, searchStr) {
    return body.indexOf(searchStr) >= 0;
  }

  $('#search-bar').unbind('keyup');
  $('#search-bar').keyup(function(event){
    var input = toLowerCase($(this).val());
    console.log(input);
    $('.link').each(function(){
      body = toLowerCase($(this).find('li').text());
      if(searchMatch(body,input)){
        $(this).show();
      }
      else{
        $(this).hide();
      }
    });
  });
}
