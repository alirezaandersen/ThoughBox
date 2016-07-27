function filtersReadLinks(){
  $('.link').show();
  $('.read-link').parent().hide();
}
function filtersUnreadLinks(){
  $('.link').hide();
  $('.read-link').parent().show();
}

var count = 1;
function sortByText(a, b) {
  if (a.text < b.text) {
    return - 1;
  }
  if (a.text > b.text) {
    return 1;
  }
  return 0;
}

function addElements(elements){
  for(let obj of elements){
    $('.links').append(obj.element);
  }
}

var original =[], sorted =[];
function computeOriginal(){
  original = $('.link').map(function () {
    return {
      element: this,
      text: $(this).find('li').text()
    };
  });
}

function computeSorted(){
  var temp = $.extend(true, {}, original);
  sorted = Array.from(temp).sort(sortByText);
}

function sortAlphabetically(){
  if (count === 1){
    computeOriginal();
  }

  if( (count % 2) === 0){
    addElements(original);
  }
  else{
    computeSorted();
    addElements(sorted);
  }
  ++count;
}
