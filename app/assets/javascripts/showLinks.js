function getLinks() {
  $.get('/api/v1/links', function(links) {
    links.forEach(function(link){
      renderLink(link);
      addEventListeners(link);
    });
  });
}

function getMarkedOrUnmarkedContent(link){
  var content = '';
  content +='<li id="' + link.id + '-li"';
  content += link.read === true ? 'class="read-link">' : '>';
  content += '<strong>' + link.title + ': </strong> ' + link.url + '</li>';
  return content;
}

function getMarkedOrUnmarkedButton(link){
  var buttonContent = '';
  if(link.read === true){
    buttonContent += '<button class="btn btn-default hide" id="' + link.id + '-read">Mark as Read</button>';
    buttonContent += '<button class="btn btn-default" id="' + link.id + '-unread">Mark as Unread</button>';
  }
  else{
    buttonContent += '<button class="btn btn-default" id="' + link.id + '-read">Mark as Read</button>';
    buttonContent += '<button class="btn btn-default hide" id="' + link.id + '-unread">Mark as Unread</button>';
  }
  return buttonContent;
}

function renderLink(link) {
  var
    linkContent = '',
    $linkDiv;

  linkContent += '<div class="link" id="' + link.id + '-link">';
  linkContent += getMarkedOrUnmarkedContent(link);
  linkContent += getMarkedOrUnmarkedButton(link);
  linkContent += '<button class="btn btn-default" id="' + link.id + '-edit">Edit</button></div>';

  $linkDiv = $(linkContent);
  $('.links').append($linkDiv);
}

function addEventListeners(link) {
  $('#' + link.id + '-read').on('click', {id: link.id}, markAsRead);
  $('#' + link.id + '-unread').on('click', {id: link.id}, markAsUnread);
  $('#' + link.id + '-edit').on('click', {id: link.id}, editLink);
  $('#' + link.id + '-li').on('keypress', linkKeyPress);
  $('#' + link.id + '-li').on('blur', linkBlur);
}
