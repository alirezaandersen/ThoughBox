function linkKeyPress(e) {
  if (e.keyCode === 13) { // 13 === Enter key
    e.preventDefault();
    this.blur();
  }
}

function stripHtml(str){
  return str.replace(/<(?:.|\n)*?>/gm, '');
}

function linkBlur(e) {
  var
    $this = $(this),
    id = Number($(this).attr('id').match(/^(\d+)-/)[1]),
    linkTitle = stripHtml($this.html().split(': </strong>')[0]),
    linkUrl = $this.html().split(': </strong>')[1];
  changeData(id, linkTitle, linkUrl);
}

function editLink(e) {
  var
    $linkText = $(this).siblings('li'),
    id = e.data.id;

  $linkText.attr('contenteditable', 'true');
  $linkText.focus();
}

  var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');
function changeData(id, linkTitle, linkUrl) {
  var data = {authenticity_token: AUTH_TOKEN,title: linkTitle, url: linkUrl};

  $.ajax({
    url: "api/v1/links/" + id,
    method: "PATCH",
    data: data
  });
}
