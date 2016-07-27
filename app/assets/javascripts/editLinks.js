function linkKeyPress(e) {
  if (e.keyCode === 13) { // 13 === Enter key
    e.preventDefault();
    this.blur();
  }
}

function linkBlur(e) {
  var
    $this = $(this),
    id = Number($(this).attr('id').match(/^(\d+)-/)[1]),
    linkTitle = $(this).find('.link-title').text(),
    linkUrl = $(this).find('.link-url').text();

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
  var data = {
    authenticity_token: AUTH_TOKEN,
    title: linkTitle,
    url: linkUrl
  };
  updateLinkById(id,data);
}
